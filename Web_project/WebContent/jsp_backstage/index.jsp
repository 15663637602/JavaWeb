<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="overflow-y:hidden;">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="js/html5.js"></script>
<script type="text/javascript" src="js/respond.min.js"></script>
<script type="text/javascript" src="js/PIE_IE678.js"></script>
<![endif]-->
<link href="css/H-ui.css" rel="stylesheet" type="text/css" />
<link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="font/font-awesome.min.css"/>
<!--[if IE 7]>
<link href="font/font-awesome-ie7.min.css" rel="stylesheet" type="text/css" />
<![endif]-->
<!--[if IE 6]>
<script type="text/javascript" src="js/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>毕业生就业信息管理系统</title>
<meta name="keywords" content="LYQ">
<meta name="description" content="Jake Li"><!-- 测试 -->
<script type="text/javascript">
function forbid(){
	alert("asd");
}
</script>
</head>
<body style="overflow:hidden">
<header class="Hui-header cl"> <a class="Hui-logo l" title="H-ui.admin v2.1" href="/">毕业生就业信息后台管理系统</a> <a class="Hui-logo-m l" href="/" title="H-ui.admin">my12306</a> <span class="Hui-subtitle l">V1.0</span> <span class="Hui-userbox"><span class="c-white">${sessionScope.bstatus}：${sessionScope.busername}</span> <a class="btn btn-danger radius ml-10" href="b_cancel.do" title="退出"><i class="icon-off"></i> 退出</a></span> <a aria-hidden="false" class="Hui-nav-toggle" id="nav-toggle" href="#"></a> </header>
<div class="cl Hui-main">
  <aside class="Hui-aside" style="">
    <input runat="server" id="divScrollValue" type="hidden" value="" />
    <div class="menu_dropdown bk_2">
      <dl id="menu-user">
        <dt><i class="icon-user"></i> 学生信息管理<b></b></dt>
        <dd>
          <ul>
            <li>
		<a _href="showAllCode.do" href="javascript:;">
	学生注册码管理</a></li>
	
	<li> <a _href="showAllEnroll.do" href="javascript:;">
	学生毕业登记信息</a></li>
          </ul>
        </dd>
      </dl>
      <dl id="menu-comments">
        <dt><i class="icon-comments"></i> 企业信息管理<b></b></dt>
        <dd>
          <ul>
          <li>
           <a _href="showUnCompany.do" href="javascript:;">
	企业信息认证</a></li>
	<li>
           <a _href="showAllCompany.do" href="javascript:;">
	所有企业信息</a></li>
          </ul>
        </dd>
      </dl>
      <dl id="menu-article">
        <dt><i class="icon-edit"></i> 就业信息管理<b></b></dt>
        <dd>
          <ul>
          <li> 
          <a _href="manageAd.do" href="javascript:;">
	前排推广信息</a></li>
	<li> 
          <a _href="manageAd2.do" href="javascript:;">
	后排推广信息</a></li>
          <li> 
          <a _href="recommend.do" href="javascript:;">
	添加就业推荐</a></li>
	<li> 
          <a _href="information.do" href="javascript:;">
	添加就业资讯</a></li>
	
          </ul>
        </dd>
      </dl>
      <dl id="menu-article">
        <dt><i class="icon-edit"></i> 管理员帐号管理<b></b></dt>
        <dd>
          <ul>
          <li>  <%String name =session.getAttribute("bstatus").toString() ;
if(name.compareTo("系统管理员")==0){
	%>  <a _href="showAllAdmin.do" href="javascript:;">
	<%}else{%>
		<a _href="forbid.jsp" href="javascript:;">
<%	}%>
	帐号管理</a></li>
          </ul>
        </dd>
      </dl>
      
      
     
    </div>
  </aside>
  <div class="dislpayArrow"><a class="pngfix" href="javascript:void(0);"></a></div>
  <section class="Hui-article">
    <div id="Hui-tabNav" class="Hui-tabNav">
      <div class="Hui-tabNav-wp">
        <ul id="min_title_list" class="acrossTab cl">
          <li class="active"><span title="我的桌面" data-href="welcome.jsp">欢迎访问</span><em></em></li>
        </ul>
      </div>
      <div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default btn-small" href="javascript:;"><i class="icon-step-backward"></i></a><a id="js-tabNav-next" class="btn radius btn-default btn-small" href="javascript:;"><i class="icon-step-forward"></i></a></div>
    </div>
    <div id="iframe_box" class="Hui-articlebox">
      <div class="show_iframe">
        <div style="display:none" class="loading"></div>
        <iframe scrolling="yes" frameborder="0" src="welcome.jsp"></iframe>
      </div>
    </div>
  </section>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/Validform_v5.3.2_min.js"></script> 
<script type="text/javascript" src="layer/layer.min.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>

</body>
</html>