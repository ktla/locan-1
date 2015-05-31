<?php

class niveauModel extends Model {
    protected  $_table = "niveau";
    protected  $_key = "IDNIVEAU";
    
    public function __construct() {
        parent::__construct();
    }
    
    public function selectAll() {
        $query = "SELECT * FROM `" . $this->_table . "` ORDER BY `" . $this->_key . "` DESC";
        return $this->query($query);
    }
    
}
