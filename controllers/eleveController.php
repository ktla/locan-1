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
     * Validation des donnees si le formulaire est soumis
     */
    private function validerSaisie(&$message) {
        if (!empty($this->request->nomel) && !empty($this->request->prenomel)) {
            $responsables = json_decode($_POST['responsables']);
            $redoublant = (strcasecmp($this->request->redoublant, "Oui") == 0);
            $provenance = empty($this->request->provenance) ? null : $this->request->provenance;

            $params = [
                "matricule" => "",
                "nom" => $this->request->nomel,
                "prenom" => $this->request->prenomel,
                "autrenom" => $this->request->autrenom,
                "sexe" => $this->request->sexe,
                "photo" => $this->request->hiddenphoto,
                "cni" => $this->request->cni,
                "nationalite" => $this->request->nationalite,
                "datenaiss" => $this->request->datenaiss,
                "lieunaiss" => $this->request->lieunaiss,
                "paysnaiss" => $this->request->paysnaiss,
                "dateentree" => $this->request->dateentree,
                "provenance" => $provenance,
                "redoublant" => $redoublant,
            ];
            //Effectuer l'insertion a proprement parle
            if ($this->Eleve->insert($params)) {
                //Si tout s'est bien passee, inserer les responsables en utilisant le last insert id
                $id = $this->Eleve->lastInsertId();
                if ($this->saveResponsables($responsables, $id)) {
                    //Si tout va bien, rediriger sur a liste des eleves
                    header("Location: " . Router::url("eleve"));
                } else {
                    $message = "Erreur lors de la sauvegarde des responsables";
                    return false;
                }
            } else {
                $message = "Erreur lors de la sauvegarde de l'élève";
                return false;
            }
        }
        return false;
    }

    /**
     * Methode appellee dans la validation du formulaire validateSaisie
     * Fonction deleguer de la function validate saisie
     * cette fonction gere le volet sauvegarde des informations  concernant des responsables
     * @param type $responsables des responsables sous formes d'un object JSON, ces responsables sont a inserer dans la BD
     * @param type $ideleve l'eleve dont ils sont les responsables
     */
    private function saveResponsables($newresponsables, $ideleve = 0, $oldresponsable = null) {

        $this->loadModel("responsable");
        $this->loadModel("responsableeleve");
        $this->loadModel("responsablecharge");
        foreach ($newresponsables as $resp) {
            $params = [
                "civilite" => $resp->civilite,
                "nom" => $resp->nom,
                "prenom" => $resp->prenom,
                "adresse" => $resp->adresse,
                "telephone" => $resp->telephone,
                "portable" => $resp->portable,
                "email" => $resp->email,
                "profession" => $resp->profession,
                "bp" => $resp->bp
            ];

            if ($this->Responsable->insert($params)) {
                $idresp = $this->Responsable->lastInsertId();
                $acceptesms = isset($resp->acceptesms) ? 1 : 0;
                $params = [
                    "idresponsable" => $idresp,
                    "ideleve" => $ideleve,
                    "parente" => $resp->parente,
                    "acceptesms" => $acceptesms,
                    "numsms" => $resp->numsms
                ];
                if ($this->Responsableeleve->insert($params)) {
                    $idrespeleve = $this->Responsableeleve->lastInsertId();
                    foreach ($resp->charge as $charge) {
                        $params = [
                            "idresponsableeleve" => $idrespeleve,
                            "idcharge" => $charge];
                        if ($this->Responsablecharge->insert($params)) {
                            continue;
                        } else {
                            return false;
                        }
                    }
                } else {
                    return false;
                }
            } else {
                return false;
            }
        }
        return true;
    }

    public function saisie() {
        $this->view->clientsJS("eleve" . DS . "eleve");

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

        $this->loadModel("civilite");
        $civ = $this->Civilite->selectAll();
        $civilite = new Combobox($civ, "civilite", "CIVILITE", "CIVILITE");
        $view->Assign("civilite", $civilite->view());

        $this->loadModel("parente");
        $par = $this->Parente->selectAll();
        $parente = new Combobox($par, "parente", "LIBELLE", "LIBELLE");
        $view->Assign("parente", $parente->view());
        $parente->name = "parenteextra";
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
        sleep(2);
        if (!isset($this->session->user)) {
            print json_encode(false);
        } else {
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

    public function imprimer() {
        $this->pdf = new PDF();
        $view = new View();
        $view->Assign("pdf", $this->pdf);
        echo $view->Render("eleve" . DS . "imprimer", false);
        //$this->Assign("content", $content);
    }

}
