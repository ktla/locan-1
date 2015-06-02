<?php

class scolariteModel extends Model{
    protected  $_table = "scolarites";
    protected  $_key = "IDSCOLARITE";
    
    public function __construct() {
       parent::__construct();
   }
   /**
    * Obtenir les scolarites de cette annees academique
    * @param type $anneeacad
    */
   public function getScolarite($anneeacad){
       $query = "SELECT s.*, c.LIBELLE AS CLASSELIBELLE "
               . "FROM scolarites s "
               . "LEFT JOIN classes c ON c.IDCLASSE = s.CLASSE AND c.ANNEEACADEMIQUE = :anneeacad";
       return $this->query($query, ["anneeacad" => $anneeacad]);
   }
   
  
}
