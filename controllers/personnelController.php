<?php

class personnelController extends Controller {

    public function __construct() {
        parent::__construct();
    }

    function index() {
        $this->loadModel("function");
        $data = $this->getModel("function")->selectAll();
        $functions = new Combobox($data, "function", "IDFUNCTION", "FUNCTION");
        $functions->first = "Toutes";

        $data = $this->model->selectAll();
        
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

}
