<?php

class matiereModel extends Model {

    protected $_table = "matieres";
    protected $_key = "CODE";

    public function __construct() {
        parent::__construct();
    }
    
    public function insert($params){
        $query = "INSERT INTO matieres(CODE, LIBELLE) "
                . "VALUE (:code, :libelle)"; 
       return $this->query($query, $params);
    }

   
}
