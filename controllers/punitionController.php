<?php

class punitionController extends Controller{
    public function __construct() {
        parent::__construct();
    }
    public function index(){
        $view = new View();
        $content = $view->Render("punitions" . DS . "index", false);
        $this->Assign("content", $content);
    }
    
    public function saisie(){
        $this->Assign("content", (new View())->output());
    }
}
