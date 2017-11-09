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
<title>编组管理</title>
<script type="text/javascript">

function group_show(id,w,h,title,url){
	layer_show(w,h,title,url);
}
var req;
function permit(obj,id,String){
	layer.confirm('审核通过？',function(index){
		var name = String;
		 if (window.XMLHttpRequest) {
            req = new XMLHttpRequest();
        }else if (window.ActiveXObject) {
            req = new ActiveXObject("Microsoft.XMLHTTP");
        }
       if(req){
    	   var t = new Date();
	   		req.open("POST","permitById.do?time="+t.getTime(),true);
		 	req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	         req.onreadystatechange = callback;
	        req.send("h_email=" + name);
       }
	});
}
function callback() {
	   if (req.readyState == 4) {
	       if (req.status == 200) {
	                parseMessage();
	       }else{
	           layer.msg('认证失败!',1);
	       }       
	   }
	  }
function parseMessage() {
	layer.msg('认证通过!',1);
	window.location.href="showAllCompany.do";  
}
function permits() {
	var arr = document.getElementsByName("checkbox");
	var name = "";
	layer.confirm('审核通过？', function(index) {
		for (i = 0; i < arr.length; i++) {
			if (arr[i].checked) {
				if (window.XMLHttpRequest) {
		            req = new XMLHttpRequest();
		        }else if (window.ActiveXObject) {
		            req = new ActiveXObject("Microsoft.XMLHTTP");
		        }
				 if(req){
			    	   var t = new Date();
				   		req.open("POST","permitById.do?time="+t.getTime(),true);
					 	req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
				        req.onreadystatechange = callback;
				        req.send("h_email=" + arr[i].value);
			       }
			}
		}
	});

}
function deny(obj,id,String){
	layer.confirm('审核不通过？',function(index){
		var name = String;
		 if (window.XMLHttpRequest) {
            req = new XMLHttpRequest();
        }else if (window.ActiveXObject) {
            req = new ActiveXObject("Microsoft.XMLHTTP");
        }
       if(req){
    	   var t = new Date();
	   		req.open("POST","denyById.do?time="+t.getTime(),true);
		 	req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	         req.onreadystatechange = callbacks;
	        req.send("h_email=" + name);
       }
	});
}
function callbacks() {
	   if (req.readyState == 4) {
	       if (req.status == 200) {
	                parseMessages();
	       }else{
	           layer.msg('处理失败!',1);
	       }       
	   }
	  }
function parseMessages() {
	layer.msg('处理成功!',1);
	window.location.href="showAllCompany.do";  
}


</script>
</head>
<body>
<nav class="Hui-breadcrumb"><i class="icon-home"></i> 首页 <span class="c-gray en">&gt;</span> 企业信息管理 <span class="c-gray en">&gt;</span> 企业信息认证 </nav>
<div class="pd-20">
  <div class="text-c">
  <form action="bselectUnCom.do" method="post">
   请输入准确的公司名称：  <input type="text" class="input-text" style="width:250px" placeholder="请输入准确的公司名称" id="c_name" name="c_name">&nbsp;&nbsp;&nbsp;
   <button type="submit" class="btn btn-success" ><i class="icon-search"></i> 查询信息</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="showUnCompany.do"><button type="button" class="btn btn-success" onclick="showUnCompany.do"><i class="icon-search"></i> 所有未认证公司</button></a>
</form>
  </div>
  <div class="cl pd-5 bg-1 bk-gray mt-20">
    <span class="l"><a href="javascript:;" onClick="permits()" class="btn btn-danger radius"><i class="icon-plus"></i> 批量认证</a>
    </span>
    <span class="r">共有数据：<strong>${list_size}</strong> 条</span>
  </div>
  <table class="table table-border table-bordered table-hover table-bg">
      <thead>
        <tr class="text-c">
           <th width="25"><input type="checkbox" name="" value=""></th>
        <th width="70">公司名称</th>
        <th width="50">公司领域</th>
        <th width="40">总部地址</th>
        <th width="80">网站</th>
        <th width="50">认证状态</th>
        <th width="30">操作</th>
        </tr>
      </thead>
      <tbody>
       <tr class="text-c">
       <td colspan="7">未查到此公司信息，请确认您输入的公司名称</td>
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
<!-- <script type="text/javascript">
window.onload = (function(){
    // optional set
    pageNav.pre="&lt;上一页";
    pageNav.next="下一页&gt;";
    // p,当前页码,pn,总页面
    pageNav.fn = function(p,pn){$("#pageinfo").text("当前页:"+p+" 总页: "+pn);};
    //重写分页状态,跳到第三页,总页33页
    pageNav.go(1,13);
});
$('.table-sort').dataTable({
	"lengthMenu":false,//显示数量选择 
	"bFilter": false,//过滤功能
	"bPaginate": false,//翻页信息
	"bInfo": false,//数量信息
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	  {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
	]
});
</script> -->

</body>
</html>