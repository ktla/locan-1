<?php

class classeController extends Controller{
  
    public function __construct() {
        parent::__construct();
    }
     public function index(){
         $this->Assign("content", (new View())->output(),false);
    }
    
    public function saisie(){
        
    }
    
   
}
