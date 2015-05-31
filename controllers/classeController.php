<?php

/**
 * http://uni-graz.at/~vollmanr/unicode/uni_letter_e.html
 * http://www.fileformat.info/info/unicode/char/1db0/index.htm
 */
class classeController extends Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        $view = new View();
        $data = $this->Classe->selectAll();
        $comboClasse = new Combobox($data, "classes", "IDCLASSE", "LIBELLE");
        $comboClasse->first = " ";
        $view->Assign("classes", $comboClasse->view());
        $content = $view->Render("classe" . DS . "index", false);
        $this->Assign("content", $content);
    }

    private function showClasses() {
        $classes = $this->Classe->selectAll();
        $grid = new Grid($classes, 0);
        $grid->addcolonne(0, "ID", "IDCLASSE", false);
        $grid->addcolonne(1, "Code", "NIVEAUSELECT");
        $grid->addcolonne(2, "Libellé", "LIBELLE");
        $grid->addcolonne(3, "Découpage", "FK_DECOUPAGE");
        $grid->editbutton = true;
        $grid->deletebutton = true;
        /* $this->Assign("content", (new View())->output(array("classes",
          $grid->display(),
          "errors", false), false)); */
        $view = new View();
        $view->Assign("classes", $grid->display());
        $view->Assign("errors", false);
        $view->Assign("total", count($classes));
        $content = $view->Render("classe" . DS . "showClasses", false);
        $this->Assign("content", $content);
    }

    public function saisie() {
        $this->view->clientsJS("classe" . DS . "classe");
        if(!empty($this->request->idclasse)){
            //Faire un dernier update si on clique sur okay
            $params = ["LIBELLE" => $this->request->libelle,"DECOUPAGE" => $this->request->decoupage,
            "NIVEAU" => $this->request->niveau, "ANNEEACADEMIQUE" => $this->session->anneeacademique];
            $this->Classe->update($params, ["IDCLASSE" => $this->request->idclasse]);
        }
        if (!isset($this->request->saisie)) {
            $this->showClasses();
        } else {
            $view = new View();
            $view->Assign("errors", false);
            $this->loadModel("inscription");
            //Envoyer seulement la liste des eleves non inscrits pour cette periode academique
            $elevesnoninscrits = $this->Inscription->getNonInscrits($this->session->anneeacademique);
            $comboEleve = new Combobox($elevesnoninscrits, "listeeleve", "IDELEVE", "CNOM");
            $view->Assign("comboEleves", $comboEleve->view());


            $this->loadModel("personnel");
            $pers = $this->Personnel->selectAll();
            $comboEnseignants = new Combobox($pers, "listeenseignant", "IDPERSONNEL", "CNOM");
            $view->Assign("comboEnseignants", $comboEnseignants->view());

            $this->loadModel("responsable");
            $data = $this->Responsable->selectAll();
            $comboResponsables = new Combobox($data, "listeresponsable", "IDRESPONSABLE", "CNOM");
            $view->Assign("comboResponsables", $comboResponsables->view());

            $this->loadModel("matiere");
            $mat = $this->Matiere->selectAll();
            $comboMatieres = new Combobox($mat, "listematiere", "IDMATIERE", "LIBELLE");
            $view->Assign("comboMatieres", $comboMatieres->view());

            $this->loadModel("niveau");
            $niveau = $this->Niveau->selectAll();
            $comboNiveau = new Combobox($niveau, "niveau", "IDNIVEAU", "NIVEAUSELECT");
            $view->Assign("comboNiveau", $comboNiveau->view());

            $this->loadModel("groupe");
            $groupe = $this->Groupe->selectAll();
            $groupeCombo = new Combobox($groupe, "groupe", "IDGROUPE", "DESCRIPTION");
            $view->Assign("comboGroupe", $groupeCombo->view());
            
            $content = $view->Render("classe" . DS . "saisie", false);
            $this->Assign("content", $content);
        }
    }

   

    public function edit($id) {
        $view = new View();
        $content = $view->Render("classe" . DS . "edit", false);
        $this->Assign("content", $content);
    }

    public function ajax($zone) {
        $json = array();
        //Obtenir l'id de la classe lors du premier appel
        $this->loadModel("classeparametre");
        $params = ["LIBELLE" => $this->request->libelle,
            "DECOUPAGE" => $this->request->decoupage,
            "NIVEAU" => $this->request->niveau,
            "ANNEEACADEMIQUE" => $this->session->anneeacademique];

        if (empty($this->request->idclasse)) {
            $this->Classe->insert($params);
            $idclasse = $this->Classe->lastInsertId();

            $this->Classeparametre->insert(['IDCLASSE' => $idclasse, "ANNEEACADEMIQUE" => $this->session->anneeacademique]);
        } else {
            $this->Classe->update($params, ["IDCLASSE" => $this->request->idclasse]);
            $idclasse = $this->request->idclasse;
        }
        $json[0] = $idclasse;
        $view = new View();
        $this->loadModel("inscription");
        $this->loadModel("personnel");
        $this->loadModel("responsable");
        $this->loadModel("enseignement");
        switch ($zone) {
            case "eleve":
                //Inscrire l'eleve dans  cette classe. Confere la methode inscrire de cette classe
                $elevesinscrits = $this->inscrire($idclasse);
                $view->Assign("eleves", $elevesinscrits);
                $json[1] = $view->Render("classe" . DS . "ajax" . DS . "eleve", false);

                //enlever de la liste les eleves deja inscrit
                $elevesnoninscripts = $this->Inscription->getNonInscrits($this->session->anneeacademique);
                $comboEleve = new Combobox($elevesnoninscripts, "listeeleve", "IDELEVE", "CNOM");
                $view->Assign("comboEleves", $comboEleve->view());
                $json[2] = $view->Render("classe" . DS . "ajax" . DS . "dialog-1", false);
                break;
            case "profprincipale":
                //Inserer le professeur principale
                $keys = ["IDCLASSE" => $idclasse, "ANNEEACADEMIQUE" => $this->session->anneeacademique];
                $this->Classeparametre->update(["PROFPRINCIPALE" => $this->request->identifiant], $keys);
                $prof = $this->Personnel->findSingleRowBy(["IDPERSONNEL" => $this->request->identifiant]);
                $view->Assign("prof", $prof);
                $json[1] = $view->Render("classe" . DS . "ajax" . DS . "profprincipale", false);
                $json[2] = SITE_ROOT . "public/img/btn_add_disabled.png";
                break;
            case "cpeprincipale":
                $keys = ["IDCLASSE" => $idclasse, "ANNEEACADEMIQUE" => $this->session->anneeacademique];
                $this->Classeparametre->update(["CPEPRINCIPALE" => $this->request->identifiant], $keys);
                $cpe = $this->Responsable->findSingleRowBy(["IDRESPONSABLE" => $this->request->identifiant]);
                $view->Assign("cpe", $cpe);
                $json[1] = $view->Render("classe" . DS . "ajax" . DS . "cpeprincipale", false);
                $json[2] = SITE_ROOT . "public/img/btn_add_disabled.png";
                break;
            case "adminprincipale":
                $keys = ["IDCLASSE" => $idclasse, "ANNEEACADEMIQUE" => $this->session->anneeacademique];
                $this->Classeparametre->update(["RESPADMINISTRATIF" => $this->request->identifiant], $keys);
                $admin = $this->Personnel->findSingleRowBy(["IDPERSONNEL" => $this->request->identifiant]);
                $view->Assign("admin", $admin);
                $json[1] = $view->Render("classe" . DS . "ajax" . DS . "adminprincipale", false);
                $json[2] = SITE_ROOT . "public/img/btn_add_disabled.png";
                break;
            case "ajoutmatiere":
                //Ajout de matiere
                $mat = json_decode($_POST['matiere']);
               
                $params = ["MATIERE" => $mat->matiere, "PROFESSEUR" => $mat->enseignant,
                    "CLASSE" => $idclasse, "GROUPE" => $mat->groupe, "COEFF" => $mat->coeff];
                $this->Enseignement->insert($params);
                $ens = $this->Enseignement->getEnseignements($idclasse);
                $view->Assign("enseignements", $ens);
                $json[1] = $view->Render("classe" . DS . "ajax" . DS . "matiere", false);
                $view->Assign("matieres", $this->Enseignement->getNonEnseignements($idclasse));
                $json[2] = $view->Render("classe" . DS . "ajax" . DS . "dialog-5", false);
                break;
        }
        echo json_encode($json);
    }

    /**
     * 
     * @param type $idclasse l'identifiant de la classe dans laquelle il faut inscrire un eleve
     * les informations de l'eleve sont contenues dans la variable request de @type Request
     * @return type $eleves liste des eleves inscrit dans cette classe
     */
    private function inscrire($idclasse) {
        //Charger les modeles exterieurs
        $this->loadModel("inscription");
        $this->loadModel("eleve");

        $params = ["IDELEVE" => $this->request->identifiant,
            "IDCLASSE" => $idclasse,
            "ANNEEACADEMIQUE" => $this->session->anneeacademique
        ];
        if ($this->Inscription->insert($params)) {
            $idinscription = $this->Inscription->lastInsertId();
            //Obtenir les informations de l'eleve inscript

            $eleve = $this->Eleve->findSingleRowBy(["IDELEVE" => $this->request->identifiant]);
            //Mettre a jour le matricule de l'eleve s'il n'avait pas de matricule
            if (empty($eleve['MATRICULE'])) {
                $matricule = $this->genererMatricule($idclasse);
                $this->Eleve->update(["MATRICULE" => $matricule], ['IDELEVE' => $this->request->identifiant]);
            }
        }
        //Retourne les eleves inscrits dans cette classe
        $eleves = $this->Inscription->getInscrits($idclasse, $this->session->anneeacademique);
        return $eleves;
    }

    /**
     * Implemente l'algorithme permettant de generer un matricule 
     * en fonction de la classe. 
     * @param type $idclasse
     * @return string
     */
    private function genererMatricule($idclasse) {
        //Retourne 15 dans le cas ou ANNEACADEMIQUE = 2014-2015
        $matric = substr($this->session->anneeacademique, -2);
        //Ajoute le niveau de la classe, Confere Table niveau et table classe
        $classe = $this->Classe->findSingleRowBy(["IDCLASSE" => $idclasse]);
        $this->loadModel("niveau");
        $niveau = $this->Niveau->findSingleRowBy(["IDNIVEAU" => $classe['NIVEAU']]);
        $matric .= $niveau['GROUPE'];
        //Ajoute le numero de l'eleve en faisant matricule du dernier eleve + 1

        $derniereleve = $this->Classe->findLastEleve($idclasse, $matric);
        //Si un dernier eleve existe alors concatener
        if ($derniereleve) {
            $matricule = intval($derniereleve['MATRICULE']) + 1;
        }
        //Si un dernier eleve n'existe, alors c'est le premier
        else {
            $matricule = intval($matric . "001");
        }
        return $matricule;
    }

    /**
     * Permet de supprimer le prof principale (action = 1), ou le 
     * cpe principale (action = 2) ou l'administrateur principale (action = 3)
     * Utilise avec ajax dans la page saisie classe
     * @param type $action
     */
    public function deletePrincipale() {
        $action = $this->request->action;

        $tableid = "";
        switch ($action) {
            case 1: $tableid = "tab_pp";
                break;
            case 2: $tableid = "tab_cpe";
                break;
            case 3: $tableid = "tab_ra";
                break;
        }
        $this->loadModel("classeparametre");
        $classparams = $this->Classeparametre->findSingleRowBy(["IDCLASSE" => $this->request->idclasse,
            "ANNEEACADEMIQUE" => $this->session->anneeacademique]);
        $this->Classeparametre->deletePrincipale($action, $classparams['IDPARAMETRE']);
        $view = new View();
        $view->Assign("tableid", $tableid);
        $json = array();
        $json[0] = $this->request->idclasse;
        $json[1] = $view->Render("classe" . DS . "ajax" . DS . "deleteprincipale", false);
        $json[2] = SITE_ROOT . "public/img/btn_add.png";
        echo json_encode($json);
    }
    
    //Supprime un enseignement de la page saisie enseignement via ajax
    public function deleteEnseignement(){
        $this->loadModel("enseignement");
        $this->Enseignement->delete($this->request->idenseignement);
        $view = new View();
        $json = array();
         $view->Assign("matieres", $this->Enseignement->getNonEnseignements($this->request->idclasse));
        $json[0] = $view->Render("classe" . DS . "ajax" . DS . "dialog-5", false);
        $ens = $this->Enseignement->getEnseignements($this->request->idclasse);
        $view->Assign("enseignements", $ens);
        $json[1] = $view->Render("classe" . DS . "ajax" . DS . "matiere", false);
        echo json_encode($json);
    }
    
     public function delete($id) {
        if ($this->Classe->delete($id)) {
            header("Location: " . Router::url("classe", "saisie"));
        } else {
            $view = new View();
            $this->Assign("content", (new View())->output(["errors" => true], false));
        }
    }

}
