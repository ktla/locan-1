<?php

class EleveModel extends Model {

    protected $_table = "eleves";
    protected $_key = "id";

    public function __construct() {
        parent::__construct();
    }

    public function select() {
        $query = "SELECT e.MATRICULE, CONCAT(e.NOM,' ',e.PRENOM) AS NOM "
                . "FROM eleves e ORDER BY MATRICULE";
        return $this->query($query);
    }
    

    /**
     *  "matricule" => "",
                "nom" => $this->request->nomel,
                "prenom" => $this->request->prenomel,
                "autrenom" => $this->request->autrenom,
                "sexe" => $this->request->sexe,
                "photo" => $this->request->hiddenphoto,
                "cni" => $this->request->cni,
                "nationalite" => $this->request->nationalite,
                "datenaiss" => $this->request->datenaiss,
                "lieunaiss" => $this->request->lieunaiss,
                "paysnaiss" => $this->request->paysnaiss,
                "dateentree" => $this->request->dateentree,
                "provenance" => $this->request->provenance,
                "redoublant" => $redoublant,
                "datesortie" => $this->request->datesortie,
                "motifsortie" => $this->request->motifsortie
      ];
     * @param type $params
     * @return type
     */
    public function insert($params) {
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

}
