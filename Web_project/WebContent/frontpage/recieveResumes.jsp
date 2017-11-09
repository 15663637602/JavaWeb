<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb"><head>
</script><script type="text/javascript" async src="style/js/conversion.js"></script><script src="style/js/allmobilize.min.js" charset="utf-8" id="allmobilize"></script><style type="text/css"></style>
<meta content="no-siteapp" http-equiv="Cache-Control">
<link  media="handheld" rel="alternate">
<!-- end 云适配 -->
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>待处理简历</title>
<meta content="23635710066417756375" property="qc:admins">
<meta name="description" content="简历">
<meta name="keywords" content="求职">
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
function test(){
	document.getElementById("refuseasd").submit();
}
function test2(){
	document.getElementById("refuseMailFos").submit();
}
</script> 
<script src="style/js/conv.js" type="text/javascript"></script>
<script src="style/js/ajaxCross.json" charset="UTF-8"></script></head>
<body>
<div id="body">
	<div id="header">
    	<div class="wrapper">
    		<a class="logo" href="index.jsp">
    			<img width="229" height="43" alt="求职" src="style/images/logo.png">
    		</a>
    		<ul id="navheader" class="reset">
    			<li><a href="myhome.do?name=${sessionScope.username}">公司</a></li>
    			<li><a rel="nofollow" href="create.do?name=${sessionScope.username}">发布职位</a></li>
                <li><a href="positions.do?name=${sessionScope.username}">职位管理</a></li>
	    	</ul>
        	<dl class="collapsible_menu">
            	<dt>
           			<span>${sessionScope.username}&nbsp;</span> <input type="hidden" value="${sessionScope.username}" name="h_email" id="h_email" class="type"> 
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
                	<div class="sidebar">
        		            	<a class="btn_create" href="create.do?name=${sessionScope.username}">发布新职位</a>
            	                <dl class="company_center_aside">
		<dt>我收到的简历</dt>
	<dd class="current">
		<a href="showRecRes.do?name=${sessionScope.username}">待处理简历</a>
	</dd>
	<dd>
		<a href="showOnRes.do?name=${sessionScope.username}">已通知面试简历</a>
	</dd>
	<dd>
		<a href="showUnRes.do?name=${sessionScope.username}">不合适简历</a>
	</dd>
	
