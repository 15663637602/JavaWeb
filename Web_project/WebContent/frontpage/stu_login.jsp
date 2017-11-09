<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate" media="handheld"  />
<!-- end 云适配 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录</title>
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
function displaya(){
	document.getElementById("valiword").style.display = 'inline'
}

function tijiao(){
	displaya();
	if(yz){
		return true;
	}else{
		document.getElementById("error").innerHTML ="请输入正确的验证码!";
		loadimage();
		return false;
	}
	
}
</script>
</head>

<body id="login_bg">
	<div class="login_wrapper">
		<div class="login_header">
        	<a href="index.jsp"><img src="style/images/logo_white.png" width="285" height="62" alt="招聘" /></a>
            <div id="cloud_s"><img src="style/images/cloud_s.png" width="81" height="52" alt="cloud" /></div>
            <div id="cloud_m"><img src="style/images/cloud_m.png" width="136" height="95"  alt="cloud" /></div>
        </div>
        
		 <div class="login_box">
        	<form id="loginForm" action="f_login.do" onsubmit="return tijiao()">
        	<span class="error" id="error">${error}</span>
				<input type="text" id="email" name="email" value="" tabindex="1" placeholder="请输入您的学号" onblur="displaya()"/>
			  	<input type="password" id="password" name="password" tabindex="2" placeholder="请输入密码"  onkeyup="displaya()"/>
			  	<div class="field" style="display: none;" id="valiword">
					<input type="text" id="rand" name="rand"  placeholder="请输入下方的验证码" class="login validateword-field" onkeyup="validate2()"/>
					<img alt="code..." name="randImage" id="randImage" src="image.jsp" width="60" height="20" border="1" align="absmiddle"><a href="javascript:loadimage();"><font>看不清?</font></a>
                    <div id="validateword"></div>
				</div> <!-- /validateword -->
			    <a href="reset.jsp" class="fr" target="_blank">忘记密码？</a>
				<input type="submit" id="submitLogin" value="登 &nbsp; &nbsp; 录" />
			</form>
			<div class="login_right">
            <div>学生入口</div>
            <br>
				<div>还未注册？</div>
                
				<a  href="register.jsp"  class="registor_now">立即注册</a>
			   
			</div>
        </div>
        <div class="login_box_btm"></div>
    </div>

</body>
</html>