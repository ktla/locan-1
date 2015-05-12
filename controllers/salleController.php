<?php

class salleController extends Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        
    }

    public function appel() {
        $view = new View();
        $this->loadModel("eleve");
        $eleves = $this->Eleve->selectAll();
        $view->Assign("eleves", $eleves);
        $content = $view->Render("salle" . DS . "appel", false);
        $this->Assign("content", $content);
    }

}
