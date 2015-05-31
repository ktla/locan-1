<?php

class personnelModel extends Model{
    protected $_table = "personnels";
    protected $_key = "IDPERSONNEL";
    
    public function __construct() {
        parent::__construct();
    }
    
    public function selectAll(){
        $query = "SELECT p.*, CONCAT(p.NOM,' ', p.PRENOM) AS CNOM, f.LIBELLE as LIBELLE FROM personnels p "
                . "LEFT JOIN fonctions f ON f.IDFONCTION = p.FONCTION";
        return $this->query($query);
    }
   
    public function insert($params = array()){
        $query = "INSERT INTO personnels(IDPERSONNEL, CIVILITE, NOM, PRENOM, AUTRENOM, FONCTION, "
                . "GRADE, DATENAISS, PORTABLE, TELEPHONE) "
                . "VALUE(:id, :civilite, :nom, :prenom, :autrenom, :fonction, :grade, :datenaiss, :portable, :telephone)";
        
        return $this->query($query, $params);
    }
    
    public function findBy($condition = array()) {
        $str = "";
        $params = array();
        foreach ($condition as $key => $condition) {
            $str .= " $key = :$key AND ";
            $params[$key] = $condition;
        }
        $str = substr($str, 0, strlen($str) - 4);
       $query = "SELECT p.*, f.LIBELLE AS LIBELLE "
                . "FROM `" . $this->_table . "` p "
                . "LEFT JOIN fonctions f ON p.FONCTION = f.IDFONCTION "
                . "WHERE $str ";
        return $this->query($query, $params);
    }
    
    
    public function findSingleRowBy($conditions = array()) {
        $str = "";
        $params = array();
        foreach ($conditions as $key => $condition) {
            $str .= " $key = :$key AND ";
            $params[$key] = $condition;
        }
        $str = substr($str, 0, strlen($str) - 4);
        $query = "SELECT  p.*, CONCAT(p.NOM,' ', p.PRENOM) AS CNOM, f.LIBELLE as LIBELLE "
                . "FROM personnels p "
                . "LEFT JOIN fonctions f ON f.IDFONCTION = p.FONCTION "
                . "WHERE $str";
        return $this->row($query, $params);
    }
}
