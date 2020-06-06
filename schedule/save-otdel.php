<?php
require_once 'secure.php';
if (!Helper::can('admin') && !Helper::can('manager')) {
    header('Location: 404.php');
    exit();
}
if (isset($_POST['otdel_id'])) {
$otdel = new Otdel();
$otdel->otdel_id =
Helper::clearInt($_POST['otdel_id']);
$otdel->name = Helper::clearString($_POST['name']);
$otdel->special_id =
Helper::clearInt($_POST['special_id']);
$otdel->date_begin =
Helper::clearString($_POST['date_begin']);
$otdel->date_end =
Helper::clearString($_POST['date_end']);
if ((new OtdelMap())->save($otdel)) {
header('Location: view-otdel.php?id='.$otdel->otdel_id);
} else {
if ($otdel->otdel_id) {

header('Location: add-otdel.php?id='.$otdel->otdel_id);

} else {
header('Location: add-otdel.php');
}
}
}
?>