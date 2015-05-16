<?php

class personnelController extends Controller {

    public function __construct() {
        parent::__construct();
    }

    function index() {

        $this->loadModel("function");
        $data = $this->Function->selectAll();
        $functions = new Combobox($data, "function", "IDFUNCTION", "FUNCTION");
        $functions->first = "Toutes";
        $functions->onchange = "showPersonnelByFunction()";

        
        $data = $this->Personnel->selectAll();

        $personnels = new Grid($data, 2);
        $personnels->addcolonne(1, "Civ", "CIVILITE");
        $personnels->addcolonne(2, "Matricule", "IDPERSONNEL");
        $personnels->addcolonne(3, "Nom", "NOM");
        $personnels->addcolonne(4, "Prénom", "PRENOM");
        $personnels->addcolonne(5, "Fonction", "FUNCTION");
        $personnels->addcolonne(6, "Téléphone", "TELEPHONE");
        $personnels->actionbutton = true;
        $personnels->deletebutton = true;
        $personnels->editbutton = true;
        $total = count($data);

        $this->Assign("content", (new View())->output(["functions" => $functions->view("25%"),
                    "personnels" => $personnels->display(),
                    "total" => $total
                        ], false));
    }

    /**
     * 
     * CODEDROIT : 502
     */
    public function saisie() {
        if (!isAuth(502)) {
            return;
        }
        $view = new View();
        $view->Assign('errors', false);

        if (isset($this->request->nom) && isset($this->request->function)) {
            $generer = substr($this->request->nom, 0, strlen($this->request->nom)) . rand(0, 500);
            $params = [
                "id" => $generer,
                "civilite" => $this->request->civilite,
                "nom" => $this->request->nom,
                "prenom" => $this->request->prenom,
                "autrenom" => $this->request->autrenom,
                "function" => $this->request->function,
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
        $civilite = new Combobox($data, "civilite", "CIVILITE", "CIVILITE");
        $view->Assign("civilite", $civilite->view("150px"));


        $this->loadModel("function");
         $data = $this->Function->selectAll();
        $functions = new Combobox($data, "function", "IDFUNCTION", "FUNCTION");
        $view->Assign("functions", $functions->view("150px"));
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
