<?php

class classeModel extends Model {

    protected $_table = "classes";
    protected $_key = "IDCLASSE";

    public function __construct() {
        parent::__construct();
    }

    public function selectAll() {
        /* $query = "SELECT c.*, d.LIBELLE AS FK_DECOUPAGE FROM classes c "
          . "LEFT JOIN decoupage d ON c.DECOUPAGE = d.IDDECOUPAGE"; */
        $query = "SELECT c.* , d.LIBELLE AS FK_DECOUPAGE, n.* "
                . "FROM classes c "
                . "LEFT JOIN decoupage d ON c.DECOUPAGE = d.IDDECOUPAGE "
                . "LEFT JOIN niveau n ON n.IDNIVEAU = c.NIVEAU "
                . "ORDER BY c.NIVEAU";
        return $this->query($query);
    }
    /**
     * 
     * @param type $idclasse
     * @param type $matric
     * @return typeSELECT e.*, CONCAT(e.NOM, ' ', e.PRENOM) AS CNOM, i.IDINSCRIPTION 
                FROM eleves e 
                INNER JOIN inscription i ON e.IDELEVE = i.IDELEVE AND 
                        i.IDCLASSE = 1 
                WHERE e.MATRICULE LIKE '155%' 
                ORDER BY e.MATRICULE DESC LIMIT 1
     */
    public function findLastEleve($idclasse, $matric) {
        $matric = $matric."%";
        $query = "SELECT e.*, CONCAT(e.NOM, ' ', e.PRENOM) AS CNOM, i.IDINSCRIPTION "
                . "FROM eleves e "
                . "INNER JOIN inscription i ON e.IDELEVE = i.IDELEVE AND "
                        ."i.IDCLASSE = :idclasse "
                . "WHERE e.MATRICULE LIKE :matric "
                . "ORDER BY e.MATRICULE DESC LIMIT 1";
        $params = ["idclasse" => $idclasse, "matric" => $matric];
        return $this->row($query, $params);
    }

}
