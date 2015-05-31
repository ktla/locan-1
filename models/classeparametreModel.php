<?php

class classeparametreModel extends Model {

    protected $_table = "classes_parametres";
    protected $_key = "IDPARAMETRE";

    public function __construct() {
        parent::__construct();
    }

    /**
     * 1 = prof principale
     * 2 = cpe principale
     * 3 = resp administratif
     * @param type $action
     */
    public function deletePrincipale($action, $idparams) {
        switch ($action) {
            case 1:
                $query = "UPDATE classes_parametres SET PROFPRINCIPALE = NULL WHERE IDPARAMETRE = :idparams";
                break;
            case 2:
                $query = "UPDATE classes_parametres SET CPEPRINCIPALE = NULL WHERE IDPARAMETRE = :idparams";
                break;
            case 3:
                $query = "UPDATE classes_parametres SET RESPADMINISTRATIF = NULL WHERE IDPARAMETRE = :idparams";
                break;
        }
        return $this->query($query, ["idparams" => $idparams]);
    }

}
