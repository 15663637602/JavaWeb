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
<title>我的投递记录-招聘服务</title>
<meta content="23635710066417756375" property="qc:admins">
<meta name="description" content="求职">
<meta name="keywords" content="招聘">
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
function getData(){
	var loc = '<%=request.getAttribute("statu")%>' ;
	if(loc!=null){
		document.getElementById(loc).className="current";
	}
}
</script> 
<script src="style/js/conv.js" type="text/javascript"></script>
<script src="style/js/ajaxCross.json" charset="UTF-8"></script></head>
<body onload="getData()">
<div id="body">
	<div id="header">
    	<div class="wrapper">
    		<a class="logo" href="index.jsp">
    			<img width="229" height="43" alt="招聘" src="style/images/logo.png">
    		</a>
    		<ul id="navheader" class="reset">
    			<li><a href="indexshow.do">首页</a></li>
    			<li><a href="positionshow.do">职位</a></li>
                <li><a rel="nofollow" href="jianli.do?name=${sessionScope.username}">简历管理</a></li>
	    						    		</ul>
        	        	<dl class="collapsible_menu">
            	<dt>
           			<span id="Stuname">${sessionScope.username}</span>
           			<input type="hidden" id="stu_idss" value="${sessionScope.username}">
           			<input type="hidden" id="sscore" name="sscore" value="${sessionScope.score}">
            		<span class="red dn" id="noticeDot-0"></span>
            		<i></i>
            	</dt>
                                	<dd><a rel="nofollow" href="jianli.do?name=${sessionScope.username}">我的简历</a></dd>
                                    <dd><a rel="nofollow" href="showdelivery.do?name=${sessionScope.username}">我的投递记录</a></dd>
                                        <dd><a href="enroll.do?name=${sessionScope.username}">毕业去向登记</a></dd>                                        
                                        <dd><a href="stu_updatePwd.jsp">帐号设置</a></dd>
                                <dd class="logout"><a rel="nofollow" href="cancel.do">退出</a></dd>
            </dl>
                                    <div class="dn" id="noticeTip">
            	<span class="bot"></span>
				<span class="top"></span>
            </div>
                    </div>
    </div><!-- end #header -->
    <div id="container">
        	  	
        <div class="clearfix">
            <div class="content_l">
            	<dl class="c_delivery">
                    <dt>
                        <h1><em></em>已投递简历状态</h1>
                        <a class="d_refresh" href="javascript:;">刷新</a>
                    </dt>
                    <dd>
                    	<div class="delivery_tabs">
                    		<ul class="reset">
                    			                    			<li  id="all">
                    				<a href="showdelivery.do?name=${sessionScope.username}">&nbsp;&nbsp;全部&nbsp;&nbsp;</a>
                    			</li>
                    			                    			<li id="success">
                    				<a href="susdelivery.do?name=${sessionScope.username}">&nbsp;&nbsp;投递成功&nbsp;&nbsp;</a>
                    			</li>
                    			
                    			<li id="done">
                    				<a href="donedelivery.do?name=${sessionScope.username}">&nbsp;&nbsp;通知面试&nbsp;&nbsp;</a>
                    			</li>
                    			<li id="un">
                    				<a href="undelivery.do?name=${sessionScope.username}">不合适</a>
                    			</li>
                    		</ul>
                    	</div>
                    	                        <form id="deliveryForm">
                    	                     <ul class="reset my_delivery">
                    	                     <li>
                    	                     <div class="d_item">
                    	              <div  style="text-align: center">   <a>    <em>无符合条件的投递记录</em></a></div>
                    	                     </div>
                    	                     </li>
                    	                     </ul>   
                    	         
                        </form>
                                            </dd>
                </dl>
            </div>	
            <div class="content_r">
            	<div class="mycenterR" id="myInfo">
            		<h2>我的信息</h2>
            		<a href="jianli.do?name=${sessionScope.username}">我的简历</a>
            		<br>
            		            		<a href="stu_updatePwd.jsp">账户设置</a>
            		<br>
            		            		
            		            	</div><!--end #myInfo-->
            					<div class="mycenterR" id="myRecommend">
            		<h2>可能适合你的职位 <i>工作城市</i></h2>
            		<ul class="reset">
            		 <c:forEach items="${PositionList}" var="temp"> 
            			            			<li>
            				<a target="_blank" href="stus_showjob.do?p_id=${temp.p_id}&h_email=${temp.h_email}&name=${sessionScope.username}">
								<span class="f16">${temp.p_name}</span>
								<span class="c7">${temp.p_company}</span>
								<em>${temp.p_loc}</em>
							</a>
            			</li>
            			</c:forEach>
            			            			
            			            		</ul>
            		            	</div><!--end #myRecommend-->
								<div class="greybg qrcode mt20">
                	<img width="242" height="242" alt="微信公众号二维码" src="style/images/qr_delivery.png">
                    <span class="c7">扫描二维码，微信轻松搜工作</span>
                </div>
            </div>
       	</div>
      <input type="hidden" id="userid" name="userid" value="314873">

<script src="style/js/delivery.js"></script>
<script>
$(function(){
	//location.reload(true);

	$('.Pagination').pager({
	      currPage: 1,
	      pageNOName: "pageNo",
	      form: "deliveryForm",
	      pageCount: 1,
	      pageSize:  5
	});
});
</script>
			<div class="clear"></div>
			<input type="hidden" value="" id="resubmitToken">
	    	<a rel="nofollow" title="回到顶部" id="backtop" style="display: none;"></a>
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

<div id="cboxOverlay" style="display: none;"></div><div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;"><div id="cboxWrapper"><div><div id="cboxTopLeft" style="float: left;"></div><div id="cboxTopCenter" style="float: left;"></div><div id="cboxTopRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxMiddleLeft" style="float: left;"></div><div id="cboxContent" style="float: left;"><div id="cboxTitle" style="float: left;"></div><div id="cboxCurrent" style="float: left;"></div><button type="button" id="cboxPrevious"></button><button type="button" id="cboxNext"></button><button id="cboxSlideshow"></button><div id="cboxLoadingOverlay" style="float: left;"></div><div id="cboxLoadingGraphic" style="float: left;"></div></div><div id="cboxMiddleRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxBottomLeft" style="float: left;"></div><div id="cboxBottomCenter" style="float: left;"></div><div id="cboxBottomRight" style="float: left;"></div></div></div><div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div></div></body></html>