<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb">
<head>
</script><script type="text/javascript" async src="style/js/conversion.js"></script><script src="style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script><style type="text/css"></style>
<meta content="no-siteapp" http-equiv="Cache-Control">
<link  media="handheld" rel="alternate">
<!-- end 云适配 -->
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>账户设置</title>
<meta content="23635710066417756375" property="qc:admins">
<meta name="description" content="求职">
<meta name="keywords" content="求职">
<meta content="QIQ6KC1oZ6" name="baidu-site-verification">
<script type="text/javascript">
var ctx = "h";
console.log(1);
</script>
<link href="h/images/favicon.ico" rel="Shortcut Icon">
<link href="style/css/style.css" type="text/css" rel="stylesheet">
<link href="style/css/external.min.css" type="text/css" rel="stylesheet">
<link href="style/css/popup.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
<script src="style/js/jquery.lib.min.js" type="text/javascript"></script>
<script type="text/javascript" src="style/js/ajaxfileupload.js"></script>
<script src="style/js/additional-methods.js" type="text/javascript"></script>
<!--[if lte IE 8]>
    <script type="text/javascript" src="style/js/excanvas.js"></script>
<![endif]-->
<script type="text/javascript">
var youdao_conv_id = 271546; 
</script> 
<script src="style/js/conv.js" type="text/javascript"></script>
<script src="style/js/ajaxCross.json" charset="UTF-8"></script>
<script type="text/javascript">
var req = false;
var res;
var oldpassword = false;
var pass1 = false;
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
function oldpass(){
	var h_email = document.getElementById("h_email").value;
	var pass = document.getElementById("oldpassword").value;
	createRequest();
	var t = new Date();
	req.open("POST","testhr_pass.do?h_email="+h_email+"&time="+t.getTime(),true); 
	req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	req.onreadystatechange = updatePage;
	req.send("pass=" + pass);
}
function updatePage(){
	if(req.readyState==4){
		if(req.status==200){
			res = req.responseText;
			if(res=="请输入新密码"){
				oldpassword = true;
			}else{
				oldpassword = false;
			}
			document.getElementById("error").innerHTML = res;	
		}
	}
}
function newpass1(){
	var pass_1 = document.getElementById("newpassword").value.length;
	if(pass_1<6){
		document.getElementById("error2").innerHTML ="密码长度应该大于6位数，小于16位数";
		pass1 = false;
	}else if(pass_1>15){
		document.getElementById("error2").innerHTML ="密码长度应该大于6位数，小于16位数";
		pass1 = false;
	}else{
		document.getElementById("error2").innerHTML ="正确!";
		pass1 = true;
	} 
}
function newpass2(){
	var pass_1 = document.getElementById("newpassword").value.length;
	var pass_2 = document.getElementById("comfirmpassword").value.length;
	if(pass1){
	if(pass_1==pass_2){
		document.getElementById("error3").innerHTML ="正确!";
		pass2 = true;
	}else{
		document.getElementById("error3").innerHTML ="两次输入的密码不一致";
		pass2 = false;
	}
	}else{
		document.getElementById("error3").innerHTML ="请输入新密码";
	}
}
function cancel(){
	if(oldpassword&&pass1&&pass2){
		return true;
	}else{
		return false;
	}
}
</script>
</head>
<body>
<div id="body">
	<div id="header">
    	<div class="wrapper">
    		<a class="logo">
    			<img width="229" height="43" alt="求职" src="style/images/logo.png">
    		</a>
    		<ul id="navheader" class="reset">
    			<li><a href="myhome.do?name=${sessionScope.username}">公司</a></li>
    			<li><a rel="nofollow" href="create.do?name=${sessionScope.username}">发布职位</a></li>
                <li><a href="positions.do?name=${sessionScope.username}">职位管理</a></li>
	    	</ul>
        	<dl class="collapsible_menu">
            	<dt>
           			<span>${sessionScope.username}&nbsp;</span> <input type="hidden" value="${sessionScope.username}" id="h_email">
            		<span class="red dn" id="noticeDot-1"></span>
            		<i></i>
            	</dt>
                                	<dd><a href="positions.do?name=${sessionScope.username}">职位管理</a></dd>
                	<dd><a href="showRecRes.do?name=${sessionScope.username}">我收到的简历</a></dd>
                	<dd class="btm"><a href="myhome.do?name=${sessionScope.username}">我的公司主页</a></dd>
                                                <dd><a href="hr_updatePwd.jsp">帐号设置</a></dd>
                                <dd class="logout"><a rel="nofollow" href="cancel.do">退出</a></dd>
            </dl>
                                </div>
    </div><!-- end #header -->
    <div id="container">
        	<div class="user_bindSidebar">
    <dl id="user_sideBarmenu" class="user_sideBarmenu">
     	        <dt><h3>帐号设置</h3></dt>
        <dd><a class="hover" href="hr_updatePwd.jsp">修改密码</a></dd>
            </dl>
