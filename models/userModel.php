<?php

class userModel extends Model{
  
    public function __construct() {
        parent::__construct();
    }
    
    public function mesConnexions($compte){
        $query = "SELECT * FROM connexions WHERE COMPTE = :compte ORDER BY IDCONNEXION DESC";
        return $this->query($query, ["compte" => $compte]);
    }
}
