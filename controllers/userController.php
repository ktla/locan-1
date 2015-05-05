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
            "total" => $total),
        false));
    }

}
