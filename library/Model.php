<?php

/**
 * Le modele du dit controller est charger automatiquement 
 * et disponible par la variable $this->model
 * Les autres modeles peuvent etre charger en utilisant la methode 
 * loadModel($model) de la classe Controller qui charge le $model dans un tableau 
 * associant ou le $model est la cle
 */
class Model extends Database {

    protected $_table = "";
    protected $_key;

    public function __construct() {
        parent::__construct();
    }

    /**
     * Effectue la suppression
     * @param type $id
     * @return type le nombre de ligne affectee par la suppression
     */
    public function delete($id) {
        $query = "DELETE FROM `" . $this->_table . "` WHERE " . $this->_key . " = :id";
        $this->bind("id", $id);
        $result = $this->query($query);
        return ($result != 0);
    }

    /**
     * 
     * @return faux si aucun enregistrement
     * sinon retourne l'enregistrement sous forme de tableau associatif
     */
    public function selectAll() {
        $query = "SELECT * FROM `" . $this->_table . "`";
        $res = $this->query($query);
        if (empty($res)) {
            return false;
        }
        return $res;
    }
    

    public function insertAll($params = array()) {
        $str = "";
        foreach ($params as $key => $val) {
            $str .= ":$key,";
        }
        $str = substr($str, 0, strlen($str) - 1);
        $query = "INSERT INTO `" . $this->_table . "` VALUES ($str)";
        
        return $this->query($query, $params);
    }

    public function get($id) {
        return $this->query("SELECT * FROM `" . $this->_table . "` "
                        . " WHERE `" . $this->_key . "` = :id", array("id" => $id));
    }

   public function findBy($condition = array()){
       $str = ""; $params = array();
       foreach($condition as $key => $condition){
           $str .= " $key = :$key AND ";
           $params[$key] = $condition;
       }
       $str = substr($str, 0, strlen($str) - 4);
       $query =  "SELECT * FROM `".$this->_table . "` WHERE $str";
      
       return $this->row($query, $params);
   }
   
   public function updateBy($id, $params = array()){
       $str = "";
       foreach($params as $key => $param){
           $str .= " SET $key = :$key ,";
       }
       $str = substr($str, 0, strlen($str) - 1);
       $params = array_merge($params, array("key" => $id));
       $query = "UPDATE `" . $this->_table . "` $str WHERE `" . $this->_key . "` = :key";
       
       return $this->query($query, $params);
   }

}
