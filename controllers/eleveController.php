<?php

/**
 * PAGES AJAX : 800XX
 */
class EleveController extends Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        $view = new View();
        //Le model du dit controller est charger automatiquement
        //$this->Load_Model("eleve");

        $data = $this->Eleve->selectAll();
        $eleves = new Combobox($data, "eleves", "MATRICULE", "NOM");

        $eleves->idname = "listeeleve";
        //print_r($eleves);
        //var_dump($eleves);
        $view->Assign("eleves", $eleves->view());

        $content = $view->Render("eleve" . DS . "index", false);
        $this->Assign("content", $content);
    }

    /**
     * Validation des donnees si le formulaire est soumis
     */
    private function validerSaisie(&$message) {
        if (isset($this->request->nom) && isset($this->request->prenom)) {
            //Appeller l'algorithme pour generer les matricules des eleves
            $matr = rand(10, 100) . "eleve";
            $photo = "";

            if (isset($this->request->photo)) {
                if (move_uploaded_file($this->request->photo['tmp_name'], ROOT . "/photos/eleves/" . $this->request->photo['name'])) {
                    $photo = SITE_ROOT . "photos/eleves/" . $this->request->photo['name'];
                } else {
                    $message = "Erreur lors de la sauvegarde du fichier photo : " . $this->request->photo['name'];
                    return false;
                }
            }
            $redoublant = (strcasecmp($this->request->redoublant, "Oui") == 0);
            $params = ["matricule" => $matr,
                "nom" => $this->request->nom,
                "prenom" => $this->request->prenom,
                "autrenom" => $this->request->autrenom,
                "sexe" => $this->request->sexe,
                "photo" => $photo,
                "nationalite" => $this->request->nationalite,
                "datenaiss" => $this->request->datenaiss,
                "lieunaiss" => $this->request->lieunaiss,
                "paysnaiss" => $this->request->paysnaiss,
                "dateentree" => $this->request->dateentree,
                "provenance" => $this->request->provenance,
                "redoublant" => $redoublant,
                "datesortie" => $this->request->datesortie,
                "motifsortie" => $this->request->motifsortie
            ];
            //Effectuer l'insertion a proprement parle
            if ($this->Eleve->insert($params)) {
                header("Location: " . Router::url("eleve"));
                return true; //va jamais arriver la;
            } else {
                $message = "Erreur lors de la sauvegarde de l'élève";
                return false;
            }
        }
        return false;
    }

    public function saisie() {
        $message = "";
        $view = new View();
        $validate = $this->validerSaisie($message);
        if (!$validate && !empty($message)) {
            $view->Assign("errors", true);
            $view->Assign("message", $message);
        } elseif (!$validate && empty($message)) {
            $view->Assign("errors", false);
        }

        $this->loadModel("pays");
        $data = $this->Pays->selectAll();

        $paysnaiss = new Combobox($data, "paysnaiss", "PAYS", "PAYS");
        $nationalite = new Combobox($data, "nationalite", "PAYS", "PAYS");
        $view->Assign("paysnaiss", $paysnaiss->view());
        $view->Assign("nationalite", $nationalite->view());

        $this->loadModel('etablissement');
        $data = $this->Etablissement->selectAll();
        $provenance = new Combobox($data, "provenance", "IDETABLISSEMENT", "ETABLISSEMENT");
        $view->Assign("provenance", $provenance->view());

        $this->loadModel('motifsortie');
        $data = $this->Motifsortie->selectAll();
        $motif = new Combobox($data, "motifsortie", "IDMOTIF", "LIBELLE");
        $view->Assign("motifsortie", $motif->view());

        $this->loadModel("classe");
        $classes = $this->Classe->selectAll();
        $comboClasse = new Combobox($classes, "classe", "CODE", "LIBELLE");
        $view->Assign("classes", $comboClasse->view());
        
        $this->loadModel("civilite");
        $civ = $this->Civilite->selectAll();
        $civilite = new Combobox($civ, "civilite", "CIVILITE", "CIVILITE");
        $view->Assign("civilite", $civilite->view());
        
        $this->loadModel("parente");
        $par = $this->Parente->selectAll();
        $parente = new Combobox($par, "parente", "LIBELLE", "LIBELLE");
        $view->Assign("parente", $parente->view());
        
        $this->loadModel("charge");
        $charges = $this->Charge->selectAll();
        $view->Assign("charges", $charges);
        
        $content = $view->Render("eleve" . DS . "saisie", false);
        $this->Assign("content", $content);
    }

    public function delete($id) {
        $this->Eleve->delete($id);
        $view = new View();
        $content = $view->Render("eleve" . DS . "delete", false);
        $this->Assign("content", $content);
    }

    public function modify($id) {
        $view = new View();
        $content = $view->Render("eleve" . DS . "modify", false);
        if (isset($_POST[''])) {
            //Proceder a la modification de cet l'eleve dont l'id est id
        }
        $this->Assign("content", $content);
    }

    public function ajax($val) {
        sleep(3);
        if (!isset($this->session->user)) {
            print json_encode(false);
        } else {

            $arr = array();
            $data = $this->Eleve->findBy(array("MATRICULE" => $val));

            $view = new View();
            $view->Assign("nom", $data["NOM"]);
            $view->Assign("prenom", $data["PRENOM"]);
            $view->Assign("sexe", $data["SEXE"]);
            $view->Assign("datenaiss", $data["DATENAISS"]);
            $view->Assign("lieunaiss", $data["LIEUNAISS"]);
            $view->Assign("nationalite", $data["NATIONALITE"]);
            $view->Assign("nationalite", $data["NATIONALITE"]);
            $view->Assign("dateentree", $data["DATEENTREE"]);
            $view->Assign("provenance", $data["FK_PROVENANCE"]);
            $view->Assign("datesortie", $data["DATENAISS"]);
            $view->Assign("motifsortie", $data["FK_MOTIF"]);

            $arr[0] = $view->Render("eleve" . DS . "ajax" . DS . "onglet1", false);
            $arr[1] = $view->Render("eleve" . DS . "ajax" . DS . "onglet2", false);
            $arr[2] = $view->Render("eleve" . DS . "ajax" . DS . "onglet3", false);
            $arr[3] = $view->Render("eleve" . DS . "ajax" . DS . "onglet4", false);
            $arr[4] = $view->Render("eleve" . DS . "ajax" . DS . "onglet5", false);
            $arr[5] = $view->Render("eleve" . DS . "ajax" . DS . "onglet6", false);
            print json_encode($arr);
        }
    }

}
