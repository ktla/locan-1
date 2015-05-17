<?php
session_start();

define('DS', DIRECTORY_SEPARATOR);
define('ROOT', dirname(dirname(__FILE__)));

$url = isset($_GET['url']) ? $_GET['url'] : null;
$css = "";
$_JS = "";
require_once(ROOT . DS . 'library' . DS . 'Bootstrap.php');
