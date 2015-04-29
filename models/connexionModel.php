<?php

class connexionModel extends Model {

    public function __construct() {
        parent::__construct();
    }

    public function authenticate($login, $pwd) {
        $query = "SELECT * FROM users WHERE LOGIN = :login AND PASSWORD = :pwd";
        $res = $this->query($query, array("login" => $login,
            "pwd" => $pwd));
        //var_dump($res);
        return (count($res) != 0);
    }
    
  

}
