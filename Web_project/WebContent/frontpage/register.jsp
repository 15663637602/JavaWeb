<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate" media="handheld"  />
<!-- end 云适配 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册</title>
<meta property="qc:admins" content="23635710066417756375" />
<meta content="求职" name="description">
<meta content="求职" name="keywords">

<meta name="baidu-site-verification" content="QIQ6KC1oZ6" />

<!-- <div class="web_root"  style="display:none">h</div> -->
<script type="text/javascript">
var ctx = "h";
console.log(1);
</script>
<link rel="Shortcut Icon" href="h/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="style/css/style.css"/>

<script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>

<script type="text/javascript" src="style/js/jquery.lib.min.js"></script>
<script type="text/javascript" src="style/js/core.min.js"></script>


<script type="text/javascript">
var youdao_conv_id = 271546; 
</script> 
<script type="text/javascript" src="style/js/conv.js"></script>
<script type="text/javascript">
var position=33;
var req = false;
var stu_no1 = false;
var stu_code1 = false;
var pass1 = false;
var email = false;
var pass2 = false;
function createRequest(){  		
	if (window.XMLHttpRequest) {
     req = new XMLHttpRequest();
 }else if (window.ActiveXObject) {
     req = new ActiveXObject("Microsoft.XMLHTTP");
 }
 if(!req){
 	alert("Error Initializing XMLHttpRequest!");
 }
}
function select(str){
	if(str == 1){
		position = 11;
	document.getElementById("loginForm").action = "insertStu.do";
	document.getElementById("idnum").style.display = "block";
	document.getElementById("idpassword").style.display = "block";
	document.getElementById("password").style.display = "block";
	document.getElementById("password2").style.display = "none";
	document.getElementById("email").style.display = "none";
	document.getElementById("check1").style.display = "none";
	document.getElementById("error").innerHTML ="";
	}else{
		position = 22;
	document.getElementById("loginForm").action = "insertHr.do";
	document.getElementById("idnum").style.display = "none";	
	document.getElementById("idpassword").style.display = "none";
	document.getElementById("password").style.display = "none";
	document.getElementById("password2").style.display = "block";
	document.getElementById("email").style.display = "block";
	document.getElementById("check1").style.display = "block";
	document.getElementById("error").innerHTML ="";
		}
	}
function stu_code(){
	var stu_code = document.getElementById("idpassword").value;
	createRequest();
	 var t = new Date();
	req.open("POST","testcode.do?time="+t.getTime(),true); 
	req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	req.onreadystatechange = updatePage;
	req.send("stu_code=" + stu_code);
	}	
function updatePage(){
	if(req.readyState==4){
		if(req.status==200){
			var res = req.responseText;
			if(res=="该注册码可用"){
				stu_code1 = true;
			}else{
				stu_code1 = false;
			}
			document.getElementById("error").innerHTML = res;	
		}
	}
}

function stu_register(){
	if(!stu_code1){
		document.getElementById("error").innerHTML = "请输入正确的注册码";
	}else{
	var stu_code = document.getElementById("idpassword").value;
	var stu_no = document.getElementById("idnum").value;
	createRequest();
	var t = new Date();
	req.open("POST","testno.do?time="+t.getTime(),true); 
	req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	req.onreadystatechange = updatePagedd;
	req.send("stu_code=" + stu_code +"&stu_no=" + stu_no);
	}
}
function updatePagedd(){
	if(req.readyState==4){
		if(req.status==200){
			var res = req.responseText;
			 if(res=="可以注册"){
				stu_no1 = true;
			}else{
				stu_no1 = false;
			} 
			document.getElementById("error").innerHTML = res;	
		}
	}
}
function check_pass(){
	 if(!(stu_code1&&stu_no1)){
		document.getElementById("error").innerHTML ="请输入正确的注册码和学号!";
	}else{
		var pass_1 = document.getElementById("password").value.length;
		if(pass_1<6){
			document.getElementById("error").innerHTML ="密码长度应该大于6位数，小于16位数";
			pass1 = false;
		}else if(pass_1>15){
			document.getElementById("error").innerHTML ="密码长度应该大于6位数，小于16位数";
			pass1 = false;
		}else{
			document.getElementById("error").innerHTML ="可以注册!";
			pass1 = true;
		} 
	}
}

