<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%  if (request.getAttribute("info") == null ) 
    {%><jsp:forward page="getAd.do" ></jsp:forward><%  
    }%>
<!DOCTYPE HTML>
<html>
<head>
<script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate" media="handheld"  />
<!-- end cloud adapter -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>HEU</title>
<meta property="qc:admins" content="23635710066417756375" />
<meta content="HEUJOB" name="description">
<meta content="recruitment" name="keywords">
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
<script type="text/javascript">
var youdao_conv_id = 271546; 
var req = false;
function createRequest(){  		
	if (window.XMLHttpRequest) {
     req = new XMLHttpRequest();
 }else if (window.ActiveXObject) {
     req = new ActiveXObject("Microsoft.XMLHTTP");
 }
 if(!req){
 	alert("Error Initializing XMLHttpRequest!");
 }
}
function test(String){
	document.getElementById("titlesss").value = String;
	document.getElementById("sidess").submit();
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
    		<%String status =(String)session.getAttribute("status");
if(status==null){%>
    		<ul class="reset" id="navheader">
    			<li class="current"><a href="index.jsp">Home</a></li>
    			<li ><a href="positionshow.do">Find Jobs</a></li>
	    	</ul><%}else if(status.compareTo("student")==0){%>
	    	<ul id="navheader" class="reset">
    			<li class="current"><a href="indexshow.do">Home</a></li>
    			<li><a href="positionshow.do">Find Jobs</a></li>
                <li><a rel="nofollow" href="jianli.do?name=${sessionScope.username}">My CV</a></li>
	    						    		</ul>
        	<%}else if(status.compareTo("hr")==0){ %>
        	<ul id="navheader" class="reset">
    			<li><a href="myhome.do?name=${sessionScope.username}">Company Page</a></li>
    			<li><a rel="nofollow" href="create.do?name=${sessionScope.username}">Post Job</a></li>
                <li><a href="positions.do?name=${sessionScope.username}">Recruitment</a></li>
	    	</ul>><%} %>
        	
        	            
<%String name =(String)session.getAttribute("username") ;
if(name==null){%>
<ul class="loginTop">
	<li><a href="stu_login.jsp" rel="nofollow">I am a Student</a></li> 
            	<li>|</li>
            	<li><a href="hr_login.jsp" rel="nofollow">I am a HR</a></li>
            	</ul>
	<%}else if(status.compareTo("student")==0){%>
	<dl class="collapsible_menu">
            	<dt>
           			<span>${sessionScope.username}&nbsp;</span> 
            		<span class="red dn" id="noticeDot-0"></span>
            		<i></i>
            	</dt>
                                	<dd><a rel="nofollow" href="jianli.do?name=${sessionScope.username}">My CV</a></dd>
                                    <dd><a rel="nofollow" href="showdelivery.do?name=${sessionScope.username}">My Applications</a></dd>
                                         <dd><a href="enroll.do?name=${sessionScope.username}">My Career</a></dd>
                                            <dd><a href="stu_updatePwd.jsp">Settings</a></dd>
                                <dd class="logout"><a rel="nofollow" href="cancel.do">Sign Out</a></dd>
            </dl>
	
	
	<%}else if(status.compareTo("hr")==0){%>
	<dl class="collapsible_menu">
            	<dt>
           			<span>${sessionScope.username}&nbsp;</span> 
            		<span class="red dn" id="noticeDot-1"></span>
            		<i></i>
            	</dt>
                                	<dd><a href="positions.do?name=${sessionScope.username}">Job Postings</a></dd>
                	<dd><a href="showRecRes.do?name=${sessionScope.username}">Received Resumes</a></dd>
                	<dd class="btm"><a href="myhome.do?name=${sessionScope.username}">Company Info</a></dd>
                                                <dd><a href="hr_updatePwd.jsp">Settings</a></dd>
                                <dd class="logout"><a rel="nofollow" href="cancel.do">Sign Out</a></dd>
            </dl>
            <%} %>
            
            
                                </div>
    </div><!-- end #header -->
    <div id="container">
        <form id="sidess" action="selectPos.do" method="post">			
        <input type="hidden" id="titlesss" name="titlesss" value="">
		<div id="sidebar">
			<div class="mainNavs">
						
									<div class="menu_box">
						<div class="menu_main">
							<h2>Technical <span></span></h2>
				<a onclick="test('Java')">Java</a>
				<a onclick="test('PHP')">PHP</a>
				<a onclick="test('C')">C</a>
				<a onclick="test('C++')">C++</a>
				<a onclick="test('Android')">Android</a>
				<a onclick="test('iOS')">iOS</a>
				<a onclick="test('Frontend')">Frontend Developer</a>
				<a onclick="test('tester')">Software Tester</a>
				
				<a onclick="test('architect')">Enterprise Architect</a>
			</div>
					   	<div class="menu_sub dn">
					   								    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('backend')">
			Backend</a>
					        		</dt>
						        	<dd>
								   	<a onclick="test('Java')"
class="curr">Java</a>
									   	<a onclick="test('C++')">C++</a>
							            										   	<a onclick="test('PHP')"										   			class="curr"
									            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>PHP</a>
							            										   	<a onclick="test('data mining')"
>data mining</a>
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
					        			<a onclick="test('mobile')">
		                   						Mobile
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
					        			<a onclick="test('frontend')">
			  							        				Frontend
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('web')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Web</a>
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
					        			<a onclick="test('test')">
						            							Test
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a  onclick="test('software tester')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Software Tester</a>
							            										   	<a  onclick="test('test analyst')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Test Analyst</a>
							            										   	<a onclick="test('system tester')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>System Tester</a>
							            										   	<a  onclick="test('qa tester')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>QA tester</a>
							            										   	<a  onclick="test('Penetration Tester')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Penetration Tester</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a  onclick="test('Operation')">
			   							Operation
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a  onclick="test('Operation engineer')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Operation Engineer</a>
							            										   	<a  onclick="test('Customer Operation')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Customer Operation</a>
							            										   	<a  onclick="test('Sales Operation')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Sales Operation</a>
							            										   	<a  onclick="test('Network Operation')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Network Operation</a>
							            										   	<a  onclick="test('IT')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>IT Support</a>
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
					        			<a onclick="test('manage')">
				            		 				Manager
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('Office Manager')"
										   	  										            										            											            										            										   		
										   	>Office Manager</a>
										   	<a onclick="test('Account Manager')"
										   	  										            										            											            										            										   		
										   	>Account Manager</a>
										   	<a onclick="test('Market Manager')"
										   	  										            										            											            										            										   		
										   	>Market Manager</a>
										   	<a onclick="test('Finance Manager')"
										   	  										            										            											            										            										   		
										   	>Finance Manager</a>
										   	<a onclick="test('Product Manager')"
										   	  										            										            											            										            										   		
										   	>Product Manager</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('senior')">
				  					        				Senior
					        			</a>
					        		</dt>
						        	<dd>
							        											   	
							            										   	<a onclick="test('Chief Operation Officer')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Chief Operation Officer</a>
							            										   	<a  onclick="test('Chief Scientist')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Chief Scientist</a>
							            										   	<a  onclick="test('Architect')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            			class="curr"
									            											            										            										   		
										   	>Architect</a>
							            										   	<a  onclick="test('CTO')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>CTO</a>
							            										   	<a  onclick="test('Chief Executive')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Chief Executive</a>
							            							        </dd>
					        	</dl>
													</div>
					</div>
									<div class="menu_box">
						<div class="menu_main">
							<h2>Product <span></span></h2>
											            					            		<a onclick="test('Product Manager')">Product Manager</a>
				            					            		<a onclick="test('Product Assistant')">Product Assistant</a>
				            					            		<a  onclick="test('Wireless')">Wireless</a>
				            					            		
				            					            					   	</div>
					   	<div class="menu_sub dn">
					   								    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('Product Manager')">
								         	Product Manager
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a  onclick="test('Product Manager')"
										   		
										   		 									            										            											            			class="curr"
									            											            										            											            										            											            										            											            										            										   		
										   	>Product Manager</a>
							            										   	<a  onclick="test('Web Product Manager')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>Web Product Manager</a>
							            										   	<a  onclick="test('Mobile Product Manager')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>Mobile Product Manager</a>
							            										   	<a  onclick="test('Product Assistant')"
										   		
										   		 									            										            											            										            											            			class="curr"
									            											            										            											            										            											            										            										   		
										   	>Product Assistant</a>
							            										   	<a  onclick="test('Data Product Manager')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>Data Product Manager</a>
							            										   	<a  onclick="test('Online Retailer Manager')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>Online Retailer Manager</a>
							            										   	<a  onclick="test('Game Advisor')"
										   		
										   		 									            										            											            										            											            										            											            										            											            			class="curr"
									            											            										            										   		
										   	>Game Advisor</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a  onclick="test('Design')">
					 			    			Design
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a  onclick="test('Web Designer')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>Web Designer</a>
							            										   	<a  onclick="test('Wireless Designer')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>Wireless Designer</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('Senior')">
								            Senior
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('Product Manager')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>Product Manager</a>
							            										   	<a  onclick="test('Product Officer')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>Product Officer</a>
							            							        </dd>
					        	</dl>
													</div>
					</div>
									<div class="menu_box">
						<div class="menu_main">
							<h2>Design <span></span></h2>
											            					            		<a onclick="test('UI')">UI</a>
				            					            		<a onclick="test('UE')">UE</a>
				            					            		<a onclick="test('Designer')">Designer</a>
				            					            		<a  onclick="test('Graphic Design')">Graphic Design</a>
				            					            		<a onclick="test('Interior Design')">Interior Design</a>
				            					            					   	</div>
					   	<div class="menu_sub dn">
					   								    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('Vision Design')">
     								   	     				Vision Design
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('Graphic Design')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Graphic Design</a>
							            										   	<a  onclick="test('Web Design')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Web Design</a>
							            										   	<a  onclick="test('Flash')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Flash</a>
							            										   	<a  onclick="test('APP Design')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>APP Design</a>
							            										   	<a  onclick="test('UI')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>UI</a>
							            										   	<a  onclick="test('Art Design')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Art Design</a>
							            										   	<a onclick="test('Ad Design')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Ad Design</a>
							            										   	<a  onclick="test('multi-media')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Multi-media</a>
							            										   	<a  onclick="test('Game Design')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Game Design</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('Interact')">
									          	Interact
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('Interaction')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>ID</a>
							            										   	<a onclick="test('Wireless ID')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Wireless ID</a>
							            										   	<a onclick="test('Web ID')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Web ID</a>
							            										   	<a onclick="test('Hardware ID')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Hardware ID</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('Research')">
					          					Research
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('Research Analyst')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Research Analyst</a>
							            										   	<a onclick="test('Market Research')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Market Research</a>
							            										   	<a  onclick="test('Research Fellow')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										            										   		
										   	>Research Fellow</a>
							            							        </dd>
					        	</dl>
													    	
													</div>
					</div>
									<div class="menu_box">
						<div class="menu_main">
							<h2>Operation <span></span></h2>
											            					            		<a  onclick="test('Operation')">Operation</a>
				            					            		<a onclick="test('Editor')">Editor</a>
				            					            					   	</div>
					   	<div class="menu_sub dn">
					   								    	<dl class="reset">
					        							        		<dt>
					        			<a  onclick="test('Operation')">
					      					Operation
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('Customer Operation')"
										   		
										   		 									            										            											            										            											            										            											            										            										   		
										   	>Customer Operation</a>
							            										   	<a onclick="test('Product Operation')"
										   		
										   		 									            										            											            										            											            										            											            										            										   		
										   	>Product Operation</a>
							            										   	<a onclick="test('Data Operation')"
										   		
										   		 									            										            											            										            											            										            											            										            										   		
										   	>Data Operation</a>
							            										   	<a  onclick="test('Content Operation')"
										   		
										   		 									            										            											            										            											            										            											            										            										   		
										   	>Content Operation</a>
							            										   	<a  onclick="test('Game Operation')"
										   		
										   		 									            										            											            										            											            			class="curr"
									            											            										            											            										            										   		
										   	>Game Operation</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a  onclick="test('Editor')">
		           		    				Editor
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('Deputy Editor')"
										   		
										   		 									            										            											            										            											            										            											            										            										   		
										   	>Deputy Editor</a>
							            										   	<a  onclick="test('Content Editor')"
										   		
										   		 									            										            											            										            											            										            											            										            										   		
										   	>Content Editor</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a  onclick="test('Consultant')">
		 	    				Consultant
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('Pre Sale')"
										   		
										   		 									            										            											            										            											            										            											            										            										   		
										   	>Pre-Sale</a>
							            										   	<a  onclick="test('After Sale')"
										   		
										   		 									            										            											            										            											            										            											            										            										   		
										   	>After-Sale</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('Senior')">
					        				Senior
					        			</a>
					        		</dt>
						        	<dd>
							            										   	<a  onclick="test('COO')"
										   		
										   		 									            										            											            										            											            										            											            										            										   		
										   	>COO</a>
							            							        </dd>
					        	</dl>
													</div>
					</div>
									<div class="menu_box">
						<div class="menu_main">
							<h2>Market <span></span></h2>
											            					            		<a  onclick="test('Market Promotion')">Market Promotion</a>
				            					            		<a onclick="test('Sales Director')">Sales Director</a>
				            					            		<a onclick="test('BD')">BD</a>
				            					            					   	</div>
					   	<div class="menu_sub dn">
					   								    	<dl class="reset">
					        							        		<dt>
					        			<a  onclick="test('Sale')">
					 		Sales
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('Sales Associate')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>Sales Associate</a>
							            										   	<a onclick="test('Sales Executive')"
										   		
										   		 									            										            											            										            											            			class="curr"
									            											            										            											            										            											            										            											            										           											   		
										   	>Sales Executive</a>
							            										   	<a onclick="test('Sales Advisor')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>Sales Advisor</a>
							            										   	<a onclick="test('Market Promotion')"
										   		
										   		 									            										            											            			class="curr"
									            											            										            											            										            											            										            											            										            											            										           											   		
										   	>Market Promotion</a>
							            										   	<a onclick="test('SEO')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>SEO</a>
							            										   	<a onclick="test('SEM')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>SEM</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('Public')">
							   		Public
					        			</a>
					        		</dt>
						        	<dd>
							            										   	<a  onclick="test('Ad Associate')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>Ad Associate</a>
							            										   	<a onclick="test('Brand Public Relations')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            											            										           											   		
										   	>Brand Public Relations</a>
							            							        </dd>
					        	</dl>
													    	
					        			
													</div>
					</div>
									<div class="menu_box">
						<div class="menu_main">
							<h2>Function <span></span></h2>
											            					            		<a  onclick="test('HR')">HR</a>
				            					            		<a onclick="test('Accountant')">Accountant</a>
				            					            					   	</div>
					   	<div class="menu_sub dn">
					   								    	<dl class="reset">
					        							        		<dt>
					        			<a  onclick="test('Human Resource')">
					          				HR
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('Human Resource')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>Human Resource</a>
							            										   	<a onclick="test('Recruitment')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>Recruitment</a>
							            										   	<a  onclick="test('HRBP')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>HRBP</a>
							            										   	<a onclick="test('Human Affairs')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>Human Affairs</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('Executive')">
					        	        				Executive
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('Assistant')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>Assistant</a>
							            										   	<a onclick="test('Reception')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>Reception</a>
							            										   	<a  onclick="test('Law')"
										   		
										   		 									            										            											            										            											            										            											            										            											            										            										   		
										   	>Law</a>
							            										   	<a  onclick="test('Executive')"
										   		
										   		 									            										            											            										            											            			class="curr"
									            											            										            											            										            											            										            										   		
										   	>Executive</a>
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('Finance')">
					           				Finance
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a  onclick="test('Accountant')" class="curr">Accountant</a>							            										   
							        											   		<a  onclick="test('Finance')"class="curr">Finance</a>	
							            							        </dd>
					        	</dl>
													    	<dl class="reset">
					        							        		<dt>
					        			<a onclick="test('Senior')">
				Senior
					        			</a>
					        		</dt>
						        	<dd>
							        											   	<a onclick="test('Executive Officer')"
>Executive Officer</a>
							            										   	<a  onclick="test('Finance Officer')"
		   		
										   	>Finance Officer</a>
							            										   	<a  onclick="test('HRD/HRM')">HRD/HRM</a>					            										   
							            										   		<a  onclick="test('CFO')">CFO</a>							   							        </dd>
					        	</dl>												</div>
					</div>
							</div>			
		</div>
		</form>
		<form id="searchForms" action="selectPoss.do" method="post">
        <div class="content">	
	        			<div id="search_box">
		
         <ul id="searchType">
        	        	<li data-searchtype="1" class="type_selected">Job</li>
        	<li data-searchtype="4">Firm</li>
        	        </ul>
        <div class="searchtype_arrow"></div>
        <input type="text" id="search_input" name = "search_input"  tabindex="1" value=""  placeholder="Search Jobs by Titles, Keywords"  />
        <input type="hidden" name="yx" id="yxInput" value=""/>
        <input type="hidden" name="gx" id="gxInput" value="" />
        <input type="hidden" name="st" id="stInput" value="" />
        <input type="hidden" name="labelWords" id="labelWords" value="" />
        <input type="hidden" name="lc" id="lc" value="" />
        <input type="hidden" name="workAddress" id="workAddress" value=""/>
                <input type="hidden" name="city" id="cityInput" value=""/>
                <input type="submit" id="search_button" value="Search"/>
				
    
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
</dl>			


			<div id="home_banner">
	            <ul class="banner_bg">
	            <c:forEach items="${AdList}" var="temp">
	            		                <li  class="banner_bg_1 current" >
	                    <a href="stu_showcom.do?h_email=${temp.fa_h_email}" target="_blank"><img src="${temp.fa_image}" width="612" height="160" alt="${temp.fa_name}" /></a>
	                </li>
	                </c:forEach>
	                	            </ul>
	            <div class="banner_control">
	                <em></em> 
	                <ul class="thumbs">
	                <c:forEach items="${AdList}" var="temp">
	                		                    <li  class="${temp.fa_class}" >
	                        <i></i>
	                        <img src="${temp.fa_image2}" width="113" height="42" />
	                    </li>
	                    </c:forEach>
	                    	                    
	                    	                </ul>
	            </div>
	        </div><!--/#main_banner-->
        	<ul id="da-thumbs" class="da-thumbs">
	        		        		<c:forEach items="${BADList}" var="tempa">
	        		        		<li class="${tempa.ba_class}">
	                    <a href="stu_showcom.do?h_email=${tempa.ba_h_email}" target="_blank">
	                        <img src="${tempa.ba_image}" width="113" height="113" alt="${tempa.ba_name}" />
	                        <div class="hot_info">
	                        	<h2 title="${tempa.ba_name}">${tempa.ba_name}</h2>
	                            <em></em>
	                            <p title="${tempa.ba_descr}">
	                            	${tempa.ba_descr}
	                            </p>
	                        </div>
	                    </a>
	                </li>
	                </c:forEach> 
                	        		
                            </ul>
            
            
            
            
            <div class="clear"></div>
			<div id="linkbox">
			    <dl>
			        <dt>友情推荐</dt><%if(status==null) {%>
			         <dd>
			         <a href="#loginPop" class="bar_login inline" title="登录">登录后可查看</a>
			         </dd><%}else{ %>
			        
			        <dd><span>|</span>
			        <c:forEach items="${RecommendList}" var="temp">
			        <a href="${temp.rec_link}" target="_blank">${temp.rec_title}</a> <span>|</span>
			        </c:forEach>
			        </dd><%} %>
			    </dl>
			</div>
			<div id="linkbox"><dl>
			    <dt>就业资讯</dt><%if(status==null) {%>
			    <dd>
			         <a href="#loginPop" class="bar_login inline" title="登录">登录后可查看</a>
			         </dd><%}else{ %>
			        <dd><span>|</span>
			         <c:forEach items="${InformationList}" var="temp1">
			       <a href="${temp1.in_link}" target="_blank">${temp1.in_title}</a> <span>|</span>
			        		</c:forEach>
			        </dd><%} %>
			        </dl></div>
        </div>	
        </form>

<!-------------------------------------弹窗lightbox  ----------------------------------------->
<div style="display:none;">

	<!-- 登录框 -->
	<div id="loginPop" class="popup" style="height:240px;">
       	<form id="loginForms" action="f_login.do" method="post">
				<input type="text" id="email" name="email" value="" tabindex="1" placeholder="请输入您的学号" />
			  	<input type="password" id="password" name="password" tabindex="2" placeholder="请输入密码" />
			    <a href="reset.jsp" class="fr" target="_blank">忘记密码？</a>
				<input type="submit" id="submitLogin" value="登 &nbsp; &nbsp; 录" />
		</form>
		<div class="login_right">
			<div>还未注册？</div>
                
				<a  href="register.jsp"  class="registor_now" target="_blank">立即注册</a>
		</div>
    </div><!--/#loginPop-->
</div>
 	    <input type="hidden" value="" name="userid" id="userid" />
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