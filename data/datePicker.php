<?php

require_once __DIR__.'/../framework/header.php';

$currentYear = htmlspecialchars($_GET['year']);

$smarty->assign("currYear", $currentYear);

$previousYear = $currentYear;
$previousYear[3] = (String) (intval($previousYear[3]) - 1);
$smarty->assign("previousYear", $previousYear);

$nextYear = $currentYear;
$nextYear[3] = (String) (intval($nextYear[3]) + 1);

$smarty->assign("nextYear", $nextYear);

$daysPerMounth = array(
    "January" => cal_days_in_month(CAL_GREGORIAN, 1, $currentYear),
    "February" => cal_days_in_month(CAL_GREGORIAN, 2, $currentYear),
    "March" => cal_days_in_month(CAL_GREGORIAN, 3, $currentYear),
    "April" => cal_days_in_month(CAL_GREGORIAN, 4, $currentYear),
    "May" => cal_days_in_month(CAL_GREGORIAN, 5, $currentYear),
    "June" => cal_days_in_month(CAL_GREGORIAN, 6, $currentYear),
    "July" => cal_days_in_month(CAL_GREGORIAN, 7, $currentYear),
    "August" => cal_days_in_month(CAL_GREGORIAN, 8, $currentYear),
    "September" => cal_days_in_month(CAL_GREGORIAN, 9, $currentYear),
    "October" => cal_days_in_month(CAL_GREGORIAN, 10, $currentYear),
    "November" => cal_days_in_month(CAL_GREGORIAN, 11, $currentYear),
    "December" => cal_days_in_month(CAL_GREGORIAN, 12, $currentYear),
    "January/" . $nextYear => cal_days_in_month(CAL_GREGORIAN, 1, $nextYear));

$smarty->assign("daysPerMounth", $daysPerMounth);

$currentDate = date("Ymd");

$currentDate[5] = (String) (intval($currentDate[5]) - 1);

$smarty->assign("currDate", $currentDate);

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
    
    //TODO - CHECK!
    $nextYear = intval($currentYear) + 1;
    Db::callArg("addNewSeason", array('NSEASON', $nextYear.'-01-05', $nextYear.'-01-31', 40, 'NEXT_SEASON', $currentYear));
    
    Db::callArg("addNewSeason", array('HSEASON1', $nextYear.'-01-01', $nextYear.'-01-04', 60, 'HIGH_SEASON', $nextYear));
    Db::callArg("addNewSeason", array('REST1', $nextYear.'-01-05', $nextYear.'-04-30', 40, 'OUTER_SEASON', $nextYear));
    Db::callArg("addNewSeason", array('BSEASONE', $nextYear.'-05-01', $nextYear.'-05-31', 40, 'BEGINNING_SEASON', $nextYear));
    Db::callArg("addNewSeason", array('PSEASONE', $nextYear.'-06-01', $nextYear.'-06-30', 50, 'PRE_SEASON', $nextYear));
    Db::callArg("addNewSeason", array('HSEASON2', $nextYear.'-07-01', $nextYear.'-08-31', 60, 'HIGH_SEASON', $nextYear));
    Db::callArg("addNewSeason", array('HSEASON3', $nextYear.'-09-01', $nextYear.'-09-30', 50, 'HIGH_SEASON', $nextYear) );
    Db::callArg("addNewSeason", array('ESEASON', $nextYear.'-10-01', $nextYear.'-10-31', 50, 'END_SEASON', $nextYear));
    Db::callArg("addNewSeason", array('REST2', $nextYear.'-11-01', $nextYear.'-12-15', 40, 'OUTER_SEASON', $nextYear));
    Db::callArg("addNewSeason", array('HSEASON4', $nextYear.'-12-16', $nextYear.'-01-04', 60, 'HIGH_SEASON', $nextYear));
    
    $afterNextYear = intval($nextYear) + 1;
    Db::callArg("addNewSeason", array('NSEASON', $afterNextYear.'-01-05', $afterNextYear.'-01-31', 40, 'NEXT_SEASON', $nextYear));
}

$pricesPerDay = Array();

foreach ($seasons as $season) {

    $begine = DateTime::createFromFormat("m/d/Y", $season['BEGINE']);
    $ending = DateTime::createFromFormat("m/d/Y", $season['ENDING']);

    do {
        $calibMonth = intval(substr($begine->format('dmY'), 2, 2), 10) - 1;

        $calibMonthStr = sprintf('%02d', $calibMonth);

        $priceAndDate[0] = $begine->format('Y') . $calibMonthStr . $begine->format('d');

        $priceAndDate[1] = $season['PRICE_PER_NIGHT'];

        array_push($pricesPerDay, $priceAndDate);

        date_add($begine, date_interval_create_from_date_string('1 day'));
    } while ($begine <= $ending);
}

$smarty->assign("addPrice", $seasons[8]['PRICE_PER_NIGHT'] . "€");

$smarty->assign("pricesPerDay", $pricesPerDay);

$pricePerMonth = Array();

$seasonsExceptOuter = Db::callArg("selectExeceptOuterSeasons", array($currentYear));

foreach ($seasonsExceptOuter as $season) {

    $begine = DateTime::createFromFormat("m/d/Y", $season['BEGINE']);
    $ending = DateTime::createFromFormat("m/d/Y", $season['ENDING']);

    do {
        $month = intval($begine->format('m'));

        if ($begine->format('Y') == $currentYear) {
            $pricePerMonth[$month - 1] = $season['PRICE_PER_NIGHT'];
        } else {
            $pricePerMonth[12] = $season['PRICE_PER_NIGHT'];
        }

        date_add($begine, date_interval_create_from_date_string('1 day'));
    } while ($begine <= $ending);
}

$pricePerMonth[0] = $pricePerMonth[0] . "*";
$pricePerMonth[11] = $pricePerMonth[11] . "*";
$pricePerMonth[12] = $pricePerMonth[12] . "*";

$smarty->assign("pricePerMonth", $pricePerMonth);

$reserved = Db::callQuery("selectAllReserved");

$bookedDates = Array();

foreach ($reserved as $period) {

    $arrival = $period['ARRIVAL'];
    $departure = $period['DEPARTURE'];

    $arrivalDate = DateTime::createFromFormat("Ymd", $arrival);
    $departureDate = DateTime::createFromFormat("Ymd", $departure);

    date_sub($departureDate, date_interval_create_from_date_string('1 day'));

    while ($arrivalDate < $departureDate) {

        date_add($arrivalDate, date_interval_create_from_date_string('1 day'));

        $bookedDate = $arrivalDate->format("Ymd");
        $bookedDate[5] = (String) (intval($bookedDate[5]) - 1);

        array_push($bookedDates, $bookedDate);
    }
}

$smarty->assign("bookedDates", $bookedDates);

$smarty->display('datePicker.tpl');