<?php

/**
  Function main permettant de tout router

 */
class Router {

    public static function route() {
        global $url;
        if (!isset($url)) {
            $controllerName = DEFAULT_CONTROLLER;
            $action = DEFAULT_ACTION;
        } else {

            $urlArray = explode("/", $url);
            $controllerName = $urlArray[0];
            $action = (isset($urlArray[1]) && $urlArray[1] != '') ? $urlArray[1] : DEFAULT_ACTION;
        }
        //Capturer les les parametre GET
        $query1 = (isset($urlArray[2]) && $urlArray[2] != '') ? $urlArray[2] : null;
        $query2 = (isset($urlArray[3]) && $urlArray[3] != '') ? $urlArray[3] : null;
        $query3 = (isset($urlArray[4]) && $urlArray[4] != '') ? $urlArray[4] : null;
        $query4 = (isset($urlArray[5]) && $urlArray[5] != '') ? $urlArray[5] : null;

        //Modifier le nom du controller pour correspondre 
        //aux regles de nommange
        //Tous les controllers s'appelle ClassController

        $class = ucfirst($controllerName) . 'Controller';

        //Instantier la classe approprier

        if (class_exists($class) && (int) method_exists($class, $action)) {
            $controller = new $class;
            if ($query1 != null) {
                if ($query2 != null) {
                    if ($query3 != null) {
                        if ($query4 != null) {
                            $controller->$action($query1, $query2, $query3, $query4);
                        } else
                            $controller->$action($query1, $query2, $query3);
                    } else
                        $controller->$action($query1, $query2);
                } else
                    $controller->$action($query1);
            } else
                $controller->$action();
            //$controller->$action($query1, $query2, $query3, $query4);
            //call_user_func_array(array($controller, $action), $query1);
        }
        else {
            die("1. Fichier <strong> '$controllerName.php'</strong> contient une classe 
			<strong> '$class' </strong> manquante.<br/>
			<strong> '$action' </strong> est manquant dans le controller 
			<strong> '$controllerName.php' </strong>");
        }
    }

    public static function url($controller = "index", $action = "", $query = "") {
        $str = SITE_ROOT . $controller;
        if (!empty($action)) {
            $str .= "/" . $action;
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

}
