<?php
$header = 'Расписание и планы студентов';
require_once 'secure.php';
if (!Helper::can('admin') && !Helper::can('manager')) {
    header('Location: 404.php');
    exit();
}
require_once 'template/header.php';
$size = 5;
if (isset($_GET['page'])) {
    $page = Helper::clearInt($_GET['page']);
} 
else {
    $page = 1;
}
$count = (new StudentMap())->count();
$students = (new LessonPlanMap())->findStudents($page*$size-$size, $size);
?>
<div class="row">
 <div class="col-xs-12">
 <div class="box">
 <section class="content-header">
 <h1><?=$header;?></h1>
 <ol class="breadcrumb">
 <li><a href="/index.php"><i class="fa fa-dashboard"></i> Главная</a></li>
 <li class="active"><?=$header;?></li>
 </ol>
 </section>
 <?php if ($students) : ?>
 <div class="box-body">
 <table class="table table-bordered tablehover">
 <thead>
 <tr>
 <th>Ф.И.О. Студента</th>
 <th>Предмет</th>
 <th>Аудитория</th>
 <th></th>
 </tr>
 </thead>
<tbody>
 <?php foreach ($students as $student) : ?>
 <tr>
 <td><?=$student->fio;?></td>
<td><?=$student->otdel;?></td>
 <td><?=$student->count_plan;?></td>
 <td><?=($student->sum_hours)?
$student->sum_hours : 0;?></td>
 <td>
 <a href="list-plan.php?id=<?=$student->user_id;?>" title="План преподавателя"><i class="fa fa-table"></i></a>&nbsp;
 <a href="list-schedule.php?id=<?=$student->user_id;?>" title="Расписание преподавателя"><i class="fa fa-calendar-plus-o"></i></a>
 </td>
 </tr>
<?php endforeach;?>
 </tbody>
 </table>
 </div>
 <div class="box-body">
 <?php Helper::paginator($count, $page, $size); ?>
 </div>
 <?php else: ?>
 <div class="box-body">
 <p>Студенты не найдены</p>
 </div>
 <?php endif; ?>
 </div>
 </div>
</div>
<?php
require_once 'template/footer.php';
?>