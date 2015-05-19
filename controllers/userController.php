<?php

class userController extends Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        $view = new View();
        $content = $view->Render("user" . DS . "index", false);
        $this->Assign("content", $content);
    }

    /**
     * affiche la grid des differents connexion de l'utilisateur
     */
    public function connexion() {
        $data = $this->User->mesConnexions($this->input->session('user'));
        $grid = new Grid($data, 1);

        $grid->addcolonne(0, "IDCONNEXION", "IDCONNEXION", false);
        //Quand c'est toi, je n'ai besoin d'afficher l'utilisateur
        //$grid->addcolonne(2 , "Utilisateur", "COMPTE");
        $grid->addcolonne(1, "Date de début", "DATEDEBUT");
        $grid->addcolonne(2, "Machine", "MACHINESOURCE");
        $grid->addcolonne(3, "Adresse", "IPSOURCE");
        $grid->addcolonne(4, "Connexion", "CONNEXION");
        $grid->addcolonne(5, "Date de fin", "DATEFIN");
        $grid->addcolonne(6, "Déconnexion", "DECONNEXION");

        $grid->setColDate(1);
        $grid->setColDate(5);
        $total = count($data);

        $this->Assign("content", (new View())->output(array(
                    "connexions" => $grid->display(),
                    "errors" => false,
                    "total" => $total), false));
    }

    public function mdp() {
        $view = new View();
        $view->Assign("errors", false);
        $message = "";
        //Validation du formulaire
        if (isset($this->request->pwdactuel) && isset($this->request->newpwd) && isset($this->request->confpwd)) {
            //Verifier que newpwd et le mot de passe de confirmation sont identique
            if (strcmp($this->request->newpwd, $this->request->confpwd)) {
                $message = "Le nouveau mot de passe et celui de confirmation ne correspondent pas";
            } else {
                //Verifier que l'ancien mot de passe est correcte
                $user = $this->User->findBy(array("LOGIN" => $this->session->user, "PASSWORD" => md5($this->request->pwdactuel)));
                if (is_array($user) && count($user) > 0) {
                    
                    if ($this->User->update(["PASSWORD" => md5($this->request->newpwd)], ["LOGIN" => $this->session->user])) {
                        header("Location:" . Router::url("connexion", "disconnect"));
                    } else {
                        $message = "Une erreur de mise a jour";
                    }
                } else {
                    $message = "Mot de passe actuel incorrect";
                }
            }
        }
        if (!empty($message)) {
            $view->Assign("errors", true);
            $view->Assign("message", $message);
        }
        $content = $view->Render("user" . DS . "mdp", false);
        $this->Assign("content", $content);
    }
    /**
     * Modification de son adresse email
     */
    public function email() {
        $view = new View();
        $view->Assign("errors", false);
        $message = "";
        if(!empty($this->request->email)){
            //verifier si c'est un email valide en utilisant une expression reguliere
            $valide = true;
            if($valide){
                $this->loadModel("personnel");
                if($this->Personnel->update(['EMAIL' => $this->request->email], ["LOGIN" => $this->session->user])){
                    header("Location:". Router::url("user", "fiche"));
                }
            }else{
                $view->Assign("errors", true);
                $message = "Format d'email invalide";
            }
            
        }
        if(isset($this->request->email) && empty($this->request->email)){
             $view->Assign("errors", true);
            $message = "Veuillez remplir le champ email";
        }
        $view->Assign("message", $message);
        
        $this->Assign("content", $view->output());
    }

    public function telephone() {
        $view = new View();
        $view->Assign("errors", false);
         $this->loadModel("personnel");
         
        //Validation du formulaire
        if (!empty($this->request->telephone) || !empty($this->request->portable)) {
            $params = ["TELEPHONE" => $this->request->telephone, "PORTABLE" => $this->request->portable];
            if ($this->Personnel->update($params, ["LOGIN" => $this->session->user])) {
                //Rediriger sur ma fiche pour voir que la modif est a jour
                header("Location:" . Router::url("user", "fiche"));
            }
        }
        $pers = $this->Personnel->findBy(["LOGIN" => $this->session->user]);
        $portable = $pers[0]["PORTABLE"];
        $tel = $pers[0]["TELEPHONE"];
        $view->Assign("tel", $tel);
        $view->Assign("portable", $portable);
        
        $content = $view->Render("user" . DS . "telephone", false);
        $this->Assign("content", $content);
    }

    public function droits() {
        $view = new View();
        $view->Assign("errors", false);
        $this->loadModel("profile");
        $this->loadModel("droit");
        $profiles = $this->Profile->selectAll();
        //validation du formulaire
        if (isset($this->request->soumis)) {
            //Parcourir les profils, et mettre a jour leur droits respectifs
            foreach ($profiles as $profile) {
                if (isset($_POST[$profile['IDPROFILE']]) && !empty($_POST[$profile['IDPROFILE']])) {
                    $this->Droit->emptyDroits($profile['IDPROFILE']);
                    $this->Droit->insertDroits($profile['IDPROFILE'], $_POST[$profile['IDPROFILE']]);
                }
            }
            header("Location" . Router::url("user", "droits"));
        }
        $listedroits = array();
        foreach ($profiles as $profile) {
            $listedroits[$profile['IDPROFILE']] = $this->Droit->findListeDroits($profile['IDPROFILE']);
        }
        $view->Assign("listedroits", $listedroits);
        $droits = $this->Droit->selectAll();
        $view->Assign("total", count($droits));
        $view->Assign("droits", $droits);
        $view->Assign("profiles", $profiles);

        $content = $view->Render("user" . DS . "droits", false);
        $this->Assign("content", $content);
    }

    
    public function fiche(){
        $this->Assign("content", (new View())->output());
    }
}
