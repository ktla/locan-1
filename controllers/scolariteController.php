<?php

class scolariteController extends Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        if(!isAuth(208)){
            return;
        }
        $this->view->clientsJS("scolarite" . DS . "scolarite");
        $view = new View();
        $scolarites = $this->Scolarite->getScolarite($this->session->anneeacademique);
        $grid = new Grid($scolarites, 0);
        $grid->addcolonne(0, "IDSCOLARITE", "IDSCOLARITE", false);
        $grid->addcolonne(1, "CLASSE", "CLASSELIBELLE");
        $grid->addcolonne(2, "SCOLARITE", "LIBELLE");
        $grid->addcolonne(3, "MONTANT", "MONTANT");
        $grid->addcolonne(4, "ECHEANCES", "ECHEANCES");
        $grid->actionbutton = true;
        $grid->deletebutton = true;
        
        $view->Assign("scolarites", $grid->display());
        $content = $view->Render("scolarite" . DS . "index", false);
        $this->Assign("content", $content);
    }

    function saisie() {
        if(!isAuth(508)){
            return;
        }
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

    function ajax($action) {
        $view = new View();
        $json = array();
        switch ($action) {
            case "ajouter":
                $params = ["LIBELLE" => $this->request->libelle, "MONTANT" => $this->request->montant,
                    "ECHEANCES" => $this->request->echeances, "CLASSE" => $this->request->idclasse];
                $this->Scolarite->insert($params);
                break;
            case "supprimer":
                $this->Scolarite->delete($this->request->idscolarite);
                break;
            case "load":
                break;
        }
        $scolarites = $this->Scolarite->findBy(["CLASSE" => $this->request->idclasse]);
        $view->Assign("scolarites", $scolarites);
        $json[0] = $view->Render("scolarite" . DS . "ajax" . DS . "scolarite", false);
        echo json_encode($json);
    }
    
    public  function delete($id){
        $this->Scolarite->delete($id);
        header("Location:".Router::url("scolarite"));
    }

}
