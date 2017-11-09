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
<title>学生毕业登记信息</title>
<script type="text/javascript">

function group_show(id,w,h,title,url){
	layer_show(w,h,title,url);
}
var req;
function group_del(obj,id,String){
	layer.confirm('确认要删除吗？(此操作会删除该编组所有信息)',function(index){
		var name = String;
		 if (window.XMLHttpRequest) {
            req = new XMLHttpRequest();
        }else if (window.ActiveXObject) {
            req = new ActiveXObject("Microsoft.XMLHTTP");
        }
       if(req){
    	   var t = new Date();
	   		req.open("POST","deleteGroupByNum.do?time="+t.getTime(),true);
		 	req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	         req.onreadystatechange = callback;
	        req.send("g_num=" + name);
       }
	});
}
function callback() {
	   if (req.readyState == 4) {
	       if (req.status == 200) {
	                parseMessage();
	       }else{
	    	   alert ("该车次正在运作中,不可修改！！");
	           layer.msg('删除失败!',1);
	       }       
	   }
	  }
function parseMessage() {
	layer.msg('已删除!',1);
	window.location.href="showAllGroup.do";  
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
				   		req.open("POST","deleteGroupByNum.do?time="+t.getTime(),true);
					 	req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
				        req.onreadystatechange = callback;
				        req.send("g_num=" + arr[i].value);
			       }
			}
		}
	});

}


</script>
</head>
<body>
<nav class="Hui-breadcrumb"><i class="icon-home"></i> 首页 <span class="c-gray en">&gt;</span> 学生信息管理 <span class="c-gray en">&gt;</span> 学生毕业登记信息  <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="icon-refresh"></i></a></nav>
<div class="pd-20">
  <div class="text-c">
  <form action="selectEnroll.do" method="post">
   请输入学生的学号：  <input type="text" class="input-text" style="width:250px" placeholder="请输入准确的学号" id="stu_id" name="stu_id">&nbsp;&nbsp;&nbsp;
   <button type="submit" class="btn btn-success" ><i class="icon-search"></i> 查询信息</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="showAllEnroll.do"><button type="button" class="btn btn-success"><i class="icon-search"></i> 所有信息</button></a>
</form>
  </div>
  <div class="cl pd-5 bg-1 bk-gray mt-20">
    <span class="l"><a href="javascript:;" onClick="dels()" class="btn btn-danger radius"><i class="icon-trash"></i> 批量删除</a></span>
    <span class="r">共有数据：<strong>0</strong> 条</span>
  </div>
  <table class="table table-border table-bordered table-hover table-bg">
      <thead>
        <tr class="text-c">
           <th width="25"><input type="checkbox" name="" value=""></th>
        <th width="30">姓名</th>
        <th width="60">学号</th>
        <th width="50">就职单位</th>
        <th width="70">职位</th>
        <th width="60">地址</th>
        <th width="50">薪资</th>
        <th width="50">操作</th>
        </tr>
      </thead>
      <tbody>
       <tr class="text-c">
       <td colspan="8">未查到此人信息，请确认您输入的学号</td>
       </tr>
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