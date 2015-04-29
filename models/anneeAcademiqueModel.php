<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of anneeAcademiqueModel
 *
 * @author JP
 */
class anneeAcademiqueModel extends Model{
    protected $_table = 'anneeacademique';
    protected $_key = 'anneeacademique';
    
    public function __construct() {
        parent::__construct();
    }
}
