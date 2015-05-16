<?php

class droitModel extends Model {

    protected $_table = "droits";
    protected $_key = "IDDROIT";

    public function __construct() {
        parent::__construct();
    }

    public function selectAll() {
        $query = "SELECT * FROM droits ORDER BY CODEDROIT ASC";
        return $this->query($query);
    }

    public function emptyDroits($profile) {
        $query = "DELETE FROM listedroits WHERE PROFILE = '$profile'";
         return $this->query($query);
    }

    public function insertDroits($profile, $droits = array()) {
        $query = "INSERT INTO listedroits(CODEDROIT, PROFILE) VALUES(:droit, :profile)";
        $this->prepare($query);
        foreach ($droits as $droit) {
            $this->bind("droit", $droit);
            $this->bind("profile", $profile);
            $this->execute();
        }
    }

    public function findListeDroits($profile) {
        
        $query = "SELECT CODEDROIT from listedroits WHERE PROFILE = :profile";
        return $this->column($query, ["profile" => $profile]);
    }

}
