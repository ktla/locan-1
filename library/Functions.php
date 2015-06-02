<?php

/**
 * Contient l'ensemble des fonctions 
 * utiliser a travers les view, controller ou model
 */

/**
 * Cette fonction permet de creer une URL MVC a partir
 * d'un controller, d'une action et d'un tableau d'arguments
 */
function url($controller = "index", $action = "", $query = "") {
    $str = SITE_ROOT . $controller;
    if(!empty($action)){
        $str .=  "/" . $action;
    }
    if (is_array($query)) {
        foreach ($query as $val) {
            $str .= "/" . $val;
        }
    } elseif (!empty($query)) {
        $str .= "/" . $query;
    }
    return $str;
}

/**
 * Verifie si l'utilisateur est autoriser a 
 * acceder a cette page en utilisant son tableau de droit
 * La liste des droits d'un utilisateur = liste des droit du profile + droit specifique (pas encore implemente)
 * @global type $DROITS est defini dans la classe Application et contien son tableau de droit
 * @param type $codedroit
 * @return boolean
 */

function isAuth($codedroit){
    //var_dump($_SESSION['droits']);die();
    if(in_array($codedroit, $_SESSION['droits'])){
        return true;
    }
    return false;
}


function btn_add($action){
    return "<img src = '" . SITE_ROOT  . "public/img/btn_add.png' onclick = '".$action."'/>";
}
function btn_cancel($action){
    return "<img src = '" . SITE_ROOT  . "public/img/btn_cancel.png' onclick = '".$action."'/>";
}

function btn_ok($action){
    return "<img src = \"" . SITE_ROOT  . "public/img/btn_ok.png \" onclick = \"".$action."\"/>";
}
function btn_add_disabled($action = ""){
    return "<img src = \"" . SITE_ROOT  . "public/img/btn_add_disabled.png \" onclick = \"".$action."\"/>";
}
function btn_effacer_disabled($action = ""){
    return "<img style = 'cursor: auto;' src = \"" . SITE_ROOT  . "public/img/btn_effacer_disabled.png \" onclick = \"".$action."\"/>";
}
function btn_effacer($action){
    return "<img src = \"" . SITE_ROOT  . "public/img/btn_effacer.png \" onclick = \"".$action."\"/>";
}
function btn_cancel_disabled($action = ""){
    return "cancel disabled";
}

function btn_ok_disabled($action = ""){
    return "ok disabled";
}