function check_email(){
	var email = document.getElementById("email").value;
	var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
	if(reg.test(email)){
		createRequest();
		 var t = new Date();
		req.open("POST","testemail.do?time="+t.getTime(),true); 
		req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		req.onreadystatechange = updatePage2;
		req.send("email=" + email);
	}else{
		document.getElementById("error").innerHTML ="请输入正确的邮箱格式";
	}
	
	}	
function updatePage2(){
	if(req.readyState==4){
		if(req.status==200){
			var res = req.responseText;
			if(res=="邮箱地址可用"){
				email = true;
			}else{
				email = false;
			}
			document.getElementById("error").innerHTML = res;	
		}
	}
}

function check_pass2(){
	if(email){
	var pass_1 = document.getElementById("password2").value.length;
	if(pass_1<6){
		document.getElementById("error").innerHTML ="密码长度应该大于6位数，小于16位数";
		pass2 = false;
	}else if(pass_1>15){
		document.getElementById("error").innerHTML ="密码长度应该大于6位数，小于16位数";
		pass2 = false;
	}else{
		document.getElementById("error").innerHTML ="可以注册!";
		pass2 = true;
	}
	}
}

function cancel1(){
	if(position=="33"){
		document.getElementById("error").innerHTML ="请选择您的身份!";
		return false;
	}else if(position=="11"){
		if(stu_no1&&stu_code1&&pass1){
			return true;
		}else{
			return false;
		}
	}else if(position=="22"){
		if(email&&pass2){
			return true;
		}else{
			return false;
		}
	}

}
</script> 
</head>

<body id="login_bg">
	<div class="login_wrapper">
		<div class="login_header">
		  <div id="cloud_s"><img src="style/images/cloud_s.png" width="81" height="52" alt="cloud" /></div>
            <div id="cloud_m"><img src="style/images/cloud_m.png" width="136" height="95"  alt="cloud" /></div>
        </div>
        
    	<input type="hidden" id="Token" value="select"/>		
		<span class="login_header"><a href="index.jsp"><img src="style/images/logo_white.png" width="285" height="62" alt="招聘" /></a></span>
		<div class="login_box">
        	<form id="loginForm"  action="insertStu.do" method="post" onsubmit="return cancel1()">
        		<ul class="register_radio clearfix">
		            <li id="stu" onClick="select(1)">
		            	学生
		              	<input type="radio" value="0" name="type" /> 
		            </li>
		            <li id="hr" onClick="select(2)">
		           	           HR
		              	<input type="radio" value="1" name="type"  onClick="select(2)"/> 
		            </li>
		        </ul> 
		        <span class="error" id="error">${error}</span>
		        <input type="password" style="display:block" id="idpassword" name="idpassword" tabindex="2" placeholder="请输入注册码(学籍认证)" onkeyup="stu_code()"/>
               <input type="text" style="display:block" id="idnum" name="idnum" tabindex="3" placeholder="请输入您的学号" onkeyup="stu_register()"/>
            	<input type="text" style="display:none" id="email" name="email" tabindex="1" placeholder="请输入常用邮箱地址(将用于找回密码)" onkeyup="check_email()"/>
                <input type="password" id="password" name="password" tabindex="2" placeholder="请输入密码" onkeyup="check_pass()" style="display:block"/>
                <input type="password" id="password2" name="password2" tabindex="2" placeholder="请输入密码" style="display:none" onkeyup="check_pass2()"/>
            	<label class="fl registerJianJu" for="checkbox">
            	<span id="check1" style="display:none"><input type="checkbox" id="checkbox" name="checkbox" checked  class="checkbox valid" />我已阅读并同意<a href="privacy.jsp" target="_blank">《注册用户协议》</a></span>
           		</label>
                <input type="submit" id="submitLogin" value="注 &nbsp; &nbsp; 册" />
            </form>
            <div class="login_right">
            	<div>已有帐号?</div>
            	<a  href="stu_login.jsp"  class="registor_now">学生登录</a>
                <br>
              <a  href="hr_login.jsp"  class="registor_now">HR登录</a>
            </div>
        </div>
        <div class="login_box_btm"></div>
    </div>
    <script type="text/javascript">
    
    $(document).ready(function(e) {
    	$('.register_radio li input').click(function(e){
    		$(this).parent('li').addClass('current').append('<em></em>').siblings().removeClass('current').find('em').remove();
    	});
    });
    </script>
</body>
</html>
