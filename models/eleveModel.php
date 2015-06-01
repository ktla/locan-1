<?php

class EleveModel extends Model {

    protected $_table = "eleves";
    protected $_key = "IDELEVE";

    public function __construct() {
        parent::__construct();
    }

    public function select() {
        $query = "SELECT e.MATRICULE, CONCAT(e.NOM,' ',e.PRENOM) AS NOM "
                . "FROM eleves e ORDER BY MATRICULE";
        return $this->query($query);
    }
    

    public function selectAll(){
        $query = "SELECT e.*, CONCAT(e.MATRICULE, ' - ', e.NOM, ' ', e.PRENOM) AS CNOM, "
                . "p.ETABLISSEMENT AS FK_PROVENANCE, m.LIBELLE AS FK_MOTIFSORTIE "
                . "FROM eleves e "
                . "LEFT JOIN etablissements p ON p.IDETABLISSEMENT = e.PROVENANCE "
                . "LEFT JOIN motifsortie m ON m.IDMOTIF = e.MOTIFSORTIE "
                . "ORDER BY e.MATRICULE";
        return $this->query($query);
    }
    /**
     * @param type $params
     * @return type
     */
    public function insert($params = array()) {
        $query = "INSERT INTO eleves(MATRICULE, NOM, PRENOM, AUTRENOM, SEXE, PHOTO, CNI, NATIONALITE, "
                . "DATENAISS, LIEUNAISS, PAYSNAISS, DATEENTREE, PROVENANCE, REDOUBLANT) "
                . "VALUE(:matricule, :nom, :prenom, :autrenom, :sexe, :photo, :cni, :nationalite, :datenaiss, :lieunaiss, "
                . ":paysnaiss, :dateentree, :provenance, :redoublant)";
      
        return $this->query($query, $params);
    }
    
    
    
    public function findBy($condition = array()) {
        $str = ""; $params = array();
       foreach($condition as $key => $condition){
           $str .= " $key = :$key AND ";
           $params[$key] = $condition;
       }
       $str = substr($str, 0, strlen($str) - 4);
        $query = "SELECT e.*, p.ETABLISSEMENT AS FK_PROVENANCE, m.LIBELLE AS FK_MOTIF "
                . "FROM eleves e "
                . "LEFT JOIN etablissements p ON p.IDETABLISSEMENT = e.PROVENANCE "
                . "LEFT JOIN motifsortie m ON m.IDMOTIF = e.MOTIFSORTIE "
                . "WHERE $str";
        return $this->row($query, $params);
    }
    /**
     * Permet d'obtenir la liste des responsable de l'eleve passe en parametre
     * @param type $ideleve
     * @return type
     */
      public function getResponsables($ideleve){
        $query = "SELECT r.*, re.* "
                . "FROM responsables r "
                . "LEFT JOIN responsable_eleve re ON re.IDRESPONSABLE = r.IDRESPONSABLE AND re.IDELEVE = :eleve "
                . "WHERE r.IDRESPONSABLE IN (SELECT e.IDRESPONSABLE "
                . "FROM responsable_eleve e "
                . "WHERE e.IDELEVE = :ideleve)";
        return $this->query($query, ["eleve" => $ideleve, "ideleve" => $ideleve]);
    }
    /**
     * Permet d'obtenir la liste des responsable qui ne sont pas responsable de l'eleve passe en parametre
     * @param type $ideleve
     * @return type
     */
    public function getNonResponsables($ideleve){
        $query = "SELECT r.* "
                . "FROM responsables r "
                . "WHERE r.IDRESPONSABLE NOT IN (SELECT e.IDRESPONSABLE "
                . "FROM responsable_eleve e WHERE e.IDELEVE = :ideleve)";
        return $this->query($query, ["ideleve" => $ideleve]);
    }

}
