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
<title>HEU</title>
<meta property="qc:admins" content="23635710066417756375" />
<meta content="HEUJOB" name="description">
<meta content="求职" name="keywords">
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
function test(String){
	document.getElementById("titlesss").value = String;
	document.getElementById("sidess").submit();
}
function changeloc(String){
	document.getElementById("p_loc").value = String;
	document.getElementById("searchForms").submit();
}
function getData(){
	var loc = '<%=request.getAttribute("p_loc")%>' ;
	if(loc!=null){
		document.getElementById(loc).className="current";
	}
}
function first(){
	document.getElementById("searchForms").submit();
}
function upon(){
	document.getElementById("searchForms").action = "uponposition.do";
	document.getElementById("searchForms").submit();
}
function next(){
	document.getElementById("searchForms").action = "nextposition.do";
	document.getElementById("searchForms").submit();
}
</script> 
<script type="text/javascript" src="style/js/conv.js"></script>
</head>
<body onload="getData()">
<div id="body">
	<div id="header">
    	<div class="wrapper">
    		<a  class="logo">
    			<img src="style/images/logo.png" width="229" height="43" alt="招聘" />
    		</a>
    		
    		<%String status =(String)session.getAttribute("status");
if(status==null){%>
    		<ul class="reset" id="navheader">
    			<li><a href="index.jsp">首页</a></li>
    			<li class="current"><a href="positionshow.do">职位</a></li>
	    	</ul><%}else if(status.compareTo("student")==0){%>
	    	<ul id="navheader" class="reset">
    			<li><a href="indexshow.do">首页</a></li>
    			<li class="current"><a href="positionshow.do">职位</a></li>
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
 <form id="sidess" action="selectPos.do" method="post">			
        <input type="hidden" id="titlesss" name="titlesss" value="">			
        <input type="hidden" name="p_locsss" id="p_locsss" value="${p_loc}"/>	
		<div id="sidebar">
			<div class="mainNavs">
						
									<div class="menu_box">
						<div class="menu_main">
							<h2>技术 <span></span></h2>
				<a onclick="test('Java')">Java</a>
				<a onclick="test('PHP')">PHP</a>
				<a onclick="test('C')">C</a>
				<a onclick="test('C++')">C++</a>
				<a onclick="test('Android')">Android</a>
				<a onclick="test('iOS')">iOS</a>
				<a onclick="test('前端')">前端开发</a>
				<a onclick="test('测试')">测试</a>
				<a onclick="test('技术')">技术经理</a>
				<a onclick="test('项目')">项目经理</a>
				<a onclick="test('架构师')">架构师</a>
			</div>
					   	<div class="menu_sub dn">
					   								    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('后端开发')">
			后端开发</a>
					        		</dt>
						        	<dd>
								   	<a onclick="test('Java')"
class="curr">Java</a>
									   	<a onclick="test('C++')">C++</a>
							            										   	<a onclick="test('PHP')"										   			class="curr"
									            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>PHP</a>
							            										   	<a onclick="test('数据挖掘')"
>数据挖掘</a>
							            										   	<a onclick="test('C')"
										   		
										   		 									            										            											            										            											            										            											            			class="curr"
									            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>C</a>
							            										   	<a onclick="test('C#')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>C#</a>
							            										   	<a onclick="test('.NET')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>.NET</a>
							            										   	<a onclick="test('Hadoop')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Hadoop</a>
							            										   	<a onclick="test('Python')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Python</a>
							            										   	<a onclick="test('Delphi')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Delphi</a>
							            										   	<a onclick="test('VB')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>VB</a>
							            										   	<a onclick="test('Perl')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Perl</a>
							            										   	<a onclick="test('Ruby')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Ruby</a>
							            										   	<a onclick="test('Node.js')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Node.js</a>
							            							        </dd>
					        	</dl>
													 		   	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('移动')">
		                   						移动开发
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('HTML5')"
				
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>HTML5</a>
							            										   	<a onclick="test('Android')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            			class="curr"
									            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Android</a>
							            										   	<a onclick="test('iOS')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            			class="curr"
									            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>iOS</a>
							            										   	<a onclick="test('WP')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>WP</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('前端')">
			  							        				前端开发
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('web前端')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>web前端</a>
							            										   	<a onclick="test('Flash')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Flash</a>
							            										   	<a onclick="test('html5')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>html5</a>
							            										   	<a onclick="test('JS')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>JavaScript</a>
							            										   	<a onclick="test('U3D')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>U3D</a>
							            										   	<a  onclick="test('COCOS2D-X')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>COCOS2D-X</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('测试')">
						            							测试
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a  onclick="test('测试工程师')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>测试工程师</a>
							            										   	<a  onclick="test('自动化测试')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>自动化测试</a>
							            										   	<a onclick="test('功能测试')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>功能测试</a>
							            										   	<a  onclick="test('性能测试')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>性能测试</a>
							            										   	<a  onclick="test('测试开发')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>测试开发</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a  onclick="test('运维')">
			   							运维
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a  onclick="test('运维工程师')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>运维工程师</a>
							            										   	<a  onclick="test('运维开发工程师')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>运维开发工程师</a>
							            										   	<a  onclick="test('网络工程师')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>网络工程师</a>
							            										   	<a  onclick="test('系统工程师')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>系统工程师</a>
							            										   	<a  onclick="test('IT支持')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>IT支持</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a  onclick="test('DBA')">
					            	      				DBA
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a  onclick="test('MySQL')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>MySQL</a>
							            										   	<a onclick="test('SQLServer')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>SQLServer</a>
							            										   	<a onclick="test('Oracle')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Oracle</a>
							            										   	<a onclick="test('DB2')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>DB2</a>
							            										   	<a  onclick="test('MongoDB')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>MongoDB</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('项目管理')">
				            		 				项目管理
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('项目经理')"
										   	  										            										            											            										            										   		
										   	>项目经理</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('经理')">
				  					        				高端职位
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a  onclick="test('技术经理')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            			class="curr"
									            											            										            											            										            											            										            										   		
										   	>技术经理</a>
							            										   	<a onclick="test('技术总监')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>技术总监</a>
							            										   	<a  onclick="test('测试经理')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>测试经理</a>
							            										   	<a  onclick="test('架构师')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            			class="curr"
									            											            										            										   		
										   	>架构师</a>
							            										   	<a  onclick="test('CTO')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>CTO</a>
							            										   	<a  onclick="test('运维总监')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>运维总监</a>
							            							        </dd>
					        	</dl>
													</div>
					</div>
									<div class="menu_box">
						<div class="menu_main">
							<h2>产品 <span></span></h2>
											            					            		<a onclick="test('产品经理')">产品经理</a>
				            					            		<a onclick="test('产品助理')">产品助理</a>
				            					            		<a  onclick="test('无线产品经理')">无线产品经理</a>
				            					            		<a onclick="test('游戏策划')">游戏策划</a>
				            					            					   	</div>
					   	<div class="menu_sub dn">
					   								    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('产品经理')">
								         	产品经理
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a  onclick="test('产品经理')"
										   		
										   		 									            										            											            			class="curr"
									            											            										            											            										            											            										            											            										            										   		
										   	>产品经理</a>
							            										   	<a  onclick="test('网页产品经理')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>网页产品经理</a>
							            										   	<a  onclick="test('移动产品经理')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>移动产品经理</a>
							            										   	<a  onclick="test('产品助理')"
										   		
										   		 									            										            											            										            											            			class="curr"
									            											            										            											            										            											            										            										   		
										   	>产品助理</a>
							            										   	<a  onclick="test('数据产品经理')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>数据产品经理</a>
							            										   	<a  onclick="test('电商产品经理')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>电商产品经理</a>
							            										   	<a  onclick="test('游戏策划')"
										   		
										   		 									            										            											            										            											            										            											            										            											            			class="curr"
									            											            										            										   		
										   	>游戏策划</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a  onclick="test('产品')">
					 			    			产品设计师
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a  onclick="test('网页产品')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>网页产品设计师</a>
							            										   	<a  onclick="test('无线')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>无线产品设计师</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('产品')">
								            高端职位
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('产品经理')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>产品部经理</a>
							            										   	<a  onclick="test('产品总监')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>产品总监</a>
							            							        </dd>
					        	</dl>
													</div>
					</div>
									<div class="menu_box">
						<div class="menu_main">
							<h2>设计 <span></span></h2>
											            					            		<a onclick="test('UI')">UI</a>
				            					            		<a onclick="test('UE')">UE</a>
				            					            		<a onclick="test('设计')">设计师</a>
				            					            		<a  onclick="test('交互设计')">交互设计</a>
				            					            		<a onclick="test('数据分析')">数据分析</a>
				            					            					   	</div>
					   	<div class="menu_sub dn">
					   								    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('设计师')">
     								   	     				视觉设计
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('视觉')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>视觉设计师</a>
							            										   	<a  onclick="test('网页')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>网页设计师</a>
							            										   	<a  onclick="test('Flash')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Flash设计师</a>
							            										   	<a  onclick="test('APP')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>APP设计师</a>
							            										   	<a  onclick="test('UI')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>UI设计师</a>
							            										   	<a  onclick="test('平面')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>平面设计师</a>
							            										   	<a  onclick="test('美术')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>美术设计师（2D/3D）</a>
							            										   	<a onclick="test('广告')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>广告设计师</a>
							            										   	<a  onclick="test('多媒体')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>多媒体设计师</a>
							            										   	<a  onclick="test('原画师')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>原画师</a>
							            										   	<a  onclick="test('游戏特效')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>游戏特效</a>
							            										   	<a  onclick="test('游戏界面设计师')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>游戏界面设计师</a>
							            										   	<a  onclick="test('游戏场景')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>游戏场景</a>
							            										   	<a  onclick="test('游戏角色')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>游戏角色</a>
							            										   	<a onclick="test('游戏动作')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>游戏动作</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('交互设计')">
									          	交互设计
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('交互设计师')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>交互设计师</a>
							            										   	<a onclick="test('无线交互设计师')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>无线交互设计师</a>
							            										   	<a onclick="test('网页交互设计师')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>网页交互设计师</a>
							            										   	<a onclick="test('硬件交互设计师')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>硬件交互设计师</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('用户研究')">
					          					用户研究
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('数据分析师')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>数据分析师</a>
							            										   	<a onclick="test('用户研究员')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>用户研究员</a>
							            										   	<a  onclick="test('游戏数值策划')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>游戏数值策划</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('高端职位')">
					              			  					高端职位
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('设计经理/主管')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>设计经理/主管</a>
							            										   	<a onclick="test('设计总监')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>设计总监</a>
							            										   	<a  onclick="test('视觉设计经理/主管')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>视觉设计经理/主管</a>
							            										   	<a  onclick="test('视觉设计总监')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>视觉设计总监</a>
							            										   	<a  onclick="test('交互设计经理/主管')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>交互设计经理/主管</a>
							            										   	<a  onclick="test('交互设计总监')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>交互设计总监</a>
							            										   	<a  onclick="test('用户研究经理/主管')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>用户研究经理/主管</a>
							            										   	<a  onclick="test('用户研究总监')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>用户研究总监</a>
							            							        </dd>
					        	</dl>
													</div>
					</div>
									<div class="menu_box">
						<div class="menu_main">
							<h2>运营 <span></span></h2>
											            					            		<a  onclick="test('运营')">运营</a>
				            					            		<a onclick="test('游戏运营')">游戏运营</a>
				            					            		<a onclick="test('编辑')">编辑</a>
				            					            					   	</div>
					   	<div class="menu_sub dn">
					   								    	<dl class="reset">
					        							        		<dt>
					        			<a  onclick="test('运营')">
					      					运营
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('用户运营')"
										   		
										   		 									            										            											            										            											            										            											            										            										   		
										   	>用户运营</a>
							            										   	<a onclick="test('产品运营')"
										   		
										   		 									            										            											            										            											            										            											            										            										   		
										   	>产品运营</a>
							            										   	<a onclick="test('数据运营')"
										   		
										   		 									            										            											            										            											            										            											            										            										   		
										   	>数据运营</a>
							            										   	<a  onclick="test('内容运营')"
										   		
										   		 									            										            											            										            											            										            											            										            										   		
										   	>内容运营</a>
							            										   	<a  onclick="test('活动运营')"
										   		
										   		 									            										            											            										            											            										            											            										            										   		
										   	>活动运营</a>
							            										   	<a  onclick="test('商家运营')"
										   		
										   		 									            										            											            										            											            										            											            										            										   		
										   	>商家运营</a>
							            										   	<a  onclick="test('品类运营')"
										   		
										   		 									            										            											            										            											            										            											            										            										   		
										   	>品类运营</a>
							            										   	<a  onclick="test('游戏运营')"
										   		
										   		 									            										            											            										            											            			class="curr"
									            											            										            											            										            										   		
										   	>游戏运营</a>
							            										   	<a  onclick="test('网络推广')"
										   		
										   		 									            										            											            										            											            										            											            										            										   		
										   	>网络推广</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a  onclick="test('编辑')">
		           		    				编辑
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('副主编')"
										   		
										   		 									            										            											            										            											            										            											            										            										   		
										   	>副主编</a>
							            										   	<a  onclick="test('内容编辑')"
										   		
										   		 									            										            											            										            											            										            											            										            										   		
										   	>内容编辑</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a  onclick="test('客服')">
		 	    				客服
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('售前咨询')"
										   		
										   		 									            										            											            										            											            										            											            										            										   		
										   	>售前咨询</a>
							            										   	<a  onclick="test('售后客服')"
										   		
										   		 									            										            											            										            											            										            											            										            										   		
										   	>售后客服</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('高端职位')">
					        				高端职位
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('主编')"
										   		
										   		 									            										            											            										            											            										            											            										            										   		
										   	>主编</a>
							            										   	<a onclick="test('运营总监')"
										   		
										   		 									            										            											            										            											            										            											            										            										   		
										   	>运营总监</a>
							            										   	<a  onclick="test('COO')"
										   		
										   		 									            										            											            										            											            										            											            										            										   		
										   	>COO</a>
							            							        </dd>
					        	</dl>
													</div>
					</div>
									<div class="menu_box">
						<div class="menu_main">
							<h2>市场与销售 <span></span></h2>
											            					            		<a  onclick="test('市场推广')">市场推广</a>
				            					            		<a onclick="test('市场策划')">市场策划</a>
				            					            		<a onclick="test('活动策划')">活动策划</a>
				            					            		<a onclick="test('BD')">BD</a>
				            					            		<a  onclick="test('销售经理')">销售经理</a>
				            					            					   	</div>
					   	<div class="menu_sub dn">
					   								    	<dl class="reset">
					        							        		<dt>
					        			<a  onclick="test('市场/营销')">
					 		市场/营销
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('市场营销')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>市场营销</a>
							            										   	<a onclick="test('市场策划')"
										   		
										   		 									            										            											            										            											            			class="curr"
									            											            										            											            										            											            										            											            										           											   		
										   	>市场策划</a>
							            										   	<a onclick="test('市场顾问')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>市场顾问</a>
							            										   	<a onclick="test('市场推广')"
										   		
										   		 									            										            											            			class="curr"
									            											            										            											            										            											            										            											            										            											            										           											   		
										   	>市场推广</a>
							            										   	<a onclick="test('SEO')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>SEO</a>
							            										   	<a onclick="test('SEM')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>SEM</a>
							            										   	<a onclick="test('商务渠道')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>商务渠道</a>
							            										   	<a  onclick="test('商业数据分析')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>商业数据分析</a>
							            										   	<a onclick="test('活动策划')"
										   		
										   		 									            										            											            										            											            										            											            			class="curr"
									            											            										            											            										            											            										           											   		
										   	>活动策划</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('公关')">
							   		公关
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('媒介经理')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>媒介经理</a>
							            										   	<a  onclick="test('广告协调')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>广告协调</a>
							            										   	<a onclick="test('品牌公关')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>品牌公关</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('销售')">
										        				销售
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('销售专员')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>销售专员</a>
							            										   	<a  onclick="test('销售经理')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            			class="curr"
									            											            										           											   		
										   	>销售经理</a>
							            										   	<a  onclick="test('客户代表')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>客户代表</a>
							            										   	<a  onclick="test('大客户代表')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>大客户代表</a>
							            										   	<a onclick="test('BD经理')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>BD经理</a>
							            										   	<a onclick="test('商务渠道')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>商务渠道</a>
							            										   	<a onclick="test('渠道销售')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>渠道销售</a>
							            										   	<a onclick="test('代理商销售')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>代理商销售</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a  onclick="test('高端职位')">
				   					   	 				高端职位
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('市场总监')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>市场总监</a>
							            										   	<a onclick="test('销售总监')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>销售总监</a>
							            										   	<a  onclick="test('商务总监')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>商务总监</a>
							            										   	<a onclick="test('CMO')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>CMO</a>
							            										   	<a onclick="test('公关总监')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>公关总监</a>
							            							        </dd>
					        	</dl>
													</div>
					</div>
									<div class="menu_box">
						<div class="menu_main">
							<h2>职能 <span></span></h2>
											            					            		<a  onclick="test('HR')">HR</a>
				            					            		<a onclick="test('行政')">行政</a>
				            					            		<a onclick="test('会计')">会计</a>
				            					            		<a onclick="test('出纳')">出纳</a>
				            					            					   	</div>
					   	<div class="menu_sub dn">
					   								    	<dl class="reset">
					        							        		<dt>
					        			<a  onclick="test('人力资源')">
					          				人力资源
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('人力资源')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>人力资源</a>
							            										   	<a onclick="test('招聘')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>招聘</a>
							            										   	<a  onclick="test('HRBP')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>HRBP</a>
							            										   	<a onclick="test('人事/HR')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>人事/HR</a>
							            										   	<a onclick="test('培训经理')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>培训经理</a>
							            										   	<a  onclick="test('薪资福利经理')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>薪资福利经理</a>
							            										   	<a  onclick="test('绩效考核经理')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>绩效考核经理</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('行政')">
					        	        				行政
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('助理')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>助理</a>
							            										   	<a onclick="test('前台')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>前台</a>
							            										   	<a  onclick="test('法务')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>法务</a>
							            										   	<a  onclick="test('行政')"
										   		
										   		 									            										            											            										            											            			class="curr"
									            											            										            											            										            											            										            										   		
										   	>行政</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('财务')">
					           				财务
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a  onclick="test('会计')" class="curr">会计</a>							            										   
							        											   		<a  onclick="test('出纳')"class="curr">出纳</a>	
							        											 	<a  onclick="test('财务')">财务</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('高端职位')">
				高端职位
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('行政总监/经理')"
>行政总监/经理</a>
							            										   	<a  onclick="test('财务总监/经理')"
		   		
										   	>财务总监/经理</a>
							            										   	<a  onclick="test('HRD/HRM')">HRD/HRM</a>					            										   
							            										   		<a  onclick="test('CFO')">CFO</a>							   							        </dd>
					        	</dl>												</div>
					</div>
							</div>			
		</div>
		</form>
		<form id="searchForms"  action="selectPos2.do" method="post">
        <div class="content">	
	        			<div id="search_box">
		
        <ul id="searchType">
        	        	<li data-searchtype="1" class="type_selected">职位</li>
        	<li data-searchtype="4">公司</li>
        	        </ul>
        <div class="searchtype_arrow"></div>
        <input type="text" id="search_input" name = "search_input"  tabindex="1" value="${p_name_storage}"  placeholder="请输入职位名称，如：产品经理"  />
        <input type="hidden" name="p_loc" id="p_loc" value="${p_loc}"/>
        <input type="hidden" name="begin" id="begin" value="${begin}"/>
        <input type="hidden" name="end" id="end" value="${end}"/>
        <input type="hidden" name="yx" id="yxInput" value=""/>
        <input type="hidden" name="gx" id="gxInput" value="" />
        <input type="hidden" name="st" id="stInput" value="" />
        <input type="hidden" name="labelWords" id="labelWords" value="" />
        <input type="hidden" name="lc" id="lc" value="" />
        <input type="hidden" name="workAddress" id="workAddress" value=""/>
                <input type="hidden" name="city" id="cityInput" value=""/>
                <input type="submit" id="search_button" value="搜索"/>
				
    
</div>
<style>
.ui-autocomplete{width:488px;background:#fafafa !important;position: relative;z-index:10;border: 2px solid #91cebe;}
.ui-autocomplete-category{font-size:16px;color:#999;width:50px;position: absolute;z-index:11; right: 0px;/*top: 6px; */text-align:center;border-top: 1px dashed #e5e5e5;padding:5px 0;}
.ui-menu-item{ *width:439px;vertical-align: middle;position: relative;margin: 0px;margin-right: 50px !important;background:#fff;border-right: 1px dashed #ededed;}
.ui-menu-item a{display:block;overflow:hidden;}
</style>
<script type="text/javascript" src="style/js/search.min.js"></script>

<dl class="hotSearch">
	<dt>热门搜索：</dt>
	<dd><a onclick="test('Java')">Java</a></dd>
	<dd><a onclick="test('PHP')">PHP</a></dd>
	<dd><a onclick="test('Android')">Android</a></dd>
	<dd><a onclick="test('iOS')">iOS</a></dd>
	<dd><a onclick="test('前端')">前端</a></dd>
	<dd><a onclick="test('产品经理')">产品经理</a></dd>
	<dd><a onclick="test('UI')">UI</a></dd>
	<dd><a onclick="test('运营')">运营</a></dd>
	<dd><a onclick="test('BD')">BD</a></dd>
	<dd><a onclick="test('实习')">实习</a></dd>
</dl><!--/#main_banner-->
			
  <%
if(name==null){%>         	
            <ul class="reset hotabbing">
            	            		<li class="current">热门浏览</li>
            </ul>
            <%}else{ %>
            <div class="breakline"></div>
            <dl class="workplace" id="workplaceSelect">
                <dt class="fl">工作地点：</dt>
               	               	<dd >
                	<a onclick="changeloc('全国')" id="全国">全国</a> 
                	                	|
                	               	</dd>
               	               	<dd >
                	<a onclick="changeloc('北京')" id="北京">北京</a> 
                	                	|
                	               	</dd>
               	               	<dd >
                	<a onclick="changeloc('上海')" id="上海">上海</a> 
                	                	|
                	               	</dd>
               	               	<dd >
                	<a onclick="changeloc('广州')" id="广州">广州</a> 
                	                	|
                	               	</dd>
               	               	<dd >
                	<a onclick="changeloc('深圳')" id="深圳">深圳</a> 
                	                	|
                	               	</dd>
               	               	<dd >
                	<a onclick="changeloc('成都')" id="成都">成都</a> 
                	                	|
                	               	</dd>
               	               	<dd >
                	<a onclick="changeloc('杭州')" id="杭州">杭州</a> 
                	                	|
                	               	</dd>
               	               	<dd >
                	<a onclick="changeloc('武汉')" id="武汉">武汉</a> 
                	                	|
                	               	</dd>
               	               	<dd >
                	<a onclick="changeloc('南京')" id="南京">南京</a> 
                	                	|
                	               	</dd>
               	               	<dd  class="more" >
                	<a href="javascript:;" >其他</a> 
                	                	<div class="triangle citymore_arrow"></div>
                	               	</dd>
               	                <dd id="box_expectCity" class="searchlist_expectCity dn">
	            	<span class="bot"></span>
	            	<span class="top"></span>
		    				    						    			    						    		<dl>
			    			<dt>ABCDEF</dt>
			    			<dd>
			     						     				<span onclick="changeloc('北京')">北京</span>
			     						     				<span onclick="changeloc('长春')">长春</span>
			     						     				<span onclick="changeloc('成都')">成都</span>
			     						     				<span onclick="changeloc('重庆')">重庆</span>
			     						     				<span onclick="changeloc('长沙')">长沙</span>
			     						     				<span onclick="changeloc('常州')">常州</span>
			     						     				<span onclick="changeloc('东莞')">东莞</span>
			     						     				<span onclick="changeloc('大连')">大连</span>
			     						     				<span onclick="changeloc('佛山')">佛山</span>
			     						     				<span onclick="changeloc('福州')">福州</span>
			     						    			</dd>
			    	  	</dl>
			    	  				    			    						    		<dl>
			    			<dt>GHIJ</dt>
			    			<dd>
			     						     				<span onclick="changeloc('贵阳')">贵阳</span>
			     						     				<span onclick="changeloc('广州')">广州</span>
			     						     				<span onclick="changeloc('哈尔滨')">哈尔滨</span>
			     						     				<span onclick="changeloc('合肥')">合肥</span>
			     						     				<span onclick="changeloc('海口')">海口</span>
			     						     				<span onclick="changeloc('杭州')">杭州</span>
			     						     				<span onclick="changeloc('惠州')">惠州</span>
			     						     				<span onclick="changeloc('金华')">金华</span>
			     						     				<span onclick="changeloc('济南')">济南</span>
			     						     				<span onclick="changeloc('嘉兴')">嘉兴</span>
			     						    			</dd>
			    	  	</dl>
			    	  				    			    						    		<dl>
			    			<dt>KLMN</dt>
			    			<dd>
			     						     				<span onclick="changeloc('昆明')">昆明</span>
			     						     				<span onclick="changeloc('廊坊')">廊坊</span>
			     						     				<span onclick="changeloc('宁波')">宁波</span>
			     						     				<span onclick="changeloc('南昌')">南昌</span>
			     						     				<span onclick="changeloc('南京')">南京</span>
			     						     				<span onclick="changeloc('南宁')">南宁</span>
			     						     				<span onclick="changeloc('南通')">南通</span>
			     						    			</dd>
			    	  	</dl>
			    	  				    			    						    		<dl>
			    			<dt>OPQR</dt>
			    			<dd>
			     						     				<span onclick="changeloc('青岛')">青岛</span>
			     						     				<span onclick="changeloc('泉州')">泉州</span>
			     						    			</dd>
			    	  	</dl>
			    	  				    			    						    		<dl>
			    			<dt>STUV</dt>
			    			<dd>
			     						     				<span onclick="changeloc('上海')">上海</span>
			     						     				<span onclick="changeloc('石家庄')">石家庄</span>
			     						     				<span onclick="changeloc('绍兴')">绍兴</span>
			     						     				<span onclick="changeloc('沈阳')">沈阳</span>
			     						     				<span onclick="changeloc('深圳')">深圳</span>
			     						     				<span onclick="changeloc('苏州')">苏州</span>
			     						     				<span onclick="changeloc('天津')">天津</span>
			     						     				<span onclick="changeloc('太原')">太原</span>
			     						     				<span onclick="changeloc('台州')">台州</span>
			     						    			</dd>
			    	  	</dl>
			    	  				    			    						    		<dl>
			    			<dt>WXYZ</dt>
			    			<dd>
			     						     				<span onclick="changeloc('武汉')">武汉</span>
			     						     				<span onclick="changeloc('无锡')">无锡</span>
			     						     				<span onclick="changeloc('温州')">温州</span>
			     						     				<span onclick="changeloc('西安')">西安</span>
			     						     				<span onclick="changeloc('厦门')">厦门</span>
			     						     				<span onclick="changeloc('烟台')">烟台</span>
			     						     				<span onclick="changeloc('珠海')">珠海</span>
			     						     				<span onclick="changeloc('中山')">中山</span>
			     						     				<span onclick="changeloc('郑州')">郑州</span>
			     						    			</dd>
			    	  	</dl>
			    	  				    				    </dd>  
            </dl>
<%} %>

            <div id="hotList">
	            <ul class="hot_pos reset">
	            <li class="clearfix">
			                        	<a>很抱歉，未能找到更多的职位信息。</a> 
			                    
			              </li>
	           
	                		                	                
	                	               
	                	            </ul>
            </div>
            <div class="Pagination myself">
	          <a onclick="first()">首页</a>
	          <a onclick="upon()">上一页</a>
	          <a onclick="next()">下一页 </a>
	          </div>     
            <div class="clear"></div>
        </div>	
 	    <input type="hidden" value="" name="userid" id="userid" />
 	    </form>
 		<!-- <div id="qrSide"><a></a></div> -->
<!--  -->


<!------------------------------------- end ----------------------------------------->
<script type="text/javascript" src="style/js/Chart.min.js"></script>
<script type="text/javascript" src="style/js/home.min.js"></script>
<script type="text/javascript" src="style/js/count.js"></script>
			<div class="clear"></div>
			<input type="hidden" id="resubmitToken" value="" />
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

<!-- <script src="style/js/wb.js" type="text/javascript" charset="utf-8"></script>
 -->

</body>
</html>	