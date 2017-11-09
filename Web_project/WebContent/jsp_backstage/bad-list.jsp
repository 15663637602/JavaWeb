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
function code_del(obj,id,String){
	layer.confirm('确认要删除吗？(此操作会删除该学生的所有信息)',function(index){
		var name = String;
		 if (window.XMLHttpRequest) {
            req = new XMLHttpRequest();
        }else if (window.ActiveXObject) {
            req = new ActiveXObject("Microsoft.XMLHTTP");
        }
       if(req){
    	   var t = new Date();
	   		req.open("POST","deleteCodeById.do?time="+t.getTime(),true);
		 	req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	        req.onreadystatechange = callback;
	        req.send("rc_no=" + name);
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
	window.location.href="showAllCode.do";  
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
				   		req.open("POST","deleteCodeByID.do?time="+t.getTime(),true);
					 	req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
				        req.onreadystatechange = callback;
				        req.send("rc_id=" + arr[i].value);
			       }
			}
		}
	});

}


</script>
</head>
<body>
<nav class="Hui-breadcrumb"><i class="icon-home"></i> 首页 <span class="c-gray en">&gt;</span> 职位信息管理 <span class="c-gray en">&gt;</span> 后排推广信息 </nav>
<div class="pd-20">
  <div class="cl pd-5 bg-1 bk-gray mt-20">
    <span class="r">共有数据：<strong>${list_size}</strong> 条</span>
  </div>
  <table class="table table-border table-bordered table-hover table-bg">
      <thead>
        <tr class="text-c">
           <th width="25">ID</th>
        <th width="50">公司名称</th>
        <th width="50">推广图片</th>
        <th width="70">HR帐号</th>
        <th width="100">广告词</th>
        <th width="50">操作</th>
        </tr>
      </thead>
      <tbody>
      <c:forEach items="${BadList}" var="temp">
       <tr class="text-c">
       <td>${temp.ba_id}</td>
       <td>${temp.ba_name}</td>
       <td><a href="${temp.ba_image}" target="_blank">查看图片</a></td>
       <td>${temp.ba_h_email}</td>
       <td>${temp.ba_descr}</td>
       <td class="f-14 user-manage"><a title="编辑" href="javascript:;" onClick="user_edit('4','550','','编辑','updateAds.do?ba_id=${temp.ba_id}')" class="ml-5" style="text-decoration:none"><i class="icon-edit"></i></a> </td>
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