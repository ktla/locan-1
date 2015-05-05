<?php

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
        //print_r($eleves);
        //var_dump($eleves);
        $view->Assign("eleves", $eleves->view("50%"));

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
        $view->Assign("paysnaiss", $paysnaiss->view("75%"));
        $view->Assign("nationalite", $nationalite->view("75%"));

        $this->loadModel('etablissement');
        $data = $this->Etablissement->selectAll();
        $provenance = new Combobox($data, "provenance", "IDETABLISSEMENT", "ETABLISSEMENT");
        $view->Assign("provenance", $provenance->view("75%"));

        $this->loadModel('motifsortie');
        $data = $this->Motifsortie->selectAll();
        $motif = new Combobox($data, "motifsortie", "IDMOTIF", "LIBELLE");
        $view->Assign("motifsortie", $motif->view("85%"));

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

}
