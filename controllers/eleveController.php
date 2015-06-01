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
        $this->view->clientsJS("eleve" . DS . "eleve");
        //Le model du dit controller est charger automatiquement
        //$this->Load_Model("eleve");

        $data = $this->Eleve->selectAll();
        $eleves = new Combobox($data, "listeeleve", "IDELEVE", "CNOM");
        $eleves->idname = "listeeleve";
        $view->Assign("eleves", $eleves->view("250px"));

        $content = $view->Render("eleve" . DS . "index", false);
        $this->Assign("content", $content);
    }

    /**
     * Methode appellee dans la validation du formulaire validateSaisie
     * Fonction deleguer de la function validate saisie
     * cette fonction gere le volet sauvegarde des informations  concernant les responsables
     * @param type $responsables des responsables sous formes d'un object JSON, ces responsables sont a inserer dans la BD
     * @param type $ideleve l'eleve dont ils sont les responsables
     */
    private function saveResponsables($resp, $ideleve = 0) {
        $this->loadModel("responsable");
        $this->loadModel("responsableeleve");
        $params = [
            "civilite" => $resp->civilite,
            "nom" => $resp->nom,
            "prenom" => $resp->prenom,
            "adresse" => $resp->adresse,
            "telephone" => $resp->telephone,
            "portable" => $resp->portable,
            "email" => $resp->email,
            "profession" => $resp->profession,
            "bp" => $resp->bp,
            "acceptesms" => isset($resp->acceptesms) ? 1 : 0,
            "numsms" => $resp->numsms
        ];
        if ($this->Responsable->insert($params)) {
            $params = [
                "idresponsable" => $this->Responsable->lastInsertId(),
                "ideleve" => $ideleve,
                "parente" => $resp->parente,
                "charges" => json_encode($resp->charge)
            ];
            $this->Responsableeleve->insert($params);
        }
    }

    public function saisie() {
        $this->view->clientsJS("eleve" . DS . "eleve");
        //Effectuer une derniere mise a jour en cas modification
        if (!empty($this->request->ideleve)) {
            $redoublant = (strcasecmp($this->request->redoublant, "Oui") == 0);
            $provenance = empty($this->request->provenance) ? null : $this->request->provenance;
            $params = ["matricule" => $this->request->matricule, "nom" => $this->request->nomel,
                "prenom" => $this->request->prenomel, "autrenom" => $this->request->autrenom,
                "sexe" => $this->request->sexe, "photo" => $this->request->hiddenphoto,
                "cni" => $this->request->cni, "nationalite" => $this->request->nationalite,
                "datenaiss" => $this->request->datenaiss, "lieunaiss" => $this->request->lieunaiss,
                "paysnaiss" => $this->request->paysnaiss, "dateentree" => $this->request->dateentree,
                "provenance" => $provenance, "redoublant" => $redoublant
            ];
            $this->Eleve->update($params, ["IDELEVE" => $this->request->ideleve]);
            header("Location:" . Router::url("eleve"));
        }
        $view = new View();

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

        $this->loadModel("civilite");
        $civ = $this->Civilite->selectAll();
        $civilite = new Combobox($civ, "civilite", "CIVILITE", "CIVILITE");
        $civilite->selected = true;
        $civilite->selectedid = "Mr";
        $view->Assign("civilite", $civilite->view());

        $this->loadModel("parente");
        $par = $this->Parente->selectAll();
        $parente = new Combobox($par, "parente", "LIBELLE", "LIBELLE");
        $view->Assign("parente", $parente->view());
        $parente->name = "parenteextra";
        $parente->idname = "parenteextra";
        $view->Assign("parenteextra", $parente->view());

        $this->loadModel("charge");
        $charges = $this->Charge->selectAll();
        $view->Assign("charges", $charges);

        $this->loadModel("responsable");
        $resp = $this->Responsable->selectAll();
        $comboResponsables = new Combobox($resp, "listeresponsable", "IDRESPONSABLE", "CNOM");
        $view->Assign("comboResponsables", $comboResponsables->view());

        $content = $view->Render("eleve" . DS . "saisie", false);
        $this->Assign("content", $content);
    }

    /**
     * code ajax utiliser lors de la saisie d'un nouvel eleve
     * @param type $action
     */
    public function ajaxsaisie($action) {
        $redoublant = (strcasecmp($this->request->redoublant, "Oui") == 0);
        $provenance = empty($this->request->provenance) ? null : $this->request->provenance;
        $params = [
            "matricule" => $this->request->matricule,
            "nom" => $this->request->nomel,
            "prenom" => $this->request->prenomel,
            "autrenom" => $this->request->autrenom,
            "sexe" => $this->request->sexe,
            "photo" => $this->request->photoeleve,
            "cni" => $this->request->cni,
            "nationalite" => $this->request->nationalite,
            "datenaiss" => $this->request->datenaiss,
            "lieunaiss" => $this->request->lieunaiss,
            "paysnaiss" => $this->request->paysnaiss,
            "dateentree" => $this->request->dateentree,
            "provenance" => $provenance,
            "redoublant" => $redoublant,
        ];
        if (!empty($this->request->ideleve)) {
            $this->Eleve->update($params, ["IDELEVE" => $this->request->ideleve]);
            $ideleve = $this->request->ideleve;
        } else {
            $this->Eleve->insert($params);
            $ideleve = $this->Eleve->lastInsertId();
        }
        
        $json = array();
        $json[0] = $ideleve;
        $view = new View();
        switch ($action) {
            case "responsable":
                $responsables = json_decode($_POST['responsable']);
                $this->saveResponsables($responsables, $ideleve);
                $data = $this->Eleve->getResponsables($ideleve);
                $view->Assign("responsables", $data);
                $json[1] = $view->Render("eleve" . DS . "ajax" . DS . "responsables", false);
                break;
            case "oldresponsable":
                $this->loadModel("responsableeleve");
                $resp = json_decode($_POST['responsable']);
                $params = [
                    "idresponsable" => $resp->idresponsable,
                    "ideleve" => $ideleve,
                    "parente" => $resp->parente,
                    "charges" => json_encode($resp->charges)
                ];
                $this->Responsableeleve->insert($params);
                $data = $this->Eleve->getResponsables($ideleve);
                $view->Assign("responsables", $data);
                $nonresp = $this->Eleve->getNonResponsables($ideleve);
                $view->Assign("nonresponsable", $nonresp);
                $json[1] = $view->Render("eleve" . DS . "ajax" . DS . "responsables", false);
                $json[2] = $view->Render("eleve" . DS . "ajax" . DS . "nonresponsable", false);
            break;
        }
        
        echo json_encode($json);
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

    public function ajax() {
        $arr = array();
        $data = $this->Eleve->findBy(["IDELEVE" => $this->request->ideleve]);
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

    //Utiliser dans la page saisie eleve et permet
    //d'uploader la photo sur le server et concerver 
    //le chemin dans un input hidden qui sera ensuite envoyer par le formulaire generale de l'eleve
    //0 pour premiere submission dont l'aaction est ajout
    //1 pour seconde soumission dont l'action est effacer
    public function photo($action) {
        $json_array = array();
        if (!strcmp($action, "upload")) {
            $photo = "";
            $message = "";
            if (move_uploaded_file($_FILES['photo']['tmp_name'], ROOT . "/public/photos/eleves/" . $_FILES['photo']['name'])) {
                $photo = SITE_ROOT . "public/photos/eleves/" . $_FILES['photo']['name'];
            } else {
                $message = "Erreur lors de la sauvegarde du fichier photo : " . $_FILES['photo']['name'];
            }

            if (!empty($photo)) {
                $json_array[0] = btn_add_disabled("") . " " . btn_effacer("effacerPhotoEleve();");
            } else {
                $json_array[0] = btn_add("savePhotoEleve();") . " " . btn_effacer_disabled("");
            }
            $json_array[1] = $photo;
            $json_array[2] = $message;
            $json_array[3] = $_FILES['photo']['name'];
        } else {
            if (unlink(ROOT . DS . "public" . DS . "photos" . DS . "eleves" . DS . $action)) {
                $json_array[0] = btn_add("savePhotoEleve();") . " " . btn_effacer_disabled("");
                $json_array[1] = "";
                $json_array[2] = "";
                $json_array[3] = "";
            } else {
                $json_array[0] = btn_add_disabled("") . " " . btn_effacer("effacerPhotoEleve();");
                $json_array[1] = $action;
                $json_array[2] = "Erreur lors de la suppression de l'image";
                $json_array[3] = "";
            }
        }
        print json_encode($json_array);
    }
    
    public function deleteResponsable(){
        $this->loadModel("responsableEleve");
        $this->Responsableeleve->delete($this->request->idresponsableeleve);
        $json = array();
        $data = $this->Eleve->getResponsables($this->request->ideleve);
        $view = new View();
        $view->Assign("responsables", $data);
        $json[0] = $view->Render("eleve" . DS . "ajax" . DS . "responsables", false);
        $nonresponsable = $this->Eleve->getNonResponsables($this->request->ideleve);
        $view->Assign("nonresponsable", $nonresponsable);
        $json[1] = $view->Render("eleve" . DS . "ajax" . DS . "nonresponsable", false);
        echo json_encode($json);
    }
    public function imprimer() {
        $this->pdf = new PDF();
        $view = new View();
        $view->Assign("pdf", $this->pdf);
        echo $view->Render("eleve" . DS . "imprimer", false);
        //$this->Assign("content", $content);
    }

}
