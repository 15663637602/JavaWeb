<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  
<head>
    <meta charset="utf-8">
    <title>登陆</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes"> 
    
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />

<link href="css/font-awesome.css" rel="stylesheet">
    <link href="http://libs.useso.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
    
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/pages/signin.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
var yz = false;
function loadimage(){ 
	document.getElementById("randImage").src = "image.jsp?"+Math.random(); 
	} 
function validate2(){
	var tt = document.getElementById("rand").value;
	if (window.XMLHttpRequest) {
        req = new XMLHttpRequest();
    }else if (window.ActiveXObject) {
        req = new ActiveXObject("Microsoft.XMLHTTP");
    }
    if(!req){
    	alert("Error Initializing XMLHttpRequest!");
    }
    var t = new Date();
		req.open("POST","testtestt.do?time="+t.getTime(),true); 
		req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		req.onreadystatechange = function(){
			if(req.readyState==4){
				if(req.status==200){		
					 res = req.responseText;
					if(res=="请点击确定"){
						yz = true;
					}else{
						yz = false;
					}
				}
			}
		}
		req.send("group_id="+tt); 
}

</script>
</head>

<body>
	
	<div class="navbar navbar-fixed-top">
	
	<div class="navbar-inner">
		
		<div class="container">
			
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</a>
			
			<a class="brand" href="index.jsp">
				中国铁路客户服务中心		
			</a>		
			
		  <div class="nav-collapse">
				<ul class="nav pull-right">
					
					<li class="">						
						<a href="signup_07.jsp" class="">
							<h4>还没注册？</h4>
						</a>
						
				  </li>
					
					<li class="">						
						<a href="index.jsp" class="">
							<i class="icon-chevron-left"></i>
							返回首页
					  </a>
						
					</li>
				</ul>
				
			</div><!--/.nav-collapse -->	
	
		</div> <!-- /container -->
		
	</div> <!-- /navbar-inner -->
	
</div> <!-- /navbar -->



<div class="account-container">
	
	<div class="content clearfix">
		
		<form action="login.do" method="post">
		
			<h1>欢迎使用12306</h1>		
			
			<div class="login-fields">
				
				<p id="check_pass">请输入您的账户名和密码</p>
				<div id="error">${error}</div>
				<div class="field">
					<label for="username">Username</label>
					<input type="text" id="name" name="name"  placeholder="请输入账户名" class="login username-field"/>
                    <div id="validate_username"></div>
				</div> <!-- /field -->
				
				<div class="field">
					<label for="password">Password</label>
					<input type="password" id="pass" name="pass"  placeholder="请输入密码" class="login password-field"/>
                    <div id="validate_password"></div>
				</div> <!-- /password -->
				
				
			</div> <!-- /login-fields -->
			
			<div class="login-actions">
				<input type="submit" class="button btn btn-success btn-large" value="登陆"> 
			</div> <!-- .actions -->
			
			
			
		</form>
		
	</div> <!-- /content -->
	
</div> <!-- /account-container -->




<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/bootstrap.js"></script>

<script src="js/signin.js"></script>

</body>

</html>

