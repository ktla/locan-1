<?php
class inscriptionModel extends Model{
    protected $_table = "inscription";
    protected  $_key = "IDINSCRIPTION";
    
    public function __construct() {
        parent::__construct();
    }
    
    /**
     * Liste des eleves deja inscrits
     * @param type $idclasse
     * @param type $anneeacademique
     * @return type la liste des eleves inscripts
     */
    public function getInscrits($idclasse, $anneeacademique){
     
        /*$query = "SELECT e.*, CONCAT(e.NOM, ' ', e.PRENOM) AS CNOM FROM eleves e "
                . "WHERE e.IDELEVE IN (SELECT i.IDELEVE FROM inscription i "
                . "WHERE i.IDCLASSE = :idclasse AND i.ANNEEACADEMIQUE = :anneeacademique) "
                . "ORDER BY e.MATRICULE";*/
        $query = "SELECT e.*, CONCAT(e.NOM, ' ', e.PRENOM) AS CNOM, i.IDINSCRIPTION "
                . "FROM eleves e "
                . "INNER JOIN inscription i ON e.IDELEVE = i.IDELEVE AND "
                        ."i.IDCLASSE = :idclasse AND i.ANNEEACADEMIQUE = :anneeacademique "
                . "ORDER BY e.MATRICULE";
        $eleves = $this->query($query, ["idclasse" => $idclasse, "anneeacademique" => $anneeacademique]);
        return $eleves;
    }
    /**
     * Liste des eleves succeptible d'etre inscrit,
     * cette liste est egale a liste totale moins ceux qui sont deja inscrit dans n'importe qu'elle classe
     * @param type $anneeacademique
     *  * @return type la liste des eleves non inscript durant cette annee academique
     */
    public function getNonInscrits($anneeacademique){
        $query = "SELECT e.*, CONCAT(e.NOM, ' ', e.PRENOM) AS CNOM FROM eleves e "
                . "WHERE e.IDELEVE NOT IN (SELECT i.IDELEVE FROM inscription i "
                . "WHERE i.ANNEEACADEMIQUE = :anneeacademique) "
                . "ORDER BY e.MATRICULE";
        $eleves = $this->query($query, ["anneeacademique" => $anneeacademique]);
        return $eleves;
    }
}
