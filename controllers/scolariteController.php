<?php

class scolariteController extends Controller{
   public function __construct() {
       parent::__construct();
   }
   
   public function index(){
       $view = new View();
       $content = $view->Render("scolarite" . DS . "index", false);
       $this->Assign("content", $content);
   }
   
    function saisie(){
        $this->view->clientsJS("scolarite" . DS . "scolarite");
       $view = new View();
       $this->loadModel("classe");
       
       $data = $this->Classe->findBy(["ANNEEACADEMIQUE" => $this->session->anneeacademique]);
       $comboClasses = new Combobox($data, "comboClasses", "IDCLASSE", "LIBELLE");
       $comboClasses->first = " ";
       $view->Assign("comboClasses", $comboClasses->view());
       $content = $view->Render("scolarite" . DS . "saisie", false);
       $this->Assign("content", $content);
   }
}