</dl>
<dl class="company_center_aside">
		<dt>我发布的职位</dt>
			<dd>
		<a href="positions.do?name=${sessionScope.username}">有效职位</a>
	</dd>
	</dl>
            </div><!-- end .sidebar -->
            <div class="content">
            	<dl class="company_center_content">
                    <dt>
                        <h1>
                            <em></em>
                            	待处理简历  <span>（共${listsize}份）</span>                        </h1>
                    </dt>
                    <dd>
                    	<form action="canInterviewResumes.jsp" method="post" id="filterForm">
	                    			                    	<div class="filter_actions">
		                        	<!-- <a id="resumeRefuseAll" href="javascript:;"></a>
		                            <div id="filter_btn" class="">筛选简历 <em class=""></em></div> -->
		                        </div><!-- end .filter_actions -->
		                        <!-- <div class="filter_options  dn " style="display: none;">
 	<dl>
     	<dt>简历状态：</dt>
         <dd>
         	         	<a rel="-1" class="current" href="javascript:;">不限</a>
         	         	<a rel="1" href="javascript:;">未阅读</a>
         	         	<a rel="2" href="javascript:;">已阅读</a>
         	         	<a rel="3" href="javascript:;">已转发</a>
         	         	<input type="hidden" value="-1" name="resumeStatus">
         </dd>
     </dl>
 	<dl>
     	<dt>简历形式：</dt>
         <dd>
         	         	<a rel="-1" class="current" href="javascript:;">不限</a>
         	         	<a rel="0" href="javascript:;">附件简历</a>
         	         	<a rel="1" href="javascript:;">在线简历</a>
         	         	<input type="hidden" value="-1" name="resumeType">
         </dd>
     </dl>
     <dl>
     	<dt>工作经验：</dt>
         <dd>
         	         	<a rel="-1" class="current" href="javascript:;">不限</a>
         	         	<a rel="1" href="javascript:;">应届毕业生</a>
         	         	<a rel="2" href="javascript:;">一年以下</a>
         	         	<a rel="3" href="javascript:;">1-3年</a>
         	         	<a rel="4" href="javascript:;">3-5年</a>
         	         	<a rel="5" href="javascript:;">5-10年</a>
         	         	<a rel="6" href="javascript:;">10年以上</a>
         	         	<input type="hidden" value="-1" name="workExp">
         </dd>
     </dl>
     <dl>
     	<dt>最低学历：</dt>
         <dd>
         	         	<a rel="-1" class="current" href="javascript:;">不限</a>
         	         	<a rel="1" href="javascript:;">大专及以上</a>
         	         	<a rel="2" href="javascript:;">本科及以上</a>
         	         	<a rel="3" href="javascript:;">硕士及以上</a>
         	         	<a rel="4" href="javascript:;">博士及以上</a>
         	         	<input type="hidden" value="-1" name="eduExp">
         </dd>
     </dl>
          <input type="hidden" value="0" name="filterStatus" id="filterStatus">
     <input type="hidden" value="" name="positionId" id="positionId">
 </div>end .filter_options	  -->        
  <c:forEach items="${DeliveryList}" var="temp">
 <ul class="reset resumeLists">
		                        				                            <li data-id="1686182" class="onlineResume">
			                                <div class="resumeShow">
			                                				                                    <a title="预览在线简历" target="_blank" class="resumeImg" href="showresumeView.do?stu_id=${temp.stu_id}">
			                                    	<img src="${temp.stu_profile}">
			                                    </a>
			                                    			                                    <div class="resumeIntro">
			                                        <h3 class="unread">
																	                                        	<a target="_blank" title="预览jason的简历" href="showresumeView.do?stu_id=${temp.stu_id}">
			                                        				                                            ${temp.stu_jianli_title}
			                                        	</a>
			                                        					                           	 			<em></em>
			                                        </h3> 
			                                        <span class="fr">投递时间：${temp.date}</span>
			                                        <div> 
			                                        	${temp.stu_name} 			                                        	 / ${temp.stu_sex}			              	/ ${temp.stu_exp_city}			                                            			                                        		<br>
			                                            	${temp.stu_exp_pos} | ${temp.stu_college}
			                                            			                                        </div>
			                                        <div class="jdpublisher">
				                                        <span>
				                                        	应聘职位：${temp.p_name}
				                                       						                                        </span>
			                                        </div>
			                                    </div>
			                                    <div class="links">
			                                       <a href="#loginPop2" class="bar_login inline" title="通知面试">通知面试</a>
			                                        <a  class="bar_login inline" title="不合适" href="#loginPop">不合适</a>

    
    <div style="display:none;">
	<!-- 登录框 -->
	<div id="loginPop" style="height:400px;"   class="popup">
       	<form name="refuseasd" id="refuseasd" action="passdelivery.do?d_id=${temp.d_id}&name=${temp.h_email}" method="post">
	     	<table width="100%">
	         	<tbody><tr>
	         		<td>
	         			<div class="refuse_icon">
	         				<h3>确认这份简历不合适吗？</h3>
	         				<span>确认后，系统将自动反馈以下内容至用户</span>
	         			</div>
	         		</td>
	         	</tr>
	         	<tr>
	             	<td>
	             		<textarea name="content" id="content" style="width:500px;">非常荣幸收到您的简历，在我们仔细阅读您的简历之后，却不得不很遗憾的通知您：
您的简历与该职位的定位有些不匹配，因此无法进入面试。

但您的信息已录入我司人才储备库，当有合适您的职位开放时我们将第一时间联系您，希望在未来我们有机会成为一起拼搏的同事；
再次感谢您对我们的信任，祝您早日找到满意的工作。</textarea>
	             	</td>
	            </tr>
	            <tr>
	             	<td>
	             	<a href="refuseRes.do?d_id=${temp.d_id}&name=${temp.h_email}"><input type="button" value="确认不合适" class="btn"></a>
	             		<a class="emial_cancel" href="javascript:;">取消</a>
	             	</td>
	            </tr>
	        </tbody></table>
	        <input type="hidden" value="" name="deliverId">
        </form>
    </div><!--/#loginPop-->
    </div>
    <div style="display:none;">
    <div id="loginPop2" style="height:400px;"   class="popup">
       	<form id="refuseMailFos" action="doneddelivery.do?d_id=${temp.d_id}&name=${temp.h_email}" method="post">
	     	<table width="100%">
	         	<tbody><tr>
	         		<td>
	         			<div class="refuse_icon">
	         				<h3>确认通知面试吗？</h3>
	         				<span>请填写通知信息，后确认</span>
	         			</div>
	         		</td>
	         	</tr>
	         	<tr>
	             	<td>
	             		<textarea name="content" id="content" style="width:400px;">
