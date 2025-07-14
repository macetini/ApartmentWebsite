<?php

require_once __DIR__ . '/../framework/header.php';

$currentYear = htmlspecialchars($_GET['year']);
$smarty->assign("currentYear", $currentYear);

$currentTimeStamp = time();
$smarty->assign("currentTimeStamp", $currentTimeStamp);

$previousYear = intval($currentYear) - 1;
$smarty->assign("previousYear", $previousYear);

$nextYear = intval($currentYear) + 1;
$smarty->assign("nextYear", $nextYear);

$yearTimeStamps = Array(13);
for ($month = 1; $month <= 12; $month++) {
    $daysInMonth = cal_days_in_month(CAL_GREGORIAN, $month, $currentYear);
    $yearTimeStamps[$month - 1] = Array($daysInMonth);
    for ($day = 1; $day <= $daysInMonth; $day++) {
        $yearTimeStamps[$month - 1][$day - 1] = strtotime($currentYear . "-" . $month . "-" . $day);
    }
}
$daysInFirstMonth = cal_days_in_month(CAL_GREGORIAN, 1, $nextYear);
for ($day = 1; $day <= $daysInFirstMonth; $day++) {
    $yearTimeStamps[12][$day - 1] = strtotime($nextYear . "-1-" . $day);
}
$smarty->assign("yearTimeStamps", $yearTimeStamps);

$seasons = Db::callArg("selectAllSeasons", [$currentYear]);
$pricesPerDay = Array();
foreach ($seasons as $season) {

    $day = strtotime($season['BEGINNING']);
    $end = strtotime($season['ENDING']);

    do {
        array_push($pricesPerDay, [$day, $season['PRICE_PER_NIGHT']]);
        $day = strtotime('+1 day', $day);
    } while ($day <= $end);
}
//$smarty->assign("addPrice", $seasons[8]['PRICE_PER_NIGHT'] . "€");
$smarty->assign("pricesPerDay", $pricesPerDay);

$seasonsExceptOuter = Db::callArg("selectExeceptOuterSeasons", [$currentYear]);
$pricePerMonth = Array();
foreach ($seasonsExceptOuter as $season) {
    $begin = DateTime::createFromFormat("m/d/Y", $season['BEGIN']);
    $ending = DateTime::createFromFormat("m/d/Y", $season['END']);

    do {
        $month = intval($begin->format('m'));
        if ($begin->format('Y') == $currentYear) {
            $pricePerMonth[$month - 1] = $season['PRICE_PER_NIGHT'];
        } else {
            $pricePerMonth[12] = $season['PRICE_PER_NIGHT'];
        }

        date_add($begin, date_interval_create_from_date_string('1 day'));
    } while ($begin <= $ending);
}

$pricePerMonth[0] = $pricePerMonth[0] . "*";
$pricePerMonth[11] = $pricePerMonth[11] . "*";
$pricePerMonth[12] = $pricePerMonth[12] . "*";

$smarty->assign("pricePerMonth", $pricePerMonth);

$reserved = Db::callArg("selectAllReserved", [$previousYear, $currentYear, $nextYear]);
$bookedDates = Array();
foreach ($reserved as $period) {
    $arrival = strtotime($period['ARRIVAL']);
    $departure = strtotime($period['DEPARTURE']);

    while ($arrival < $departure) {
        $arrival = strtotime('+1 day', $arrival);
        array_push($bookedDates, $arrival);
    }
}
$smarty->assign("bookedDates", $bookedDates);

$smarty->display('datePicker.tpl');
