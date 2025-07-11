<?php

ini_set('display_errors', TRUE);
error_reporting(E_ALL | ~E_NOTICE);

// Not so sure about this one?
date_default_timezone_set('Europe/Zagreb');

require_once 'db/Db.php';

$currentYear = date('Y');
$seasons = Db::callArg("selectAllSeasonsDates", array($currentYear));

if(empty($seasons)) {
    Db::callArg("addNewSeason", array('HSEASON1', $currentYear.'-01-01', $currentYear.'-01-04', 60, 'HIGH_SEASON', $currentYear));
    Db::callArg("addNewSeason", array('REST1', $currentYear.'-01-05', $currentYear.'-04-30', 40, 'OUTER_SEASON', $currentYear));
    Db::callArg("addNewSeason", array('BSEASONE', $currentYear.'-05-01', $currentYear.'-05-31', 40, 'BEGINNING_SEASON', $currentYear));
    Db::callArg("addNewSeason", array('PSEASONE', $currentYear.'-06-01', $currentYear.'-06-30', 50, 'PRE_SEASON', $currentYear));
    Db::callArg("addNewSeason", array('HSEASON2', $currentYear.'-07-01', $currentYear.'-08-31', 60, 'HIGH_SEASON', $currentYear));
    Db::callArg("addNewSeason", array('HSEASON3', $currentYear.'-09-01', $currentYear.'-09-30', 50, 'HIGH_SEASON', $currentYear) );
    Db::callArg("addNewSeason", array('ESEASON', $currentYear.'-10-01', $currentYear.'-10-31', 50, 'END_SEASON', $currentYear));
    Db::callArg("addNewSeason", array('REST2', $currentYear.'-11-01', $currentYear.'-12-15', 40, 'OUTER_SEASON', $currentYear));
    Db::callArg("addNewSeason", array('HSEASON4', $currentYear.'-12-16', $currentYear.'-01-04', 60, 'HIGH_SEASON', $currentYear));
    
    $nextYear = intval($currentYear) + 1;
    Db::callArg("addNewSeason", array('NSEASON', $nextYear.'-01-05', $nextYear.'-01-31', 40, 'NEXT_SEASON', $currentYear));
}


require_once 'smarty/libs/Smarty.class.php';

$smarty = new \Smarty\Smarty;
$smarty->registerPlugin('modifier', 'ceil', 'ceil');
$smarty->debugging = false;
$smarty->caching = false;

$smarty->setTemplateDir(__DIR__.'/smarty/data/templates');
$smarty->setCompileDir(__DIR__.'/smarty/data/templates_c');
$smarty->setCacheDir(__DIR__.'/smarty/data/cache');
$smarty->setConfigDir(__DIR__.'/smarty/data/configs');

?>