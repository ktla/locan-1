<?php

class EleveModel extends Model {

    protected $_table = "eleves";
    protected $_key = "id";

    public function __construct() {
        parent::__construct();
    }

    public function selectAll() {
        $query = "SELECT e.MATRICULE, CONCAT(e.NOM,' ',e.PRENOM) AS NOM "
                . "FROM eleves e ORDER BY MATRICULE";
        return $this->query($query);
    }

    /**
     * $params = ["nom" => $this->request->nom,
      "prenom" => $this->request->prenom,
      "autrenom" => $this->request->autrenom,
      "sexe" => $this->request->postsexe,
      "photo" => $photo,
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
        $query = "INSERT INTO eleves(MATRICULE, NOM, PRENOM, AUTRENOM, SEXE, PHOTO, NATIONALITE, "
                . "DATENAISS, LIEUNAISS, PAYSNAISS, DATEENTREE, PROVENANCE, REDOUBLANT, DATESORTIE, MOTIFSORTIE) "
                . "VALUE(:matricule, :nom, :prenom, :autrenom, :sexe, :photo, :nationalite, :datenaiss, :lieunaiss, "
                . ":paysnaiss, :dateentree, :provenance, :redoublant, :datesortie, :motifsortie)";
        return $this->query($query, $params);
    }

}
