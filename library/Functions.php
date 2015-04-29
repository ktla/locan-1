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
