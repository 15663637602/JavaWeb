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
<title>Apply for certification</title>
<meta content="23635710066417756375" property="qc:admins">
<meta name="description" content="Job wanted">
<meta name="keywords" content="Job wanted">
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
<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
<script type="text/javascript">

</script>
<body>
<div id="body">
	<div id="header">
    	<div class="wrapper">
    		<a class="logo">
    			<img width="229" height="43" alt="recruitment" src="style/images/logo.png">
    		</a>
    		<ul id="navheader" class="reset">
    			<li><a href="myhome.do?name=${sessionScope.username}">Company Page</a></li>
    			<li><a rel="nofollow" href="create.do?name=${sessionScope.username}">Post job</a></li>
                <li><a href="positions.do?name=${sessionScope.username}">职位管理</a></li>
	    	</ul>
        	<dl class="collapsible_menu">
            	<dt>
           			<span>${sessionScope.username}&nbsp;</span> <input type="hidden" value="${sessionScope.username}" id="h_email">
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
        
        <div class="content_mid">
        	<dl class="c_section c_section_mid">
        		<dt>
                    <h2><em></em>申请公司认证</h2>
                </dt>
                <dd class="c_certify"> 
                	<h4>申请公司认证的标准</h4>
                    <ul class="c_certify_list">
                    	<li class="list1">公司主页<span>[ 网站处于正常运行状态，且必须具有备案号 ]</span></li>
                        <li class="list2">公司名称<span>[ 简称应为企业/产品简称，不可使用简易修饰性词语 ]</span></li>
                        <li class="list3">公司logo<span>[ 必须真实有效的体现公司形象 ]</span></li>
                        <li class="list4">
                        	公司的营业执照
		                    <div class="list4_child">
		                    	<span>*</span>
		                    	<div>
		                    		 4.1请提供有效年检期内的《企业法人营业执照》副本<br>
		                    		  4.2为保证信息安全，审核执照不提供预览功能，请谅解<br>
		                    		   4.3该营业执照只用作公司认证使用，请放心上传
		                    	</div>
		                    </div>
                        </li>
                    </ul>
                    <form action="uploadAuth.do?name=${sessionScope.username}" method="post" enctype="multipart/form-data">
                   	<div class="business_license">
                        <div class="license_upload">
                            <div style="background-color: rgb(147, 183, 187);">
                                <span>上传公司营业执照副本</span> 
                                <br>	
                                支持jpg、png、gif、pdf格式，名称不要包含中文，文件不超过10M
                            </div>
                        </div>
                        <input type="file" name="file" id="myBlogImage" >
                        <input type="hidden" value="0" name="type" id="type">  
                    </div>
                    <input type="submit" value="申请认证" class="btn fr btn_apply">
                    </form>
                </dd>
            </dl>
       	</div>
       	
<script src="style/js/certification.min.js" type="text/javascript"></script>
			<div class="clear"></div>
			<input type="hidden" value="" id="resubmitToken">
	    	<a rel="nofollow" title="回到顶部" id="backtop" style="display: none;"></a>
	    </div><!-- end #container -->
	</div><!-- end #body -->
	<div id="footer">
		<div class="wrapper">
			联系我们:nic@hrbeu.edu.cn
		    <a rel="nofollow" href="javascript:void(0)" class="footer_qr">微信公众号<i></i></a>
			<div class="copyright">&copy;2016-2017 HEU 黑ICP备0500000</div>
		</div>
	</div>

<script src="style/js/core.min.js" type="text/javascript"></script>
<script src="style/js/popup.min.js" type="text/javascript"></script>

<!--  -->


<div id="cboxOverlay" style="display: none;"></div><div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;"><div id="cboxWrapper"><div><div id="cboxTopLeft" style="float: left;"></div><div id="cboxTopCenter" style="float: left;"></div><div id="cboxTopRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxMiddleLeft" style="float: left;"></div><div id="cboxContent" style="float: left;"><div id="cboxTitle" style="float: left;"></div><div id="cboxCurrent" style="float: left;"></div><button type="button" id="cboxPrevious"></button><button type="button" id="cboxNext"></button><button id="cboxSlideshow"></button><div id="cboxLoadingOverlay" style="float: left;"></div><div id="cboxLoadingGraphic" style="float: left;"></div></div><div id="cboxMiddleRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxBottomLeft" style="float: left;"></div><div id="cboxBottomCenter" style="float: left;"></div><div id="cboxBottomRight" style="float: left;"></div></div></div><div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div></div></body></html>