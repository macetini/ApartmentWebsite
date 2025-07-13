<?php

require_once __DIR__ . '/../framework/header.php';

$currentYear = date('Y');
echo "Checking season data from a year: ".$currentYear."<br>\n";

$seasons = Db::callArg("selectAllSeasonsDates", array($currentYear));

if (empty($seasons)) {
    echo "<br>\nNo season data found, adding new data for the next 100 years:<br>\n";
    
    $next100 = $currentYear + 100; 
    for ($year = $currentYear; $year <= $next100; $year++) {
        echo "Adding data for the year: ".$year;
        
        Db::callArg("addNewSeason", array('HSEASON1', $year . '-01-01', $year . '-01-04', 60, 'HIGH_SEASON', $year));
        Db::callArg("addNewSeason", array('REST1', $year . '-01-05', $year . '-04-30', 40, 'OUTER_SEASON', $year));
        Db::callArg("addNewSeason", array('BSEASONE', $year . '-05-01', $year . '-05-31', 40, 'BEGINNING_SEASON', $year));
        Db::callArg("addNewSeason", array('PSEASONE', $year . '-06-01', $year . '-06-30', 50, 'PRE_SEASON', $year));
        Db::callArg("addNewSeason", array('HSEASON2', $year . '-07-01', $year . '-08-31', 60, 'HIGH_SEASON', $year));
        Db::callArg("addNewSeason", array('HSEASON3', $year . '-09-01', $year . '-09-30', 50, 'HIGH_SEASON', $year));
        Db::callArg("addNewSeason", array('ESEASON', $year . '-10-01', $year . '-10-31', 50, 'END_SEASON', $year));
        Db::callArg("addNewSeason", array('REST2', $year . '-11-01', $year . '-12-15', 40, 'OUTER_SEASON', $year));
        Db::callArg("addNewSeason", array('HSEASON4', $year . '-12-16', $year . '-01-04', 60, 'HIGH_SEASON', $year));
        
        $nextYear = intval($year) + 1;
        Db::callArg("addNewSeason", array('NSEASON', $nextYear . '-01-05', $nextYear . '-01-31', 40, 'NEXT_SEASON', $year));
        
        echo " - OK<br>\n";
    }
}

echo "<br>\nFINISHED"."<br>\n";