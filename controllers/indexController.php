<?php

class IndexController extends Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        $view = new View();

        $view->Assign("title", "PAGE INDEX");
        $str = "Information: " . $_SESSION['user'] . " - ".$_SESSION['anneeacademique'];
        $view->Assign("body", $str);
        $content = $view->Render("index" . DS . "index", false);

        
        $this->Assign("content", $content);
    }

    /**
      Methode a argument variable
     */
    public function methode($query1 = "", $query2 = "") {
        echo $query1 . " " . $query2;
    }

}
