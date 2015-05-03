<?php

class connexionModel extends Model {

    public function __construct() {
        parent::__construct();
    }

    public function authenticate($login, $pwd) {
        $query = "SELECT * FROM users WHERE LOGIN = :login AND PASSWORD = :pwd";
        $res = $this->row($query, array("login" => $login,
            "pwd" => $pwd));
        
        $val = count($res);
        if($val != 0){
            $_SESSION['profile'] = $res['PROFILE'];
        }
        return ($val != 0);
    }
    
  

}
