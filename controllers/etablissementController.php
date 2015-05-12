<?php
class etablissementController extends Controller{
    public function __construct() {
        parent::__construct();
    }
    
    public function index(){
        
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
        $personnels->addcolonne(5, "Fonction", "FUNCTION");
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
    
    public function saisie(){
        
    }
}
