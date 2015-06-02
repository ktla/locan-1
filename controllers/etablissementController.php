<?php

class etablissementController extends Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        if(!isAuth(201)){
            return;
        }
        $view = new View();
        $this->loadModel("locan");

        $ets = $this->Locan->selectAll()[0];
        $view->Assign("ets", $ets['NOM']);
        $view->Assign("responsable", $ets['RESPONSABLE']);
        $view->Assign("adresse", $ets['ADRESSE']);
        $view->Assign("tel1", $ets['TELEPHONE']);
        $view->Assign("tel2", $ets['TELEPHONE2']);
        $view->Assign("mobile", $ets['MOBILE']);
        $view->Assign("email", $ets['EMAIL']);

        $this->loadModel("personnel");
        $data = $this->Personnel->selectAll();
        $personnels = new Grid($data, 2);
        $personnels->addcolonne(1, "Civ", "CIVILITE");
        $personnels->addcolonne(2, "Matricule", "IDPERSONNEL");
        $personnels->addcolonne(3, "Nom", "NOM");
        $personnels->addcolonne(4, "Prénom", "PRENOM");
        $personnels->addcolonne(5, "Fonction", "LIBELLE");
        $personnels->addcolonne(6, "Téléphone", "TELEPHONE");
        $personnels->actionbutton = false;
        $view->Assign("personnels", $personnels->display());

        $this->loadModel("eleve");
        $data = $this->Eleve->selectAll();

        $eleves = new Grid($data, 1);
        $eleves->addcolonne(1, "MATRICULE", "MATRICULE");
        $eleves->addcolonne(2, "NOM", "NOM");
        $eleves->addcolonne(3, "PRENOM", "PRENOM");
        $eleves->addcolonne(4, "SEXE", "SEXE");
        $eleves->addcolonne(5, "CLASSE", "NATIONALITE");
        $eleves->addcolonne(6, "DATENAISS", "DATENAISS");
        $eleves->actionbutton = false;
        $view->Assign("eleves", $eleves->display());

        $content = $view->Render("etablissement" . DS . "index", false);
        $this->Assign("content", $content);
    }

    public function saisie() {
        if (!isAuth(501)) {
            return;
        }
        $view = new View();
        $view->Assign("errors", false);
        $message = "";
        $logo = "";
        if (!empty($this->request->identifiant) && !empty($this->request->nom) && !empty($this->request->adresse)) {
            //validation du logo
            if (isset($this->request->logo) && !empty($this->request->logo['tmp_name'])) {
                if (move_uploaded_file($this->request->logo['tmp_name'], ROOT . "/photos/" . $this->request->logo['name'])) {
                    $logo = SITE_ROOT . "photos/" . $this->request->logo['name'];
                } else {
                    $message = "Erreur lors de la sauvegarde du logo : " . $this->request->logo['name'];
                    return false;
                }
            }
            $params = ["identifiant" => $this->request->identifiant,
                "nom" => $this->request->nom,
                "adresse" => $this->request->adresse,
                "bp" => $this->request->bp,
                "tel1" => $this->request->tel1,
                "tel2" => $this->request->tel2,
                "mobile" => $this->request->mobile,
                "fax" => $this->request->fax,
                "email" => $this->request->email,
                "siteweb" => $this->request->siteweb,
                "responsable" => $this->request->responsable,
                "logo" => $logo
            ];
            //Insertion dans la BD
            $this->loadModel("locan");
            if($this->Locan->insert($params)){
                header("Location: " . Router::url("etablissement"));
            }else{
                $message = "Erreur lors de l'insertion";
            }
        }
        //Affichage du formulaire
        if(!empty($message)){
            $view->Assign("errors", true);
        }
        $content = $view->Render("etablissement" . DS . "saisie", false);

        $this->Assign("content", $content);
    }

}