</div>
<input type="hidden" id="hasSidebar" value="1">	<div class="content user_modifyContent">
        <dl class="c_section">
            <dt>
            	<h2><em></em>修改密码</h2>
            </dt>
            <dd>
            	            	<form id="updatePswForms" action="hr_updatepass.do" onsubmit="return cancel()">
            	            	<input type="hidden" id="name" name="name" value="${sessionScope.username}">
            		<table class="savePassword">
            			<tbody>
            			<tr>
            				<td>帐号</td>
            				<td class="c7">${sessionScope.username}</td>
            			</tr>
            			<tr>
            				<td class="label">当前密码</td>
            				<td>
            					<input type="password" maxlength="16" onkeyup="oldpass()" name="oldpassword" id="oldpassword" style="background-image: url(style/images/img/0CQnd2Jos49xUAAAAASUVORK5CYII=quot); background-repeat: no-repeat; background-attachment: scroll; background-position: right center;">
            					<span id="error" class="error"></span>
            					</td>            				
            			</tr>
            			<tr>
            				<td class="label">新密码</td>
            				<td><input type="password" maxlength="16" onkeyup="newpass1()" id="newpassword" onkeyup="newpass1()" name="newpassword" style="background-image: url(style/images/img/a6y3y0Wx5kbFHvGuXzkgf0xhKnPzA4UTyaTB8Ph8AvcHi3fnsrZ7Wore02YViqVOrRXXPhfqP8j6MYlawoAAAAASUVORK5CYII=quot); background-repeat: no-repeat; background-attachment: scroll; background-position: right center;">
            				<span id="error2" class="error"></span>
            				</td>
            			</tr>
            			<tr>
            				<td class="label">确认密码</td>
            				<td><input type="password" maxlength="16" onkeyup="newpass2()" id="comfirmpassword" onkeyup="newpass2()" name="comfirmpassword" style="background-image: url(style/images/img/a6y3y0Wx5kbFHvGuXzkgf0xhKnPzA4UTyaTB8Ph8AvcHi3fnsrZ7Wore02YViqVOrRXXPhfqP8j6MYlawoAAAAASUVORK5CYII=quot); background-repeat: no-repeat; background-attachment: scroll; background-position: right center;">
            				<span id="error3" class="error"></span>
            				</td>
            			</tr>
            			<tr>
            				<td>&nbsp;</td>
            				<td><input type="submit" value="保 存" ></td>
            			</tr>
            		</tbody></table>
				</form>
				            </dd>
        </dl>
    </div>
	
</div>
<!------------------------------------- end -----------------------------------------> <script src="style/js/setting.js"></script>
			<div class="clear"></div>
			<input type="hidden" value="" id="resubmitToken">
	    	<a rel="nofollow" title="回到顶部" id="backtop"></a>
	    </div><!-- end #container -->
	</div><!-- end #body -->
	<div id="footer">
		<div class="wrapper">
			联系我们:nic@hrbeu.edu.cn
		    <a class="footer_qr" href="javascript:void(0)" rel="nofollow">微信公众号<i></i></a>
			<div class="copyright">&copy;2016-2017 HEU 黑ICP备0500000</div>
		</div>
	</div>

<script src="style/js/core.min.js" type="text/javascript"></script>
<script src="style/js/popup.min.js" type="text/javascript"></script>

<!--  -->


<div id="cboxOverlay" style="display: none;"></div><div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;"><div id="cboxWrapper"><div><div id="cboxTopLeft" style="float: left;"></div><div id="cboxTopCenter" style="float: left;"></div><div id="cboxTopRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxMiddleLeft" style="float: left;"></div><div id="cboxContent" style="float: left;"><div id="cboxTitle" style="float: left;"></div><div id="cboxCurrent" style="float: left;"></div><button type="button" id="cboxPrevious"></button><button type="button" id="cboxNext"></button><button id="cboxSlideshow"></button><div id="cboxLoadingOverlay" style="float: left;"></div><div id="cboxLoadingGraphic" style="float: left;"></div></div><div id="cboxMiddleRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxBottomLeft" style="float: left;"></div><div id="cboxBottomCenter" style="float: left;"></div><div id="cboxBottomRight" style="float: left;"></div></div></div><div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div></div></body></html>