<?php

require_once __DIR__.'/../framework/header.php';

$thisYear = htmlspecialchars($_GET['year']);

$currYear = $thisYear;

$smarty->assign("currYear", $currYear);

$previousYear = $thisYear;
$previousYear[3] = (String) (intval($previousYear[3]) - 1);
$smarty->assign("previousYear", $previousYear);

$nextYear = $thisYear;
$nextYear[3] = (String) (intval($nextYear[3]) + 1);

$smarty->assign("nextYear", $nextYear);

$daysPerMounth = array(
    "January" => cal_days_in_month(CAL_GREGORIAN, 1, $currYear),
    "February" => cal_days_in_month(CAL_GREGORIAN, 2, $currYear),
    "March" => cal_days_in_month(CAL_GREGORIAN, 3, $currYear),
    "April" => cal_days_in_month(CAL_GREGORIAN, 4, $currYear),
    "May" => cal_days_in_month(CAL_GREGORIAN, 5, $currYear),
    "June" => cal_days_in_month(CAL_GREGORIAN, 6, $currYear),
    "July" => cal_days_in_month(CAL_GREGORIAN, 7, $currYear),
    "August" => cal_days_in_month(CAL_GREGORIAN, 8, $currYear),
    "September" => cal_days_in_month(CAL_GREGORIAN, 9, $currYear),
    "October" => cal_days_in_month(CAL_GREGORIAN, 10, $currYear),
    "November" => cal_days_in_month(CAL_GREGORIAN, 11, $currYear),
    "December" => cal_days_in_month(CAL_GREGORIAN, 12, $currYear),
    "January/" . $nextYear => cal_days_in_month(CAL_GREGORIAN, 1, $nextYear));

$smarty->assign("daysPerMounth", $daysPerMounth);

$currDate = date("Ymd");

$currDate[5] = (String) (intval($currDate[5]) - 1);

$smarty->assign("currDate", $currDate);

$seasons = Db::callArg("selectAllSeasonsDates", array($currYear));

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

$seasonsExceptOuter = Db::callArg("selectExeceptOuterSeasons", array($currYear));

foreach ($seasonsExceptOuter as $season) {

    $begine = DateTime::createFromFormat("m/d/Y", $season['BEGINE']);
    $ending = DateTime::createFromFormat("m/d/Y", $season['ENDING']);

    do {
        $month = intval($begine->format('m'));

        if ($begine->format('Y') == $currYear) {
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
