<?php

class connexionController extends Controller {

    public function __construct() {
        parent::__construct();

        if ($this->input->session('user')) {
            header("Location:" . SITE_ROOT);
        }
    }

    public function index() {
        $view = new View();
        $view->Assign("errors", false);
        $view->setCSS("public/css/connexion.css");
        //le formulaire est soumis
        if ($this->input->post('login') && $this->input->post('pwd')) {
            
            if ($this->model->authenticate($this->input->post('login'), $this->input->post('pwd'))) {

                $_SESSION['user'] = $this->input->post('login');
                $_SESSION['anneeacademique'] = $this->input->post('anneeacademique');
                header("Location:" . SITE_ROOT);
            } else {
                $view->Assign("errors", true);
            }
        }
        $view->Assign("post", $this->input->post());
        
        $this->loadModel("anneeAcademique");
        $anneeAcad = $this->getModel("anneeAcademique")->selectAll();
        
        
        $anneeacademique = new Combobox($anneeAcad, 'anneeacademique', 'anneeacademique', 'anneeacademique');
        
        $view->Assign("anneeacademique", $anneeacademique->view());
        
        $content = $view->Render("connexion" . DS . "index", false);
        $this->Assign("content", $content);
    }

    public function disconnect() {
        unset($_SESSION['user']);
        session_destroy();
        header("Location:" . url('connexion'));
    }

}
