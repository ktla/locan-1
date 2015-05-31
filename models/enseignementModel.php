<?php

class enseignementModel extends Model{
    protected  $_table = "enseignements";
    protected  $_key = "IDENSEIGNEMENT";
    
    public function __construct() {
        parent::__construct();
    }
    
    public function getEnseignements($idclasse){
        $query = "SELECT e.*, m.LIBELLE AS MATIERELIBELLE, m.*,"
                . " p.*, c.*, c.LIBELLE AS CLASSELIBELLE "
                . "FROM enseignements e "
                . "LEFT JOIN matieres m ON m.IDMATIERE = e.MATIERE "
                . "LEFT JOIN personnels p ON p.IDPERSONNEL = e.PROFESSEUR "
                . "LEFT JOIN classes c ON c.IDCLASSE = e.CLASSE "
                . "WHERE e.CLASSE = :classe "
                . "ORDER BY e.IDENSEIGNEMENT";
                
        $params = ["classe" => $idclasse];
        return $this->query($query, $params);
    }
    /**
     * Obtenir la liste des matieres non enseigner dans cette classe
     * @param type $idclasse
     */
    public function getNonEnseignements($idclasse){
         $query = "SELECT m.* FROM matieres m "
                 . "WHERE m.IDMATIERE NOT IN (SELECT e.MATIERE "
                 . "FROM enseignements e WHERE e.CLASSE = :idclasse) "
                 . "ORDER BY m.LIBELLE";
         return $this->query($query, ["idclasse" => $idclasse]);
    }
}
