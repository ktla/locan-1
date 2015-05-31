<?php

class Controller extends Application {

    protected $view = null;

    public function __construct() {

        parent::__construct();
        global $url; //$url est une variable globale defini dans Router.php
        $urlArray = explode("/", $url);
        /**
          Conservation de l'url de la page active
         */
        
        if ($urlArray[0] != "connexion"){
            $_SESSION['activeurl'] = $url;
        }

        //Extraire le mot Eleve dans la chaine EleveController (par exple)
        $model = strtolower(substr(get_class($this), 0, strlen(get_class($this)) - 10));
        $this->loadModel($model);
        //Verifier si ce n'est pas une requete AJAX
        if (!isset($_SERVER['HTTP_X_REQUESTED_WITH'])) {
            //Charger la page template, confere destructeur __destruct
            $this->view = new View();
            $this->view->Assign("authentified", isset($this->session->user));
            //Peut se faire directement dans le template
            //Charger le CSS
            //$this->view->setCSS('public' . DS . 'css' . DS . 'style.css');
            //charger le titre de la page
            //$this->view->setSiteTitle('Logiciel de gestion des activit&eacute;s acad&eacute;miques');
            //HEADER GENERALE
            $header = new View();
            $header->Assign('app_title', "LOCAN");
            $header->Assign("authentified", (isset($this->session->user)));

            if (isset($this->session->user)) {
                $header->Assign("menu", $this->menus->getMenus());
            }
            $this->Assign('header', $header->Render('header', false));


            //FOOTER GENERALE
            $footer = new View();
            $this->Assign('footer', $footer->Render('footer', false));
        }
    }

    public function index() {
        $this->Assign('content', 'methode index de classe ' . get_class($this) . ', Methode non encore
		implementee pour cette classe qui doit etendre le controller');
    }

    function Assign($variable, $value) {
        $this->view->Assign($variable, $value);
    }

    protected function loadModel($model) {
        $modelName = strtolower($model) . 'Model';
        if (class_exists($modelName)) {
            $model = ucfirst(strtolower($model));
            $this->{$model} = new $modelName;
        } else {
            die("Classe $modelName n'existe pas");
        }
    }

    function loadView($name) {

        //echo ROOT . DS . 'views' . DS . strtolower($name) . 'php';
        /* if (file_exists(ROOT . DS . 'views' . DS . strtolower($name) . '.php')) {
          $this->view_name = $name;
        }*/
    }

 
    function __destruct() {
        if ($this->view != null && $this->pdf == null) {
            $this->view->Render('template');
        }
    }

    /**
     * Generer le breadcrum en function du menu
     */
    public function setBreadCrumb() {
        return '<div class="breadcrumb"><a href ="">Document</a><a  href ="">Document</a><a href ="">Document</a></div>';
    }

   
}