</textarea>
	             	</td>
	            </tr>
	            <tr>
	             	<td>
	             		<input type="button" value="确认通知面试" class="btn" onclick="test2()">
	             		<a class="emial_cancel" href="javascript:;">取消</a>
	             	</td>
	            </tr>
	        </tbody></table>
	        <input type="hidden" value="" name="deliverId">
        </form>
    </div><!--/#loginPop-->
    </div>
    
    
			                                    </div>
			                                </div>
			                                <div class="contactInfo">
			                                	<span class="c9">电话：</span>${temp.stu_tel}   &nbsp;&nbsp;&nbsp;   
			                                    <span class="c9">邮箱：</span><a href="mailto:${temp.stu_email}">${temp.stu_email}</a>
			                                </div>
			                            </li>
		                            		                    	</ul><!-- end .resumeLists -->
		                            		                    	</c:forEach>
		                    		                                               	</form>
                    </dd>
                </dl><!-- end .company_center_content -->
            </div><!-- end .content -->
 
<!------------------------------------- 弹窗lightbox ----------------------------------------->


<!------------------------------------- end -----------------------------------------> <script src="style/js/jquery.ui.datetimepicker.min.js" type="text/javascript"></script>
<script src="style/js/received_resumes.min.js" type="text/javascript"></script> 
<script>
</script>  
			<div class="clear"></div>
			<input type="hidden" value="b4bc225f0d084ee5b8d045f9c98a49ff" id="resubmitToken">
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

<script type="text/javascript">
$(function(){
	$('#noticeDot-1').hide();
	$('#noticeTip a.closeNT').click(function(){
		$(this).parent().hide();
	});
});
var index = Math.floor(Math.random() * 2);
var ipArray = new Array('42.62.79.226','42.62.79.227');
var url = "ws://" + ipArray[index] + ":18080/wsServlet?code=314873";
var CallCenter = {
		init:function(url){
			var _websocket = new WebSocket(url);
			_websocket.onopen = function(evt) {
				console.log("Connected to WebSocket server.");
			};
			_websocket.onclose = function(evt) {
				console.log("Disconnected");
			};
			_websocket.onmessage = function(evt) {
				//alert(evt.data);
				var notice = jQuery.parseJSON(evt.data);
				if(notice.status[0] == 0){
					$('#noticeDot-0').hide();
					$('#noticeTip').hide();
					$('#noticeNo').text('').show().parent('a').attr('href',ctx+'/mycenter/delivery.jsp');
					$('#noticeNoPage').text('').show().parent('a').attr('href',ctx+'/mycenter/delivery.jsp');
				}else{
					$('#noticeDot-0').show();
					$('#noticeTip strong').text(notice.status[0]);
					$('#noticeTip').show();
					$('#noticeNo').text('('+notice.status[0]+')').show().parent('a').attr('href',ctx+'/mycenter/delivery.jsp');
					$('#noticeNoPage').text(' ('+notice.status[0]+')').show().parent('a').attr('href',ctx+'/mycenter/delivery.jsp');
				}
				$('#noticeDot-1').hide();
			};
			_websocket.onerror = function(evt) {
				console.log('Error occured: ' + evt);
			};
		}
};
CallCenter.init(url);
</script>

<div id="cboxOverlay" style="display: none;"></div><div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;"><div id="cboxWrapper"><div><div id="cboxTopLeft" style="float: left;"></div><div id="cboxTopCenter" style="float: left;"></div><div id="cboxTopRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxMiddleLeft" style="float: left;"></div><div id="cboxContent" style="float: left;"><div id="cboxTitle" style="float: left;"></div><div id="cboxCurrent" style="float: left;"></div><button type="button" id="cboxPrevious"></button><button type="button" id="cboxNext"></button><button id="cboxSlideshow"></button><div id="cboxLoadingOverlay" style="float: left;"></div><div id="cboxLoadingGraphic" style="float: left;"></div></div><div id="cboxMiddleRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxBottomLeft" style="float: left;"></div><div id="cboxBottomCenter" style="float: left;"></div><div id="cboxBottomRight" style="float: left;"></div></div></div><div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div></div><div class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" id="ui-datepicker-div"></div></body></html>