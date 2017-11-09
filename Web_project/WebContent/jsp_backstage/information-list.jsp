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
<title>学生注册码信息管理</title>
<script type="text/javascript">

function group_show(id,w,h,title,url){
	layer_show(w,h,title,url);
}
var req;
function inf_del(obj,id,String){
	layer.confirm('确认要删除吗？',function(index){
		var name = String;
		 if (window.XMLHttpRequest) {
            req = new XMLHttpRequest();
        }else if (window.ActiveXObject) {
            req = new ActiveXObject("Microsoft.XMLHTTP");
        }
       if(req){
    	   var t = new Date();
	   		req.open("POST","deleteInfById.do?time="+t.getTime(),true);
		 	req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	        req.onreadystatechange = callback;
	        req.send("in_id=" + name);
       }
	});
}
function callback() {
	   if (req.readyState == 4) {
	       if (req.status == 200) {
	                parseMessage();
	       }else{
	           layer.msg('删除失败!',1);
	       }       
	   }
	  }
function parseMessage() {
	layer.msg('已删除!',1);
	window.location.href="information.do";  
}
function dels() {
	var arr = document.getElementsByName("checkbox");
	var name = "";
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
				   		req.open("POST","deleteInfById.do?time="+t.getTime(),true);
					 	req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
				        req.onreadystatechange = callback;
				        req.send("in_id=" + arr[i].value);
			       }
			}
		}
	});

}


</script>
</head>
<body>
<nav class="Hui-breadcrumb"><i class="icon-home"></i> 首页 <span class="c-gray en">&gt;</span> 职位信息管理 <span class="c-gray en">&gt;</span> 添加就业资讯</nav>
<div class="pd-20">
  <div class="text-c">
  <form action="selectInf.do" method="post">
   请输入标题：  <input type="text" class="input-text" style="width:250px" placeholder="请输入标题" id="in_title" name="in_title">&nbsp;&nbsp;&nbsp;
   <button type="submit" class="btn btn-success" ><i class="icon-search"></i> 查询信息</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="information.do"><button type="button" class="btn btn-success"><i class="icon-search"></i> 所有信息</button></a>
</form>
  </div>
  <div class="cl pd-5 bg-1 bk-gray mt-20">
    <span class="l"><a href="javascript:;" onClick="dels()" class="btn btn-danger radius"><i class="icon-trash"></i> 批量删除</a>
    <a href="javascript:;" onClick="user_add('550','','添加信息','addINF.do')" class="btn btn-primary radius"><i class="icon-plus"></i> 添加信息</a></span>
    <span class="r">共有数据：<strong>${list_size}</strong> 条</span>
  </div>
  <table class="table table-border table-bordered table-hover table-bg">
      <thead>
        <tr class="text-c">
           <th width="25"><input type="checkbox" name="" value=""></th>
        <th width="110">标题</th>
        <th width="150">链接地址</th>
        <th width="60">操作</th>
        </tr>
      </thead>
      <tbody>
      <c:forEach items="${InformationList}" var="temp">
       <tr class="text-c">
       <td><input type="checkbox" value="${temp.in_id}"id="checkbox" name="checkbox"></td>
       <td>${temp.in_title}</td>
       <td>${temp.in_link}</td>
       <td class="f-14 user-manage"> <a title="删除" href="javascript:;" onClick="inf_del(this,'1','${temp.in_id}')" class="ml-5" style="text-decoration:none"><i class="icon-trash"></i></a></td>
      </tr>
      </c:forEach>
      </tbody>
    </table>
<!--   <div id="pageNav" class="pageNav"></div> -->
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="layer/layer.min.js"></script>
<script type="text/javascript" src="js/pagenav.cn.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>

</body>
</html>