<?php

class EleveController extends Controller {

    public function __construct() {
        parent::__construct();
        
    }

    public function index() {
        $view = new View();
        //Le model du dit controller est charger automatiquement
        
        //$this->Load_Model("eleve");

        $eleves = $this->model->selectAll();
        //print_r($eleves);
        //var_dump($eleves);
        $view->Assign("eleves", $eleves);
        
        $content = $view->Render("eleve" . DS . "index", false);
        $this->Assign("content", $content);
    }

    public function add() {
        $view = new View();
        $content = $view->Render("eleve" . DS . "add", false);
        $this->Assign("content", $content);
    }

    public function delete($id) {
        $this->model->delete($id);
        $view = new View();
        $content = $view->Render("eleve" . DS . "delete", false);
        $this->Assign("content", $content);
    }

    public function modify($id) {
        $view = new View();
        $content = $view->Render("eleve" . DS . "modify", false);
        if(isset($_POST[''])){
            //Proceder a la modification de cet l'eleve dont l'id est id
        }
        $this->Assign("content", $content);
    }

}
