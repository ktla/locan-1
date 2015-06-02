<?php

class personnelController extends Controller {

    public function __construct() {
        parent::__construct();
    }

    function index() {
        if(!isAuth(203)){
            return;
        }
        $this->view->clientsJS("personnel" . DS . "personnel");
        $this->loadModel("fonction");
        $data = $this->Fonction->selectAll();
        $fonctions = new Combobox($data, "fonction", "IDFONCTION", "LIBELLE");
        $fonctions->first = "Toutes";
        $fonctions->onchange = "showPersonnelByFunction();";

        
        $data = $this->Personnel->selectAll();

        $personnels = new Grid($data, 0);
        $personnels->addcolonne(0, "IDPERSONNEL", "IDPERSONNEL", false);
        $personnels->addcolonne(1, "Civ", "CIVILITE");
        $personnels->addcolonne(2, "Matricule", "MATRICULE");
        $personnels->addcolonne(3, "Nom", "NOM");
        $personnels->addcolonne(4, "Prénom", "PRENOM");
        $personnels->addcolonne(5, "Fonction", "LIBELLE");
        $personnels->addcolonne(6, "Téléphone", "TELEPHONE");
        $personnels->actionbutton = true;
        $personnels->deletebutton = true;
        $personnels->editbutton = true;
        $total = count($data);

        $this->Assign("content", (new View())->output(["fonctions" => $fonctions->view("50%"),
                    "personnels" => $personnels->display(),
                    "total" => $total
                        ], false));
    }
    /** Function ajax appellee quand on choisi une function, confere showPersonnelByFunction()
     * dans la methode index. Permet l'affichage du personnel en fonction du onchange dans la fonction
     */
    public function ajax(){
        $view = new View();
        if ($this->request->fonction != 0) {
            $data = $this->Personnel->findBy(["FONCTION" => $this->request->fonction]);
        } else {
            $data = $this->Personnel->selectAll();
        }
        $personnels = new Grid($data, 2);
        $personnels->addcolonne(1, "Civ", "CIVILITE");
        $personnels->addcolonne(2, "Matricule", "IDPERSONNEL");
        $personnels->addcolonne(3, "Nom", "NOM");
        $personnels->addcolonne(4, "Prénom", "PRENOM");
        $personnels->addcolonne(5, "Fonction", "LIBELLE");
        $personnels->addcolonne(6, "Téléphone", "TELEPHONE");
        $personnels->actionbutton = true;
        $personnels->deletebutton = true;
        $personnels->editbutton = true;
        $total = count($data);
        $json_array = array();
        $view->Assign("personnels", $personnels->display());
        $view->Assign("total", $total);
        $json_array[0] = $view->Render("personnel" . DS . "ajax" . DS . "ajax1", false);
        $json_array[1] = $view->Render("personnel" . DS . "ajax" . DS . "ajax2", false);
        
        echo json_encode($json_array);
        
    }
    
    /**
     * 
     * CODEDROIT : 502
     */
    public function saisie() {
        if (!isAuth(502)) {
            return;
        }
        $this->view->clientsJS("personnel" . DS . "personnel");
        $view = new View();
        $view->Assign('errors', false);
        if (!empty($this->request->nom) && !empty($this->request->fonction) && !empty($this->request->portable)) {
            $generer = substr($this->request->nom, 0, strlen($this->request->nom)) . rand(0, 500);
            $params = [
                "id" => $generer,
                "civilite" => $this->request->civilite,
                "nom" => $this->request->nom,
                "prenom" => $this->request->prenom,
                "autrenom" => $this->request->autrenom,
                "fonction" => $this->request->fonction,
                "grade" => $this->request->grade,
                "datenaiss" => $this->request->datenaiss,
                "telephone" => $this->request->telephone,
                "portable" => $this->request->portable
            ];

            if ($this->Personnel->insert($params)) {
                header("Location:" . url('personnel'));
            } else {
                $view->Assign("errors", true);
            }
        }

        $this->loadModel("civilite");
         $data = $this->Civilite->selectAll();
        $civilite = new Combobox($data, "civilite", "CIVILITE", "CIVILITE", true, "Mr");
        $view->Assign("civilite", $civilite->view("150px"));


        $this->loadModel("fonction");
         $data = $this->Fonction->selectAll();
        $fonctions = new Combobox($data, "fonction", "IDFONCTION", "LIBELLE");
        $view->Assign("fonctions", $fonctions->view());
        $content = $view->Render("personnel" . DS . "saisie", false);
        $this->Assign("content", $content);
    }

    /**
     * CODEDROIT : 507
     * @param type $id
     */
    public function delete($id) {
        if (!isAuth(507)) {
            return;
        }

        if ($this->Personnel->delete($id)) {
            header("Location:" . url('personnel'));
        } else {
            $this->Assign("content", (new View())->output(array("errors" => true), false));
        }
    }

}
