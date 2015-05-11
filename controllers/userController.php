<?php

class userController extends Controller {

    public function __construct() {
        parent::__construct();
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
                    if ($this->User->updateBy($this->session->user, array("PASSWORD" => md5($this->request->newpwd)))) {
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

    public function email() {
        $this->Assign("content", (new View())->output());
    }

    public function telephone(){
        $view = new View();
        $view->Assign("errors", false);
        //Validation du formulaire
        if(isset($this->request->telephone)){
            $this->loadModel("personnel");
            if($this->Personnel->updateTelephone($this->request->telephone, $this->session->user)){
                echo "Reussite";
                //Rediriger sur ma fiche pour voir que la modif est a jour
                //header("Location:" . Router::url("user", "fiche"));
            }
            
        }
        $content = $view->Render("user" . DS . "telephone", false);
        $this->Assign("content", $content);
    }
}
