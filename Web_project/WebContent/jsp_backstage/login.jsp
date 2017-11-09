<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="js/html5.js"></script>
<script type="text/javascript" src="js/respond.min.js"></script>
<script type="text/javascript" src="js/PIE_IE678.js"></script>
<![endif]-->
<link href="css/H-ui.css" rel="stylesheet" type="text/css" />
<link href="css/H-ui.login.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="js/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>后台登录-就业管理系统</title>
<meta name="keywords" content="my12306">
<meta name="description" content="my12306">
</head>
<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="loginWraper">
  <div id="loginform" class="loginBox">
    <form action="b_login.do" method="post">
      <div class="formRow user">
      <div>${b_error}</div>
        <input id="username" name="username" type="text" placeholder="账户" class="input_text input-big" autocomplete="off">
      </div>
      <div class="formRow password">
        <input id="password" name="password" type="password" placeholder="密码" class="input_text input-big">
      </div>
      <div class="formRow">
        <input  type="submit" class="btn radius btn-success btn-big" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
        <input  type="reset" class="btn radius btn-default btn-big" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
      </div>
    </form>
  </div>
</div>
<div class="footer">毕业生就业后台管理系统</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>

</body>
</html>