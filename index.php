<?php

require('framework/smarty/libs/Smarty.class.php');

$smarty = new Smarty();

$smarty->template_dir = 'smarty/templates';
$smarty->compile_dir = 'smarty/templates_c';
$smarty->cache_dir = 'smarty/smarty/cache';
$smarty->config_dir = 'smarty/smarty/configs';

$smarty->display('index.tpl');

?>