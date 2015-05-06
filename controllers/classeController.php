<?php

class classeController extends Controller{
  
    public function __construct() {
        parent::__construct();
    }
     public function index(){
         $this->Assign("content", (new View())->output(),false);
    }
    
    public function saisie(){
        $view = new View();
        $view->Assign("errors", false);
        $this->loadModel("eleve");
        $eleves = $this->Eleve->selectAll();
        $view->Assign("eleves", $eleves);
        $comboEleve = new Combobox($eleves, "liseeleve", "MATRICULE", "NOM");
       $view->Assign("comboEleves", $comboEleve->view("25%")); 
       
       
       $this->loadModel("personnel");
       $data = $this->Personnel->selectAll();
       $comboEnseignants = new Combobox($data, "listeenseignant", "IDPERSONNEL", "CNOM");
       $view->Assign("comboEnseignants", $comboEnseignants->view("25%"));
       
       $this->loadModel("matiere");
       $data = $this->Matiere->selectAll();
       $comboMatieres = new Combobox($data, "listematiere", "CODE", "LIBELLE");
       $view->Assign("comboMatieres", $comboMatieres->view("25%"));
       
        $content = $view->Render("classe" . DS . "saisie", false);
        $this->Assign("content", $content);
    }
    
   
}
