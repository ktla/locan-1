<?php

class matiereController extends Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        $matieres = $this->Matiere->selectAll();
        /* $this->Assign("content", (new View())->output(
          array('matieres' => $matieres,
          'errors' => false), false)); */

        $grid = new Grid($matieres, 1);
        $grid->addcolonne(1, 'CODE', 'CODE', TRUE);
        $grid->addcolonne(2, 'LIBELLE', 'LIBELLE', TRUE);

        $grid->editbutton = true;
       
        $grid->editbuttontext = "Editer";
        $grid->deletebutton = true;
        $grid->deletebuttontext = "Supprimer";
        $grid->selectbutton = false;
        $total = count($matieres);
        
        $this->Assign("content", (new View())->output(array(
            "matieres" => $grid->display(),
            "errors" => false,
            "total" => $total),
        false));
    }

    /**
     * CODEDROIT : 504
     */
    public function saisie() {
        if (!isAuth(504)) {
            return;
        }
        $view = new View();
        $view->Assign('errors', false);

        if (isset($this->request->code) && isset($this->request->libelle)) {
               $params = array(
                   "code" => $this->request->code,
                   "libelle" => $this->request->libelle
               );
            if ($this->Matiere->insert($params)) {
                header("Location:" . url('matiere'));
            } else {
                $view->Assign("errors", true);
            }
        }
        $content = $view->Render("matiere" . DS . "saisie", false);
        $this->Assign("content", $content);
    }

    public function delete($id) {
        if ($this->Matiere->delete($id)) {
            header("Location:" . url('matiere'));
        } else {
            $this->Assign("content", (new View())->output(array("errors" => true), false));
        }
    }

}
