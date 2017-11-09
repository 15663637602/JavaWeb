<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="js/html5.js"></script>
<script type="text/javascript" src="js/respond.min.js"></script>
<script type="text/javascript" src="js/PIE_IE678.js"></script>
<![endif]-->
<link type="text/css" rel="stylesheet" href="css/H-ui.css"/>
<link type="text/css" rel="stylesheet" href="css/H-ui.admin.css"/>
<link type="text/css" rel="stylesheet" href="font/font-awesome.min.css"/>
<!--[if IE 7]>
<link href="font/font-awesome-ie7.min.css" rel="stylesheet" type="text/css" />
<![endif]-->
<title>添加编组</title>
<script type="text/javascript">
var req = false;
var res;
var testid = false;
 function testno(){
	 if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (!req) {
			alert("Error Initializing XMLHttpRequest!");
		}
		var rc_no = document.getElementById("rc_no").value;
		var t = new Date(); //强制页面更新
		req.open("POST", "rc_notest.do?time=" + t.getTime(), true);
		req.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		req.onreadystatechange = updatePage;
		req.send("rc_no=" + rc_no);
 }
 function updatePage() {
		if (req.readyState == 4) {
			if (req.status == 200) {
				res = req.responseText;
				document.getElementById("span1").innerHTML = res;
			}
		}
	}
 function testcode(){
	 if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (!req) {
			alert("Error Initializing XMLHttpRequest!");
		}
		var rc_code = document.getElementById("rc_code").value;
		var t = new Date(); //强制页面更新
		req.open("POST", "rc_codetest.do?time=" + t.getTime(), true);
		req.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		req.onreadystatechange = updatePage2;
		req.send("rc_code=" + rc_code);
 }
 function updatePage2() {
		if (req.readyState == 4) {
			if (req.status == 200) {
				res = req.responseText;
				document.getElementById("span2").innerHTML = res;
			}
		}
	}
 function forbid(){
	 var span1 = document.getElementById("span1").innerHTML
	 var span2 = document.getElementById("span2").innerHTML
	 if(span1=="该学号已被登记"){
		 return false;
	 }else if(span2 == "注册码重复"){
		 return false;
	 }
	 return true;
 }
</script>
</head>
<body>
<div class="pd-20">
  <div class="Huiform">
    <form action="insertCode.do" method="post" id="groupform" target="_parent" onsubmit="return forbid()">
      <table class="table table-bg">
        <tbody>
          <tr>
            <th class="text-r">学生姓名：</th> 
            <td><input type="text" style="width:200px" class="input-text" placeholder="请输入学生姓名" id="rc_name" name="rc_name" datatype="*2-16" nullmsg="学生姓名不能为空"></td>
          </tr>
          <tr>
            <th class="text-r">学号：</th> 
            <td><input type="text" style="width:200px" class="input-text" placeholder="请输入学生学号" id="rc_no" name="rc_no" datatype="*2-16" nullmsg="学号不能为空" onblur="testno()"><span id="span1"></span></td>
          </tr>
          <tr>
            <th class="text-r">注册码：</th> 
            <td><input type="text" style="width:200px" class="input-text" placeholder="请输入注册码" id="rc_code" name="rc_code" datatype="*2-16" nullmsg="注册码不能为空" onblur="testcode()"><span id="span2"></span></td>
          </tr>
          <tr>
            <th class="text-r">学院名称：</th> 
            <td><input type="text" style="width:200px" class="input-text" placeholder="请输入学院名称" id="rc_college" name="rc_college" datatype="*2-16" nullmsg="名称不能为空"></td>
          </tr>
          <tr>
          <th class="text-r"></th> 
          <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-success radius" type="submit"><i class="icon-ok"></i> 添加</button></td>
          </tr>
         </tbody>
         </table>
    </form>
      </div>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/Validform_v5.3.2_min.js"></script> 
<script type="text/javascript" src="layer/layer.min.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script> 
<script type="text/javascript" src="js/H-ui.admin.js"></script> 
<script type="text/javascript">
$(".Huiform").Validform(); 
</script>

</body>
</html>