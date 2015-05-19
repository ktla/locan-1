<?php

class personnelModel extends Model{
    protected $_table = "personnels";
    protected $_key = "IDPERSONNEL";
    
    public function __construct() {
        parent::__construct();
    }
    
    public function selectAll(){
        $query = "SELECT p.*, CONCAT(p.NOM,' ', p.PRENOM) AS CNOM, f.FUNCTION as FUNCTION FROM personnels p "
                . "LEFT JOIN functions f ON f.IDFUNCTION = p.FK_FUNCTION";
        return $this->query($query);
    }
   
    public function insert($params){
 
       
        $query = "INSERT INTO personnels(IDPERSONNEL, CIVILITE, NOM, PRENOM, AUTRENOM, FK_FUNCTION, "
                . "GRADE, DATENAISS, PORTABLE, TELEPHONE) "
                . "VALUE(:id, :civilite, :nom, :prenom, :autrenom, :function, :grade, :datenaiss, :portable, :telephone)";
        
        return $this->query($query, $params);
    }
    
    
    
}
