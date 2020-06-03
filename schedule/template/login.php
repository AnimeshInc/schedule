<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Расписание | Вход</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="css/AdminLTE.min.css">
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
   <b><h1>Расписание Занятий</h1></b>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg"><?=$message;?></p>
    <form action="auth.php" method="post">
      <div class="form-group has-feedback">
        <input name="login" text="email" class="login" placeholder="Логин">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input name="password" type="password" class="password" placeholder="Пароль">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="template/js/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="template/js/bootstrap.min.js"></script>
</body>
</html>

<style>
html{
    background: #e6e6fa;
}
        
.login-logo{
    text-align: center;
    padding: 4%;
}

.login-box-msg{
    color: #7d7f7d;
    text-align: center;
}

.login-box-body{
    width: 350px;
    padding: 2em;
    background: white;
    margin: -3% auto;
}

.login{
    width: calc(90%);
    padding: 1em;
    margin-top: 1em;
    border: none;
    background: url(https://image.flaticon.com/icons/svg/561/561188.svg) no-repeat;
    background-position: 97%;
    background-size: 25px;
}

.password{
    width: calc(90%);
    padding: 1em;
    margin-top: 1em;
    border: none;
    background: url(https://image.flaticon.com/icons/svg/481/481195.svg) no-repeat;
    background-position: 97%;
    background-size: 25px;
}

.btn{
    width: 30%;
    background: #2929ff;
    color: white;
    margin-top: 2em;
    border: none;
    border-radius: 5px;
    padding: 1em;
    cursor: pointer;
}
</style>