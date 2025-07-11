<?php

ini_set('display_errors', TRUE);
error_reporting(E_ALL | ~E_NOTICE);

// Not so sure about this one?
date_default_timezone_set('Europe/Zagreb');

require_once 'db/Db.php';

require_once 'smarty/libs/Smarty.class.php';

$smarty = new \Smarty\Smarty;
$smarty->registerPlugin('modifier', 'ceil', 'ceil');
$smarty->debugging = false;
$smarty->caching = false;

$smarty->setTemplateDir(__DIR__.'/smarty/data/templates');
$smarty->setCompileDir(__DIR__.'/smarty/data/templates_c');
$smarty->setCacheDir(__DIR__.'/smarty/data/cache');
$smarty->setConfigDir(__DIR__.'/smarty/data/configs');