<?php

class responsableModel extends Model{
    protected  $_table = "responsables";
    protected  $_key = "IDRESPONSABLE";
    
    public function __construct() {
        parent::__construct();
    }
}
