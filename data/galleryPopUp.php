<?php

include '../include/header.php';

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

//print_r($_POST);

$imgId = $_GET['imgId'];

$img = $imgId{3}.$imgId{4};

$smarty->assign('img', $img);

$smarty->display('galleryPopUp.tpl');

?>
