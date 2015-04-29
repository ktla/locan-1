<?php

class personnelModel extends Model{
    protected $_table = "personnels";
    protected $_key = "IDPERSONNEL";
    
    public function __construct() {
        parent::__construct();
    }
    
    public function selectAll(){
        $query = "SELECT p.*, f.FUNCTION as FUNCTION FROM personnels p "
                . "LEFT JOIN functions f ON f.IDFUNCTION = p.FK_FUNCTION";
        return $this->query($query);
    }
   
    
    
}
