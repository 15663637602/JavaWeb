<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb">
<head>
<script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate" media="handheld"  />
<!-- end 云适配 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>毕业去向登记</title>
<meta property="qc:admins" content="23635710066417756375" />
<meta content="求职" name="description">
<meta content="登记">
<meta name="baidu-site-verification" content="QIQ6KC1oZ6" />

<!-- <div class="web_root"  style="display:none">h</div> -->
<script type="text/javascript">
var ctx = "h";
console.log(1);
</script>
<link rel="Shortcut Icon" href="h/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="style/css/style.css"/>
<link rel="stylesheet" type="text/css" href="style/css/external.min.css"/>
<link rel="stylesheet" type="text/css" href="style/css/popup.css"/>
<script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="style/js/jquery.lib.min.js"></script>
<script src="style/js/ajaxfileupload.js" type="text/javascript"></script>
<script type="text/javascript" src="style/js/additional-methods.js"></script>
<!--[if lte IE 8]>
    <script type="text/javascript" src="style/js/excanvas.js"></script>
<![endif]-->
<script type="text/javascript">
var youdao_conv_id = 271546; 
function salary(String){
	document.getElementById("e_salary").value = String;
}
</script> 
<script type="text/javascript" src="style/js/conv.js"></script>
</head>
<body>
<div id="body">
	<div id="header">
    	<div class="wrapper">
    		<a class="logo">
    			<img src="style/images/logo.png" width="229" height="43" alt="求职" />
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
                                </div>
    </div><!-- end #header -->
    <div id="container">
        	  	
        <div class="clearfix">
            <div class="content_l">
            	<h1>我的毕业去向</h1>
            	<span id="emailError" class="error" >${error}</span>
            	            		            
	           <!--      -->
          		<input type="hidden" id="orderCount" value="0" />
      <%String states =(String)session.getAttribute("states"); 
      if(states.compareTo("first")==0){%>    	
                <form id="subForms" action="finsertEnroll.do?name=${sessionScope.username}" method="post">
                	<input type="hidden" value="" name="id" id="orderId" />
	                <div class="s_form">
	                	<dl>
	                    	<dt>
	                        	<h3>姓名  <i class="rss_circle"></i><span>（必填）</span></h3>
	                        </dt>
	                        <dd>
	                        	<input type="text" id="e_name" name="e_name" placeholder="请输您的姓名"  />	
	                        </dd>
	                    </dl>
	                    <dl>
	                    	<dt>
	                        	<h3>入职公司  <i class="rss_circle"></i><span>（必填）</span></h3>
	                        </dt>
	                        <dd>
	                        	<input type="text" id="e_company" name="e_company" placeholder="请输入公司全称" value="" />	
	                        </dd>
	                    </dl>
	                    <dl>
	                    	<dt>
	                        	<h3>职位名称 <em></em><span>（必填）</span></h3>	
	                        </dt>
	                        <dd>
	                        	<input type="text" id="e_position" name="e_position" placeholder="请输入职位名称" value="" />	 
	                        </dd>
	                    </dl>
	                    <dl>
	                    	<dt>
	                        	<h3>工作地点 <em></em><span>（必填）</span></h3>
	                        </dt>
	                        <dd>
	                        	<input type="text" id="e_location" name="e_location" placeholder="请输入工作地点" value="" />		
	                        </dd>
	                    </dl> 
	                    <dl>
	                    	<dt>
	                        	<h3>月薪范围 <em></em></h3>
	                        </dt>
	                        <dd>
	                        	<input type="hidden" id="e_salary" name="e_salary" />
	                            <input type="button" class="select" id="select_salary" value="请选择月薪范围" />
	                            <div id="box_salary" class="dn">
	                            	<ul class="reset">
	                                		                                		<li onclick="salary('2k以下')">2k以下</li>
	                                		                                		<li onclick="salary('2k-5k')">2k-5k</li>
	                                		                                		<li onclick="salary('5k-10k')">5k-10k</li>
	                                		                                		<li onclick="salary('10k-15k')">10k-15k</li>
	                                		                                		<li onclick="salary('15k-25k')">15k-25k</li>
	                                		                                		<li onclick="salary('25k-50k')">25k-50k</li>
	                                		                                		<li onclick="salary('50k以上')">50k以上</li>
	                                		                                </ul>
	                            </div>
	                        </dd>
	                    </dl>
	                    <input type="submit" class="btn_big" id="subSubmit" value="提 交" />
	                </div>
	        	</form>
           <%}else{ %>
            <form id="subForms" action="fupdateEnroll.do?name=${sessionScope.username}" method="post">
                	<input type="hidden" value="" name="id" id="orderId" />
	                <div class="s_form">
	                	<dl>
	                    	<dt>
	                        	<h3>姓名  <i class="rss_circle"></i><span>（必填）</span></h3>
	                        </dt>
	                        <dd>
	                        	<input type="text" id="e_name" name="e_name" placeholder="请输您的姓名" value="${eif.e_name}" />	
	                        </dd>
	                    </dl>
	                    <dl>
	                    	<dt>
	                        	<h3>入职公司  <i class="rss_circle"></i><span>（必填）</span></h3>
	                        </dt>
	                        <dd>
	                        	<input type="text" id="e_company" name="e_company" placeholder="请输入公司全称" value="${eif.e_company}" />	
	                        </dd>
	                    </dl>
	                    <dl>
	                    	<dt>
	                        	<h3>职位名称 <em></em><span>（必填）</span></h3>	
	                        </dt>
	                        <dd>
	                        	<input type="text" id="e_position" name="e_position" placeholder="请输入职位名称" value="${eif.e_position}" />	 
	                        </dd>
	                    </dl>
	                    <dl>
	                    	<dt>
	                        	<h3>工作地点 <em></em><span>（必填）</span></h3>
	                        </dt>
	                        <dd>
	                        	<input type="text" id="e_location" name="e_location" placeholder="请输入工作地点" value="${eif.e_location}" />		
	                        </dd>
	                    </dl> 
	                    <dl>
	                    	<dt>
	                        	<h3>月薪范围 <em></em></h3>
	                        </dt>
	                        <dd>
	                        	<input type="hidden" id="e_salary" name="e_salary" value="${eif.e_salary}"/>
	                            <input type="button" class="select" id="select_salary" value="${eif.e_salary}" />
	                            <div id="box_salary" class="dn">
	                            	<ul class="reset">
	                                		                                		<li onclick="salary('2k以下')">2k以下</li>
	                                		                                		<li onclick="salary('2k-5k')">2k-5k</li>
	                                		                                		<li onclick="salary('5k-10k')">5k-10k</li>
	                                		                                		<li onclick="salary('10k-15k')">10k-15k</li>
	                                		                                		<li onclick="salary('15k-25k')">15k-25k</li>
	                                		                                		<li onclick="salary('25k-50k')">25k-50k</li>
	                                		                                		<li onclick="salary('50k以上')">50k以上</li>
	                                		                                </ul>
	                            </div>
	                        </dd>
	                    </dl>
	                    <input type="submit" class="btn_big" id="subSubmit" value="修改" />
	                </div>
	        	</form>
           <%} %>
            </div>	
            
       	</div>
<script src="style/js/sub.min.js"></script>>
			<div class="clear"></div>
			<input type="hidden" id="resubmitToken" value="f828aecf8b80414491d138ca1190fb6d" />
	    	<a id="backtop" title="回到顶部" rel="nofollow"></a>
	    </div><!-- end #container -->
	</div><!-- end #body -->
	<div id="footer">
		<div class="wrapper">
			联系我们:nic@hrbeu.edu.cn
		    <a class="footer_qr" href="javascript:void(0)" rel="nofollow">微信公众号<i></i></a>
			<div class="copyright">&copy;2016-2017 HEU 黑ICP备0500000</div>
		</div>
	</div>

<script type="text/javascript" src="style/js/core.min.js"></script>
<script type="text/javascript" src="style/js/popup.min.js"></script>

<!--  -->

</body>
</html>