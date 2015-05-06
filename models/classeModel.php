<?php

class classeModel extends Model{
    protected  $_table = "classes";
    protected $_key = "CODE";
    public function __construct() {
        parent::__construct();
    }
    public function selectAll(){
        $query = "SELECT c.*, d.LIBELLE AS FK_DECOUPAGE FROM classes c "
                . "LEFT JOIN decoupage d ON c.DECOUPAGE = d.IDDECOUPAGE";
        return $this->query($query);
    }
    
}
