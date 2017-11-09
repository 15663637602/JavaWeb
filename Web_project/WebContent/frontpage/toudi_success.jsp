<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb"><head>
</script><script type="text/javascript" async="" src="style/js/conversion.js"></script><script src="style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script><style type="text/css"></style>
<meta content="no-siteapp" http-equiv="Cache-Control">
<link  media="handheld" rel="alternate">
<!-- end 云适配 -->
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>公司信息完善成功-招聘服务-拉勾网-最专业的互联网招聘平台</title>
<meta content="23635710066417756375" property="qc:admins">
<meta name="description" content="拉勾网是3W旗下的互联网领域垂直招聘网站,互联网职业机会尽在拉勾网">
<meta name="keywords" content="拉勾,拉勾网,拉勾招聘,拉钩, 拉钩网 ,互联网招聘,拉勾互联网招聘, 移动互联网招聘, 垂直互联网招聘, 微信招聘, 微博招聘, 拉勾官网, 拉勾百科,跳槽, 高薪职位, 互联网圈子, IT招聘, 职场招聘, 猎头招聘,O2O招聘, LBS招聘, 社交招聘, 校园招聘, 校招,社会招聘,社招">
<meta content="QIQ6KC1oZ6" name="baidu-site-verification">

<!-- <div class="web_root"  style="display:none">http://www.lagou.com</div> -->
<script type="text/javascript">
var ctx = "http://www.lagou.com";
console.log(1);
</script>
<link href="http://www.lagou.com/images/favicon.ico" rel="Shortcut Icon">
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
<script src="style/js/ajaxCross.json" charset="UTF-8"></script></head>
<body>
<div id="body">
	<div id="header">
    	<div class="wrapper">
    		<a class="logo">
    			<img width="229" height="43" alt="拉勾招聘-专注互联网招聘" src="style/images/logo.png">
    		</a>
    		<%String status =(String)session.getAttribute("status");
if(status==null){%>
    		<ul class="reset" id="navheader">
    			<li><a href="index.jsp">首页</a></li>
    			<li class="current"><a href="positionshow.do">职位</a></li>
	    	</ul><%}else if(status.compareTo("student")==0){%>
	    	<ul id="navheader" class="reset">
    			<li><a href="indexshow.do">首页</a></li>
    			<li><a href="positionshow.do">职位</a></li>
                <li><a rel="nofollow" href="jianli.do?name=${sessionScope.username}">简历管理</a></li>
	    						    		</ul>
        	<%}else if(status.compareTo("hr")==0){ %>
        	<ul id="navheader" class="reset">
    			<li><a href="myhome.do?name=${sessionScope.username}">公司</a></li>
    			<li><a rel="nofollow" href="create.do?name=${sessionScope.username}">发布职位</a></li>
                <li><a href="positions.do?name=${sessionScope.username}">职位管理</a></li>
	    	</ul>><%} %>
        	            <%String name =(String)session.getAttribute("username") ;
if(name==null){%>
<ul class="loginTop">
	<li><a href="stu_login.jsp" rel="nofollow">我是学生</a></li> 
            	<li>|</li>
            	<li><a href="hr_login.jsp" rel="nofollow">我是企业HR</a></li>
            	</ul>
	<%}else if(status.compareTo("student")==0){%>
	<dl class="collapsible_menu">
            	<dt>
           			<span>${sessionScope.username}&nbsp;</span> 
            		<span class="red dn" id="noticeDot-0"></span>
            		<i></i>
            	</dt>
                                	<dd><a rel="nofollow" href="jianli.do?name=${sessionScope.username}">我的简历</a></dd>
                                    <dd><a rel="nofollow" href="showdelivery.do?name=${sessionScope.username}">我的投递记录</a></dd>
                                         <dd><a href="enroll.do?name=${sessionScope.username}">毕业去向登记</a></dd>
                                            <dd><a href="stu_updatePwd.jsp">帐号设置</a></dd>
                                <dd class="logout"><a rel="nofollow" href="cancel.do">退出</a></dd>
            </dl>
	
	
	<%}else if(status.compareTo("hr")==0){%>
	<dl class="collapsible_menu">
            	<dt>
           			<span>${sessionScope.username}&nbsp;</span> 
            		<span class="red dn" id="noticeDot-1"></span>
            		<i></i>
            	</dt>
                                	<dd><a href="positions.do?name=${sessionScope.username}">职位管理</a></dd>
                	<dd><a href="showRecRes.do?name=${sessionScope.username}">我收到的简历</a></dd>
                	<dd class="btm"><a href="myhome.do?name=${sessionScope.username}">我的公司主页</a></dd>
                                                <dd><a href="hr_updatePwd.jsp">帐号设置</a></dd>
                                <dd class="logout"><a rel="nofollow" href="cancel.do">退出</a></dd>
            </dl>
            <%} %>
                                </div>
    </div><!-- end #header -->
    <div id="container">
            
        <div class="content_mid">
        
       	<!--发布职位成功 -->
            <dl class="c_section c_section_mid">
        		<dt>
                    <h2><em></em>投递简历成功</h2>
                </dt>
                <dd class="c_notice"> 
                	<h4>恭喜你，简历投递成功，请等待消息！</h4>
                    <a class="greylink" href="positionshow.do">继续寻找职位</a>
                    <a class="greylink" href="jianli.do?name=${sessionScope.username}">管理我的简历</a>
                </dd>
            </dl>
       	</div>

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