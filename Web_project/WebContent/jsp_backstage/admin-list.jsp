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
<title>管理员列表</title>
<script type="text/javascript">
	var req = false;
	var res;
	//1.获取xhr对象
	function createRequest() {
		if (window.XMLHttpRequest) {
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (!req) {
			alert("Error Initializing XMLHttpRequest!");
		}
	}
	//2.利用xhr对象执行ajax请求
	function validate() {
		createRequest();
		var username = document.getElementById("adminname").value;
		var t = new Date(); //强制页面更新
		req.open("POST", "b_registertest.do?time=" + t.getTime(), true);
		req.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		req.onreadystatechange = updatePage;
		req.send("b_username=" + username);
	}
	//3.回调函数运行
	function updatePage() {
		if (req.readyState == 4) {
			if (req.status == 200) {
				res = req.responseText;
				document.getElementById("span_name").innerHTML = res;
			}
		}
	}
	function cancel() {
		if (res == "用户名已存在") {
			return false;
		}
	}
	/*管理员-删除*/
	function admin_dell(obj, id, String) {
		layer.confirm('确认要删除吗？', function(index) {
			var name = String;
			if (window.XMLHttpRequest) {
				req = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			if (req) {
				var t = new Date();
				req.open("POST", "deleteAdmin.do?time=" + t.getTime(), true);
				req.setRequestHeader("Content-Type",
						"application/x-www-form-urlencoded");
				req.onreadystatechange = callback;
				req.send("b_name=" + name);
			}
		});
	}
	function callback() {
		if (req.readyState == 4) {
			if (req.status == 200) {
				parseMessage();
			} else {
				layer.msg('删除失败!', 1);
			}
		}
	}
	function parseMessage() {
		layer.msg('已删除!', 1);
		window.location.href = "showAllAdmin.do";
	}

	function dels() {
		var arr = document.getElementsByName("checkbox");
		layer.confirm('确认删除吗？', function(index) {
			for (i = 0; i < arr.length; i++) {
				if (arr[i].checked) {
					if (window.XMLHttpRequest) {
			            req = new XMLHttpRequest();
			        }else if (window.ActiveXObject) {
			            req = new ActiveXObject("Microsoft.XMLHTTP");
			        }
					 if(req){
				    	   var t = new Date();
					   		req.open("POST","deleteAdmin.do?time="+t.getTime(),true);
						 	req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
					        req.onreadystatechange = callback;
					        req.send("b_name=" + arr[i].value);
				       }
				}
			}
		});

	}
</script>
</head>
<body>
	<nav class="Hui-breadcrumb"> <i class="icon-home"></i> 首页 <span
		class="c-gray en">&gt;</span> 管理员管理 <span class="c-gray en">&gt;</span>
	管理员列表 <a class="btn btn-success radius r mr-20"
		style="line-height: 1.6em; margin-top: 3px"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="icon-refresh"></i></a></nav>
	<div class="pd-20">
		<div class="text-c">
			<form class="Huiform" method="post" action="insertAdmin.do"
				id="loginform" onsubmit="return cancel()">
				<div id="span_name"></div>
				&nbsp; <input type="text" placeholder="帐号(支持英文和数字组合)"
					autocomplete="off" id="adminname" name="adminname"
					class="input-text" onkeyup="validate()"> <input
					name="newpassword" id="newpassword" class="input-text"
					type="password" placeholder="设置密码" tabindex="2" datatype="*6-16"
					nullmsg="请输入您的新密码！" errormsg="4~16个字符，区分大小写！"> <input
					name="newpassword2" id="newpassword2" class="input-text"
					type="password" placeholder="确认新密码" tabindex="3" datatype="*"
					recheck="newpassword" nullmsg="请再输入一次新密码！" errormsg="您两次输入的新密码不一致！">
				<select class="select" id="status_b" name="status_b">
					<option value="就业负责人">就业负责人</option>
					<option value="系统管理员">系统管理员</option>
				</select>
				<button type="submit" class="btn btn-success"
					id="admin-password-save" name="admin-password-save">
					<i class="icon-plus"></i> 添加
				</button>
			</form>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"><button type="button" onclick="dels()"
					class="btn btn-danger radius">
					<i class="icon-trash"></i> 批量删除
				</button></span> <span class="r">共有数据：<strong>${list_size}</strong> 条
			</span>
		</div>
		<table class="table table-border table-bordered table-bg">
			<thead>
				<tr>
					<th scope="col" colspan="7">管理员列表</th>
				</tr>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="40">ID</th>
					<th width="150">登录名</th>
					<th width="250">角色</th>
					<th width="150">密码</th>
					<th width="70">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${adminList}" var="temp">
					<tr class="text-c">
						<td><input type="checkbox" value="${temp.b_name}"
							id="checkbox" name="checkbox"></td>
						<td>${temp.b_id}</td>
						<td>${temp.b_name}</td>
						<td>${temp.b_status}</td>
						<td>${temp.b_pass}</td>
						<td class="f-14 admin-manage"><a title="编辑"
							href="javascript:;"
							onClick="admin_permission_edit('23','751','','修改管理员信息','updateAdmin.do?b_name=${temp.b_name}&b_pass=${temp.b_pass}')"
							class="ml-5" style="text-decoration: none"><i
								class="icon-edit"></i></a> <a title="删除" href="javascript:;"
							onClick="admin_dell(this,'1','${temp.b_name}')" class="ml-5"
							style="text-decoration: none"><i class="icon-trash"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/pagenav.cn.js"></script>
	<script type="text/javascript" src="layer/layer.min.js"></script>
	<script type="text/javascript" src="js/H-ui.js"></script>
	<script type="text/javascript" src="js/H-ui.admin.js"></script>
	<script type="text/javascript" src="js/Validform_v5.3.2_min.js"></script>
	<script type="text/javascript">
		$(".Huiform").Validform();
	</script>

</body>
</html>