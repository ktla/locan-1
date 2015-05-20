<?php
session_start();

define('DS', DIRECTORY_SEPARATOR);
define('ROOT', dirname(dirname(__FILE__)));
define('TIME_OUT', 3600);

$url = isset($_GET['url']) ? $_GET['url'] : null;
$css = "";
$_JS = "";
require_once(ROOT . DS . 'library' . DS . 'Bootstrap.php');
