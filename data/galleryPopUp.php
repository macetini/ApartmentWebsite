<?php

require_once __DIR__.'/../framework/header.php';

$imgId = htmlspecialchars($_GET['imgId']);

$img = $imgId[3].$imgId[4];

$smarty->assign('img', $img);
$smarty->display('galleryPopUp.tpl');