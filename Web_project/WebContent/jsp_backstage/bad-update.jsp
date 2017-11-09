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
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="js/html5.js"></script>
<script type="text/javascript" src="js/respond.min.js"></script>
<script type="text/javascript" src="js/PIE_IE678.js"></script>
<![endif]-->
<link type="text/css" rel="stylesheet" href="css/H-ui.css" />
<link type="text/css" rel="stylesheet" href="css/H-ui.admin.css" />
<link type="text/css" rel="stylesheet" href="font/font-awesome.min.css" />
<!--[if IE 7]>
<link href="font/font-awesome-ie7.min.css" rel="stylesheet" type="text/css" />
<![endif]-->
<title>后排推广信息</title>
<script type="text/javascript">
var req = false;
var res;
var testid = false;
 function testno(){
	 var rc_no = document.getElementById("rc_no").value;
	 var rc_multiple = document.getElementById("rc_multiple").value;
	 if(rc_no == rc_multiple){

	 }else{ 
		 if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (!req) {
			alert("Error Initializing XMLHttpRequest!");
		}
		var t = new Date(); //强制页面更新
		req.open("POST", "rc_notest.do?time=" + t.getTime(), true);
		req.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		req.onreadystatechange = updatePage;
		req.send("rc_no=" + rc_no);
 }
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
	 var span1 = document.getElementById("ba_image").value
	 if(span1==""){
		 return false;
	 }else {
	 return true;
	 }
 }
</script>
</head>
<body>
	<div class="pd-20">
		<div class="Huiform">
			<form action="updateAds2.do" method="post" id="groupform"
				target="_parent" enctype="multipart/form-data" onsubmit="return forbid()">
				<table class="table table-bg">
					<tbody>
						<tr>
							<th class="text-r">ID：</th>
							<td>${bif.ba_id}<input type="hidden" id="baid" name="baid" value="${bif.ba_id}"><span id="error"></span></td>
						</tr>
						<tr>
							<th class="text-r">公司名称：</th>
							<td><input type="text" style="width: 200px"
								class="input-text" placeholder="请输入公司名称" id="ba_name"
								name="ba_name" value="${bif.ba_name}"></td>
						</tr>
						<tr>
							<th class="text-r">推广图片：</th>
							<td><input type="file" name="ba_image" id="ba_image" value="点击上传"></td>
						</tr>
						<tr>
							<th class="text-r">HR帐号：</th>
							<td><input type="text" style="width: 200px"
								class="input-text" placeholder="请输入HR帐号" id="ba_h_email"
								name="ba_h_email" value="${bif.ba_h_email}">(务必确保填写正确)</td>
						</tr>
						<tr>
							<th class="text-r">宣传词：</th>
							<td><textarea  placeholder="填写更加吸引人的广告词" name="descr" id="descr">${bif.ba_descr}</textarea></td>
						</tr>
						<tr>
							<th class="text-r"></th>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button class="btn btn-success radius" type="submit">
									<i class="icon-ok"></i> 确定
								</button>
							</td>
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