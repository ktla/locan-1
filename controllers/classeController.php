<?php

class classeController extends Controller{
  
    public function __construct() {
        parent::__construct();
    }
     public function index(){
         $this->Assign("content", (new View())->output(),false);
    }
    private function showClasses(){
        $classes = $this->Classe->selectAll();
        $grid = new Grid($classes, "CODE");
        $grid->addcolonne(0, "Code", "CODE");
        $grid->addcolonne(1, "Libellé", "LIBELLE");
        $grid->addcolonne(2, "Découpage", "FK_DECOUPAGE");
        $grid->editbutton = true;
        $grid->deletebutton = true;
        /*$this->Assign("content", (new View())->output(array("classes",
            $grid->display(),
            "errors", false), false));*/
        $view = new View();
        $view->Assign("classes", $grid->display());
        $view->Assign("errors", false);
        $view->Assign("total", count($classes));
        $content = $view->Render("classe" . DS . "showClasses", false);
        $this->Assign("content", $content);
    }
    
    
    public function saisie(){
        $this->view->clientsJS("classe" . DS . "classe");
        if(!isset($this->request->saisie)){
            $this->showClasses();
        }else{
            $view = new View();
            $view->Assign("errors", false);
            $this->loadModel("eleve");
            $eleves = $this->Eleve->selectAll();
            $view->Assign("eleves", $eleves);
            $comboEleve = new Combobox($eleves, "listeeleve", "MATRICULE", "NOM");
           $view->Assign("comboEleves", $comboEleve->view()); 


           $this->loadModel("personnel");
           $pers = $this->Personnel->selectAll();
           $comboEnseignants = new Combobox($pers, "listeenseignant", "IDPERSONNEL", "CNOM");
           $view->Assign("comboEnseignants", $comboEnseignants->view());

           $this->loadModel("matiere");
           $mat = $this->Matiere->selectAll();
           $comboMatieres = new Combobox($mat, "listematiere", "CODE", "LIBELLE");
           $view->Assign("comboMatieres", $comboMatieres->view());

           $view->Assign("enseignants", $pers);
            $content = $view->Render("classe" . DS . "saisie", false);
            $this->Assign("content", $content);
        }
    }
    
    public function delete($id){
        if($this->Classe->delete($id)){
            header("Location: " . Router::url("classe", "saisie"));
        }
    }
    
   
}
