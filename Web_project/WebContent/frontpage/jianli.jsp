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
<title>我的简历</title>
<meta content="23635710066417756375" property="qc:admins">
<meta name="description" content="求职">
<meta content="QIQ6KC1oZ6" name="baidu-site-verification">

<!-- <div class="web_root"  style="display:none">h</div> -->
<script type="text/javascript">
var ctx = "h";
console.log(1);
</script>
<link href="h/images/favicon.ico" rel="Shortcut Icon">
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
<script src="style/js/ajaxCross.json" charset="UTF-8"></script>
<script type="text/javascript">
function benke(){
	document.getElementById("collegeee").value = "本科";
}
function shuoshi(){
	document.getElementById("collegeee").value = "硕士";
}
function boshi(){
	document.getElementById("collegeee").value = "博士";
}
function updatework(){
	document.getElementById("expect_work1").className="expectEdit dn";
	document.getElementById("expect_work2").className="expectEdit";
}
function cityeee(String){
	document.getElementById("cityeee").value = String;
	document.getElementById("expectCity").value = String;
}
function salary(String){
	document.getElementById("salaryeee").value = String;
}

function updateExper(){
	document.getElementById("work_exper1").className="experienceEdit dn";
	document.getElementById("work_exper2").className="experienceEdit";
}

function Cyearstart(String){
	document.getElementById("companyYearStart").value = String;
}

function Cmonthstart(String){
	document.getElementById("companyMonthStart").value = String;
}

function Cyearend(String){
	document.getElementById("companyYearEnd").value = String;
	document.getElementById("CmonthEndss").style.display = "block";
}

function Cyearends(){
	document.getElementById("CmonthEndss").style.display = "none";
	document.getElementById("companyYearEnd").value = "至今";
	document.getElementById("companyMonthEnd").value = "";
}

function Cmonthend(String){
	document.getElementById("companyMonthEnd").value = String;
}

function Pyearstart(String){
	document.getElementById("projectYearStart").value = String;
}

function Pmonthstart(String){
	document.getElementById("projectMonthStart").value = String;
}

function Pyearend(String){
	document.getElementById("projectYearEnd").value = String;
	document.getElementById("PmonthEnd").style.display = "block";
}

function Pyearends(){
	document.getElementById("PmonthEnd").style.display = "none";
	document.getElementById("projectYearEnd").value = "至今";
	document.getElementById("projectMonthEnd").value = "";
}

function Pmonthend(){
	document.getElementById("projectMonthEnd").value = String;
}

function updateProject(){
	document.getElementById("project_exper1").className="projectEdit dn";
	document.getElementById("project_exper2").className="projectEdit";
}

function updateEdu(){
	document.getElementById("educationalEdit1").className="educationalEdit dn";
	document.getElementById("educationalEdit2").className="educationalEdit";
}

function updateDescr(){
	document.getElementById("descr1").className="descriptionEdit dn";
	document.getElementById("descr2").className="descriptionEdit";
}
function ajaxFileUpload(){
	var stu_id = document.getElementById("stu_idss").value;
	//开始上传文件时显示一个图片,文件上传完成将图片隐藏
	//$("#loading").ajaxStart(function(){$(this).show();}).ajaxComplete(function(){$(this).hide();});
	//执行上传文件操作的函数
	$.ajaxFileUpload({
		//处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
		url:'stu_Upload.do?uname='+stu_id,
		secureuri:false,                       //是否启用安全提交,默认为false 
		fileElementId:'myBlogImage',           //文件选择框的id属性
		dataType:'text',                       //服务器返回的格式,可以是json或xml等
		success:function(data, status){        //服务器响应成功时的处理函数
			data = data.replace("<PRE>", '');  //ajaxFileUpload会对服务器响应回来的text内容加上<pre>text</pre>前后缀
			data = data.replace("</PRE>", '');
			data = data.replace("<pre>", '');
			data = data.replace("</pre>", ''); //本例中设定上传文件完毕后,服务端会返回给前台[0`filepath]
			if(data.substring(0, 1) == 0){     //0表示上传成功(后跟上传后的文件路径),1表示失败(后跟失败描述)
				$("img[id='uploadImage']").attr("src", data.substring(2));
				$('#result').html("图片上传成功<br/>");
			}else{
				$('#result').html('图片上传失败asd，请重试！！');
			}
		},
		error:function(data, status, e){ //服务器响应失败时的处理函数
			$('#result').html('图片上传失败sss，请重试！！');
		}
	});
}
function asdasd(){
	document.getElementById("resumeup").submit();
}
</script>


</head>
<body>
<div id="body">
	<div id="header">
    	<div class="wrapper">
    		<a class="logo">
    			<img width="229" height="43" alt="简历" src="style/images/logo.png">
    		</a>
    		<ul id="navheader" class="reset">
    			<li><a href="indexshow.do">首页</a></li>
    			<li><a href="positionshow.do">职位</a></li>
                <li class="current"><a rel="nofollow" href="jianli.do?name=${sessionScope.username}">简历管理</a></li>
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
				<a target="_blank" href="delivery.jsp"><strong>0</strong>条新投递反馈</a>
				<a class="closeNT" href="javascript:;"></a>
            </div>
                    </div>
    </div><!-- end #header -->
    <div id="container">
        
  		<div class="clearfix">
  		<input type="hidden" id="stu_nopp" name="stu_nopp" value="${sessionScope.username}">
            <div class="content_l">
            	<div class="fl" id="resume_name">
	            	<div class="nameShow fl">
	            		<h1 title="jianlili"><% %>${stu_info.stu_jianli_title}</h1>
	            		<span class="rename">重命名</span> | <a target="_blank" href="showresumeView.do?stu_id=${sessionScope.username}">预览</a>
            		</div>
            		<form class="fl dn" id="resumeNameFormss" action="updateRN.do?name=${sessionScope.username}" method="post">
            			<input type="text" value="${stu_info.stu_jianli_title}" name="resumeName" class="nameEdit c9" id="resumeName">	
            			<input type="submit"   value="保存">
            		</form>
            	</div><!--end #resume_name-->
            	<div class="fr c5" id="lastChangedTime">最后一次更新：<span>${date} </span></div><!--end #lastChangedTime-->
            	
            	
            	<%
            	String exp_work =(String)session.getAttribute("exp_work");
            	String stu_work_name =(String)session.getAttribute("stu_work_name");
            	String stu_inter_name =(String)session.getAttribute("stu_inter_name");
            	String stu_undergraduate_name =(String)session.getAttribute("stu_undergraduate_name");
            	String stu_descr =(String)session.getAttribute("stu_descr");
            		            		 %>
            	<div id="resumeScore">
            		<div class="score fl">
            			<canvas height="120" width="120" id="doughnutChartCanvas" style="width: 120px; height: 120px;"></canvas>
           				<div style="" class="scoreVal"><span>${sessionScope.score}</span>分</div>
            		</div>	
            		
            		<div class="which fl">
            			<div>实习经历最能体现自己的工作能力，且完善后可投递简历！</div>
            										<span rel="workExperience"><a>马上去完善</a></span>
						            		</div>
            	</div><!--end #resumeScore-->
                <%/* } */ %>
            	<div class="profile_box" id="basicInfo">
            		<h2>基本信息</h2>
            		<span class="c_edit"></span>
            		<div class="basicShow">
            			            			<span>${stu_info.stu_name} |  ${stu_info.stu_sex} |    ${stu_info.stu_college} |  ${stu_info.stu_workyear}<br>
            			            			${stu_info.stu_tel} | ${stu_info.stu_email}<br>
            			</span>
            			<div class="m_portrait">
	                    	<div></div>
	                    	<img width="120" height="120" alt="jason" src="${stu_info.stu_profile}">
	                    </div>
            		</div><!--end .basicShow-->

            		<div class="basicEdit dn">
            			<form id="profileFormss" action="updatebasic.do?name=${sessionScope.username}" method="post">
						  <table>
						    <tbody><tr>
						      <td valign="top">
						        <span class="redstar">*</span>
						      </td> 
						      <td>
						        <input type="text" placeholder="姓名" value="${stu_info.stu_name}" name="namess" id="namess">
						      </td>
						      <td valign="top"></td> 
						      <td>
						          <ul class="profile_radio clearfix reset">
						            <li class="current">
						           	  	 男<em></em>
						              	<input type="radio" checked="checked" name="genderss" value="男"> 
						            </li>
						            <li>
						            	  女<em></em>
						              	<input type="radio" name="genderss" value="女"> 
						            </li>
						          </ul>  
						      </td>
						    </tr>
						    <tr>
						      <td valign="top">
						        <span class="redstar">*</span>
						      </td> 
						      <td>
						        <input type="button" value="" id="select_topDegree" class="profile_select_190 profile_select_normal">
								<div class="boxUpDown boxUpDown_190 dn" id="box_topDegree" style="display: block;">
						        	<ul>
						        								        			<li onclick="benke()">本科</li>
						        								        			<li onclick="shuoshi()">硕士</li>
						        								        			<li onclick="boshi()">博士</li>
						        	</ul>
						        	<input type="text" id="collegeee" name ="collegeee" style="display:none;">	        	
						        </div>  
						      </td>
						    </tr>
						    <tr>
						      <td valign="top">
						        <span class="redstar">*</span>
						      </td> 
						      <td colspan="3">
						          <input type="text" placeholder="手机号码" value="${stu_info.stu_tel}" name="telss" id="telss">
						      </td>
						   	</tr>
						   	<tr>
						      <td valign="top">
						        <span class="redstar">*</span>
						      </td> 
						      <td colspan="3">
						          <input type="text" placeholder="邮箱" value="${stu_info.stu_email}" name="emailss" id="emailss">
						      </td>
						    </tr>
						    <tr>
						      <td></td> 
						      <td colspan="3">
						          <input type="submit" value="保 存" class="btn_profile_save">
						      </td>
						    </tr>
						  </tbody></table>
						</form><!--end #profileForm-->
						<div class="new_portrait">
						  <div class="portrait_upload" id="portraitNo">
						      <span>上传自己的头像</span>
						  </div>
						  <div class="portraitShow dn" id="portraitShow">
						    <img width="120" height="120" src="${stu_info.stu_profile}" id="uploadImage" alt="头像">
						    <span>更换头像</span>
						  </div>
						  <input type="file" name="myfiles" onchange="ajaxFileUpload()" title="支持jpg、jpeg、gif、png格式，文件小于5M" id="myBlogImage" class="myfiles">
						  	<em>
						                  尺寸：120*120px <br>   
						                  大小：小于5M<br>
						<!--    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <input type="button" value="上传" onclick="ajaxFileUpload()"> -->             
						  	</em>
						  	<span style="display:none;" id="headPic_error" class="error"></span>
						</div><!--end .new_portrait-->
            		</div><!--end .basicEdit-->
            	</div><!--end #basicInfo-->
                <input type="hidden" id="topDegreeVal" value="最高学历">



<!-- 期望工作 -->
            	<div class="profile_box" id="expectJob">
            		<h2>期望工作</h2>
            		            		<%
            		            		if(exp_work.compareTo("期望城市")==0){ %><span class="c_edit dn"></span>
            		<div class="expectShow dn">
            		            			<span></span>
            		</div><!--end .expectShow-->
            		<div class="expectEdit dn">
            			<form id="expectFormss" action="updateExps.do?name=${sessionScope.username}" method="post">
	            			<table>
	            				<tbody><tr>
	            				
	            					<td>
	            						<input type="hidden" id="expectCity" value="" name="expectCity">
	            													        	<input type="button" value="选择期望城市，如：北京" id="select_expectCity" class="profile_select_287 profile_select_normal" name="select_expectCityss">
																				<div class="boxUpDown boxUpDown_596 dn" id="box_expectCity" style="display: none;">
								          									        		<dl>
								        			<dt>热门城市</dt>
								        			<dd>
									        												        				<span onclick="cityeee('北京')">北京</span>
									        												        				<span onclick="cityeee('上海')">上海</span>
									        												        				<span onclick="cityeee('广州')">广州</span>
									        												        				<span onclick="cityeee('深圳')">深圳</span>
									        												        				<span onclick="cityeee('成都')">成都</span>
									        												        				<span onclick="cityeee('杭州')">杭州</span>
									        											        			</dd>
								        	  	</dl>
								        									        		<dl>
								        			<dt>ABCDEF</dt>
								        			<dd>
									        												        				<span onclick="cityeee('北京')">北京</span>
									        												        				<span onclick="cityeee('长春')">长春</span>
									        												        				<span onclick="cityeee('成都')">成都</span>
									        												        				<span onclick="cityeee('重庆')">重庆</span>
									        												        				<span onclick="cityeee('长沙')">长沙</span>
									        												        				<span onclick="cityeee('常州')">常州</span>
									        												        				<span onclick="cityeee('东莞')">东莞</span>
									        												        				<span onclick="cityeee('大连')">大连</span>
									        												        				<span onclick="cityeee('佛山')">佛山</span>
									        												        				<span onclick="cityeee('福州')">福州</span>
									        											        			</dd>
								        	  	</dl>
								        									        		<dl>
								        			<dt>GHIJ</dt>
								        			<dd>
									        												        				<span onclick="cityeee('贵阳')">贵阳</span>
									        												        				<span onclick="cityeee('广州')">广州</span>
									        												        				<span onclick="cityeee('哈尔滨')">哈尔滨</span>
									        												        				<span onclick="cityeee('合肥')">合肥</span>
									        												        				<span onclick="cityeee('海口')">海口</span>
									        												        				<span onclick="cityeee('杭州')">杭州</span>
									        												        				<span onclick="cityeee('惠州')">惠州</span>
									        												        				<span onclick="cityeee('金华')">金华</span>
									        												        				<span onclick="cityeee('济南')">济南</span>
									        												        				<span onclick="cityeee('嘉兴')">嘉兴</span>
									        											        			</dd>
								        	  	</dl>
								        									        		<dl>
								        			<dt>KLMN</dt>
								        			<dd>
									        												        				<span onclick="cityeee('昆明')">昆明</span>
									        												        				<span onclick="cityeee('廊坊')">廊坊</span>
									        												        				<span onclick="cityeee('宁波')">宁波</span>
									        												        				<span onclick="cityeee('南昌')">南昌</span>
									        												        				<span onclick="cityeee('南京')">南京</span>
									        												        				<span onclick="cityeee('南宁')">南宁</span>
									        												        				<span onclick="cityeee('南通')">南通</span>
									        											        			</dd>
								        	  	</dl>
								        									        		<dl>
								        			<dt>OPQR</dt>
								        			<dd>
									        												        				<span onclick="cityeee('青岛')">青岛</span>
									        												        				<span onclick="cityeee('泉州')">泉州</span>
									        											        			</dd>
								        	  	</dl>
								        									        		<dl>
								        			<dt>STUV</dt>
								        			<dd>
									        												        				<span onclick="cityeee('上海')">上海</span>
									        												        				<span onclick="cityeee('石家庄')">石家庄</span>
									        												        				<span onclick="cityeee('绍兴')">绍兴</span>
									        												        				<span onclick="cityeee('沈阳')">沈阳</span>
									        												        				<span onclick="cityeee('深圳')">深圳</span>
									        												        				<span onclick="cityeee('苏州')">苏州</span>
									        												        				<span onclick="cityeee('天津')">天津</span>
									        												        				<span onclick="cityeee('太原')">太原</span>
									        												        				<span onclick="cityeee('台州')">台州</span>
									        											        			</dd>
								        	  	</dl>
								        									        		<dl>
								        			<dt>WXYZ</dt>
								        			<dd>
									        												        				<span onclick="cityeee('武汉')">武汉</span>
									        												        				<span onclick="cityeee('无锡')">无锡</span>
									        												        				<span onclick="cityeee('温州')">温州</span>
									        												        				<span onclick="cityeee('西安')">西安</span>
									        												        				<span onclick="cityeee('厦门')">厦门</span>
									        												        				<span onclick="cityeee('烟台')">烟台</span>
									        												        				<span onclick="cityeee('珠海')">珠海</span>
									        												        				<span onclick="cityeee('中山')">中山</span>
									        												        				<span onclick="cityeee('郑州')">郑州</span>
									        											        			</dd>
								        	  	</dl>
								        									        </div>  
								        									        <input type="text" id="cityeee" name ="cityeee" style="display:none;">	
	            					</td>
	            					<td>
	            						<ul class="profile_radio clearfix reset">
	            								            								<li class="current">
									             	 全职<em></em>
									              	<input type="radio" checked="checked" name="type" value="全职"> 
									            </li>
									            <li>
									              	兼职<em></em>
									              	<input type="radio" name="type" value="兼职"> 
									            </li>
									            <li>
									            	  实习<em></em>
									              	<input type="radio" name="type" value="实习"> 
									            </li>
								            								        </ul> 
	            					</td>
	            				</tr>
	            				<tr>
	            					<td>
							        	<input type="text" placeholder="期望职位，如：产品经理" value="" name="expectPosition" id="expectPosition">
									</td>
	            					<td>
	            						<input type="hidden" id="expectSalary" value="" name="expectSalary">
	            							            						<input type="button" value="期望月薪" id="select_expectSalary" class="profile_select_287 profile_select_normal">
	            													        	<div class="boxUpDown boxUpDown_287 dn" id="box_expectSalary" style="display: none;">
								          	  <ul>
								        										        			<li onclick="salary('2k以下')">2k以下</li>
								        										        			<li onclick="salary('2k-5k')">2k-5k</li>
								        										        			<li onclick="salary('5k-10k')">5k-10k</li>
								        										        			<li onclick="salary('10k-15k')">10k-15k</li>
								        										        			<li onclick="salary('15k-25k')">15k-25k</li>
								        										        			<li onclick="salary('25k-50k')">25k-50k</li>
								        										        			<li onclick="salary('50k以上')">50k以上</li>
								        										        	  </ul>
								        										        	  <input type="text" id="salaryeee" name ="salaryeee" style="display:none;">
								         </div>  
	            					</td>
	            				</tr>
	            				<tr>
	            					<td colspan="2">
										<input type="submit" value="保 存" class="btn_profile_save">
	            					</td>
	            				</tr>
	            			</tbody></table>
            			</form><!--end #expectForm-->
            		</div><!--end .expectEdit-->
            		            		<div class="expectAdd pAdd">
            		            			填写准确的期望工作能大大提高求职成功率哦…<br>
						快来添加期望工作吧！
						<span>添加期望工作</span>
            		</div><!--end .expectAdd-->
            		
            		<input type="hidden" id="expectJobVal" value="">
            		<input type="hidden" id="expectCityVal" value="">
            		<input type="hidden" id="typeVal" value="">
            		<input type="hidden" id="expectPositionVal" value="">
            		<input type="hidden" id="expectSalaryVal" value="">
            		<%}else{ %>
            		<div id="expect_work1">
            			<form id="expectFormss">
	            			<table>
	            				<tbody><tr>
	            					<td>
	            						期望城市 :${stu_info.stu_exp_city}
	            					</td>
	            					<td>
	            					    ${stu_info.stu_exp_type}
	            					</td>
	            				</tr>
	            				<tr>
	            					<td>
							        	期望职位:${stu_info.stu_exp_pos}
									</td>
	            					<td>
	            						期望月薪:${stu_info.stu_exp_salary}
	            					</td>
	            				</tr>
	            				<tr>
	            				<td><input type="button" value="更改" onclick="updatework()"></td>
	            				</tr>
	            			</tbody></table>
            			</form><!--end #expectForm-->
            		</div><!--end .expectEdit-->
            		<div id="expect_work2" class="expectEdit dn">
            			<form id="expectFormss" action="updateExp.do?name=${sessionScope.username}" method="post">
	            			<table>
	            				<tbody><tr>
	            					<td>
	            						<input type="hidden" id="expectCity" value="" name="expectCity">
	            													        	<input type="button" value="选择期望城市，如：北京" id="select_expectCity" class="profile_select_287 profile_select_normal">
																				<div class="boxUpDown boxUpDown_596 dn" id="box_expectCity" style="display: none;">
								          									        		<dl>
								        			<dt>热门城市</dt>
								        			<dd>
									        												        				<span onclick="cityeee('北京')">北京</span>
									        												        				<span onclick="cityeee('上海')">上海</span>
									        												        				<span onclick="cityeee('广州')">广州</span>
									        												        				<span onclick="cityeee('深圳')">深圳</span>
									        												        				<span onclick="cityeee('成都')">成都</span>
									        												        				<span onclick="cityeee('杭州')">杭州</span>
									        											        			</dd>
								        	  	</dl>
								        									        		<dl>
								        			<dt>ABCDEF</dt>
								        			<dd>
									        												        				<span onclick="cityeee('北京')">北京</span>
									        												        				<span onclick="cityeee('长春')">长春</span>
									        												        				<span onclick="cityeee('成都')">成都</span>
									        												        				<span onclick="cityeee('重庆')">重庆</span>
									        												        				<span onclick="cityeee('长沙')">长沙</span>
									        												        				<span onclick="cityeee('常州')">常州</span>
									        												        				<span onclick="cityeee('东莞')">东莞</span>
									        												        				<span onclick="cityeee('大连')">大连</span>
									        												        				<span onclick="cityeee('佛山')">佛山</span>
									        												        				<span onclick="cityeee('福州')">福州</span>
									        											        			</dd>
								        	  	</dl>
								        									        		<dl>
								        			<dt>GHIJ</dt>
								        			<dd>
									        												        				<span onclick="cityeee('贵阳')">贵阳</span>
									        												        				<span onclick="cityeee('广州')">广州</span>
									        												        				<span onclick="cityeee('哈尔滨')">哈尔滨</span>
									        												        				<span onclick="cityeee('合肥')">合肥</span>
									        												        				<span onclick="cityeee('海口')">海口</span>
									        												        				<span onclick="cityeee('杭州')">杭州</span>
									        												        				<span onclick="cityeee('惠州')">惠州</span>
									        												        				<span onclick="cityeee('金华')">金华</span>
									        												        				<span onclick="cityeee('济南')">济南</span>
									        												        				<span onclick="cityeee('嘉兴')">嘉兴</span>
									        											        			</dd>
								        	  	</dl>
								        									        		<dl>
								        			<dt>KLMN</dt>
								        			<dd>
									        												        				<span onclick="cityeee('昆明')">昆明</span>
									        												        				<span onclick="cityeee('廊坊')">廊坊</span>
									        												        				<span onclick="cityeee('宁波')">宁波</span>
									        												        				<span onclick="cityeee('南昌')">南昌</span>
									        												        				<span onclick="cityeee('南京')">南京</span>
									        												        				<span onclick="cityeee('南宁')">南宁</span>
									        												        				<span onclick="cityeee('南通')">南通</span>
									        											        			</dd>
								        	  	</dl>
								        									        		<dl>
								        			<dt>OPQR</dt>
								        			<dd>
									        												        				<span onclick="cityeee('青岛')">青岛</span>
									        												        				<span onclick="cityeee('泉州')">泉州</span>
									        											        			</dd>
								        	  	</dl>
								        									        		<dl>
								        			<dt>STUV</dt>
								        			<dd>
									        												        				<span onclick="cityeee('上海')">上海</span>
									        												        				<span onclick="cityeee('石家庄')">石家庄</span>
									        												        				<span onclick="cityeee('绍兴')">绍兴</span>
									        												        				<span onclick="cityeee('沈阳')">沈阳</span>
									        												        				<span onclick="cityeee('深圳')">深圳</span>
									        												        				<span onclick="cityeee('苏州')">苏州</span>
									        												        				<span onclick="cityeee('天津')">天津</span>
									        												        				<span onclick="cityeee('太原')">太原</span>
									        												        				<span onclick="cityeee('台州')">台州</span>
									        											        			</dd>
								        	  	</dl>
								        									        		<dl>
								        			<dt>WXYZ</dt>
								        			<dd>
									        												        				<span onclick="cityeee('武汉')">武汉</span>
									        												        				<span onclick="cityeee('无锡')">无锡</span>
									        												        				<span onclick="cityeee('温州')">温州</span>
									        												        				<span onclick="cityeee('西安')">西安</span>
									        												        				<span onclick="cityeee('厦门')">厦门</span>
									        												        				<span onclick="cityeee('烟台')">烟台</span>
									        												        				<span onclick="cityeee('珠海')">珠海</span>
									        												        				<span onclick="cityeee('中山')">中山</span>
									        												        				<span onclick="cityeee('郑州')">郑州</span>
									        											        			</dd>
								        	  	</dl>
								        									        </div>  
								        									        <input type="text" id="cityeee" name ="cityeee" style="display:none;">
	            					</td>
	            					<td>
	            						<ul class="profile_radio clearfix reset">
	            								            								<li class="current">
									             	 全职<em></em>
									              	<input type="radio" checked="checked" name="type" value="全职"> 
									            </li>
									            <li>
									              	兼职<em></em>
									              	<input type="radio" name="type" value="兼职"> 
									            </li>
									            <li>
									            	  实习<em></em>
									              	<input type="radio" name="type" value="实习"> 
									            </li>
								            								        </ul> 
	            					</td>
	            				</tr>
	            				<tr>
	            					<td>
							        	<input type="text" placeholder="期望职位，如：产品经理" value="${stu_info.stu_exp_pos}" name="expectPosition" id="expectPosition">
									</td>
	            					<td>
	            						<input type="hidden" id="expectSalary" value="" name="expectSalary">
	            							            						<input type="button" value="${stu_info.stu_exp_salary}" id="select_expectSalary" class="profile_select_287 profile_select_normal">
	            													        	<div class="boxUpDown boxUpDown_287 dn" id="box_expectSalary" style="display: none;">
								          	  <ul>
								        										        			<li onclick="salary('2k以下')">2k以下</li>
								        										        			<li onclick="salary('2k-5k')">2k-5k</li>
								        										        			<li onclick="salary('5k-10k')">5k-10k</li>
								        										        			<li onclick="salary('10k-15k')">10k-15k</li>
								        										        			<li onclick="salary('15k-25k')">15k-25k</li>
								        										        			<li onclick="salary('25k-50k')">25k-50k</li>
								        										        			<li onclick="salary('50k以上')">50k以上</li>
								        										        	  </ul>
								        										        	  <input type="text" id="salaryeee" name ="salaryeee" style="display:none;">
								         </div>  
	            					</td>
	            				</tr>
	            				<tr>
	            					<td colspan="2">
										<input type="submit" value="保 存" class="btn_profile_save">
	            					</td>
	            				</tr>
	            			</tbody></table>
            			</form><!--end #expectForm-->
            		</div><!--end .expectEdit-->            		
            		
            		<input type="hidden" id="expectJobVal" value="">
            		<input type="hidden" id="expectCityVal" value="">
            		<input type="hidden" id="typeVal" value="">
            		<input type="hidden" id="expectPositionVal" value="">
            		<input type="hidden" id="expectSalaryVal" value="">
            		
            		
            		<%} %>
            	</div><!--end #expectJob-->
            		
            		
            		
            		
            		
            	<div class="profile_box" id="workExperience">
            		<h2>实习或工作经历 </h2>
            		<%
            		            		if(stu_work_name.compareTo("公司名称")==0){%>
            		            		<span class="c_add dn"></span>
            		<div class="experienceEdit dn">
            			<form class="experienceFormss" action="updateExperiences.do?name=${sessionScope.username}" method="post" id="experienceFormee">
	            			<table>
	            				<tbody><tr>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
							        	<input type="text" placeholder="公司名称" name="companyName" class="companyName" id="companyName">
							      	</td>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
							          	<input type="text" placeholder="职位名称，如：产品经理" name="positionName" class="positionName" id="positionName">
							      	</td>
							    </tr>
	            				<tr>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
		            						<input type="hidden" class="companyYearStart" value="" name="companyYearStart" id="companyYearStart">
								        	<input type="button" value="开始年份" class="profile_select_139 profile_select_normal select_companyYearStart">
											<div class="box_companyYearStart boxUpDown boxUpDown_139 dn" style="display: none;">
									            <ul>
									            <li onclick="Cyearstart('2016')">2016</li>
									            <li onclick="Cyearstart('2015')">2015</li>
									        											        			<li onclick="Cyearstart('2014')">2014</li>
									        											        			<li onclick="Cyearstart('2013')">2013</li>
									        											        			<li onclick="Cyearstart('2012')">2012</li>
									        											        			<li onclick="Cyearstart('2011')">2011</li>
									        											        			<li onclick="Cyearstart('2010')">2010</li>
									        											        	</ul>
									        </div>
										</div>
										<div class="fl">
									        <input type="hidden" class="companyMonthStart" name="companyMonthStart" id="companyMonthStart">
								        	<input type="button" value="开始月份" class="profile_select_139 profile_select_normal select_companyMonthStart">
											<div style="display: none;" class="box_companyMonthStart boxUpDown boxUpDown_139 dn">
									            <ul>
									        		<li onclick="Cmonthstart('01')">01</li><li onclick="Cmonthstart('02')">02</li><li onclick="Cmonthstart('03')">03</li><li onclick="Cmonthstart('04')">04</li><li onclick="Cmonthstart('05')">05</li><li onclick="Cmonthstart('06')">06</li><li onclick="Cmonthstart('07')">07</li><li onclick="Cmonthstart('08')">08</li><li onclick="Cmonthstart('09')">09</li><li onclick="Cmonthstart('10')">10</li><li onclick="Cmonthstart('11')">11</li><li onclick="Cmonthstart('12')">12</li>
									        	</ul>
									        </div>
									    </div>
									    <div class="clear"></div>
	            					</td>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
		            						<input type="hidden" value="" name="companyYearEnd" id="companyYearEnd">
								        	<input type="button" value="结束年份" class="profile_select_139 profile_select_normal select_companyYearEnd">
											<div class="box_companyYearEnd  boxUpDown boxUpDown_139 dn" style="display: none;">
									            <ul>
									            	<li onclick="Cyearends()">至今</li>
									        											        			<li onclick="Cyearend('2016')">2016</li>
									            <li onclick="Cyearend('2015')">2015</li>
									        											        			<li onclick="Cyearend('2014')">2014</li>
									        											        			<li onclick="Cyearend('2013')">2013</li>
									        											        			<li onclick="Cyearend('2012')">2012</li>
									        											        			<li onclick="Cyearend('2011')">2011</li>
									        											        			<li onclick="Cyearend('2010')">2010</li>
									        											        	</ul>
									        </div>
										</div>
										<div class="fl" id="CmonthEndss">
									        <input type="hidden" class="companyMonthEnd" value="" name="companyMonthEnd">
								        	<input type="button" value="结束月份" class="profile_select_139 profile_select_normal select_companyMonthEnd">
											<div style="display: none;" class="box_companyMonthEnd boxUpDown boxUpDown_139 dn">
									            <ul>
									        		<li onclick="Cmonthend('01')">01</li><li onclick="Cmonthend('02')">02</li><li onclick="Cmonthend('03')">03</li><li onclick="Cmonthend('04')">04</li><li onclick="Cmonthend('05')">05</li><li onclick="Cmonthend('06')">06</li><li onclick="Cmonthend('07')">07</li><li onclick="Cmonthend('08')">08</li><li onclick="Cmonthend('09')">09</li><li onclick="Cmonthend('10')">10</li><li onclick="Cmonthend('11')">11</li><li onclick="Cmonthend('12')">12</li>
									        	</ul>
									        </div>
								        </div>
								        <div class="clear"></div>
	            					</td>
	            				</tr>
	            				<tr>
	            					<td></td>
	            					<td colspan="3">
										<input type="submit" value="保 存" class="btn_profile_save">
						          		<a class="btn_profile_cancel" href="javascript:;">取 消</a>
	            					</td>
	            				</tr>
	            			</tbody></table>
	            			<input type="hidden" class="expId" value="">
            			</form><!--end .experienceForm-->
            		</div><!--end .experienceEdit-->
            		
            		            		<div class="experienceAdd pAdd">
            		            			工作经历最能体现自己的工作能力，<br>
						且完善后才可投递简历哦！
						<span>添加工作经历</span>
            		</div><!--end .experienceAdd-->
            	<%}else{ %>
            		<div id="work_exper1">
            			<form id="expectFormss">
	            			<table>
	            				<tbody><tr>
	            					<td>
	            						公司名称 :${stu_info.stu_work_name}
	            					</td>
	            					<td>
	            					              职位名称 :${stu_info.stu_work_pos}
	            					</td>
	            				</tr>
	            				<tr>
	            					<td>
							        	日期:${stu_info.stu_work_sta_y}.${stu_info.stu_work_sta_m}----->${stu_info.stu_work_end_y}.${stu_info.stu_work_end_m}
	            					</td>
	            				</tr>
	            				<tr>
	            				<td><input type="button" value="更改" onclick="updateExper()"></td>
	            				</tr>
	            			</tbody></table>
            			</form><!--end #expectForm-->
            		</div><!--end .expectEdit-->
            		<div id="work_exper2" class="experienceEdit dn">
            			<form class="experienceFormss" action="updateExperience.do?name=${sessionScope.username}" method="post" id="experienceFormee">
	            			<table>
	            				<tbody><tr>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
							        	<input type="text" placeholder="公司名称" name="companyName" class="companyName" id="companyName">
							      	</td>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
							          	<input type="text" placeholder="职位名称，如：产品经理" name="positionName" class="positionName" id="positionName">
							      	</td>
							    </tr>
	            				<tr>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
		            						<input type="hidden" class="companyYearStart" value="" name="companyYearStart" id="companyYearStart">
								        	<input type="button" value="开始年份" class="profile_select_139 profile_select_normal select_companyYearStart">
											<div class="box_companyYearStart boxUpDown boxUpDown_139 dn" style="display: none;">
									            <ul>
									            <li onclick="Cyearstart('2016')">2016</li>
									            <li onclick="Cyearstart('2015')">2015</li>
									        											        			<li onclick="Cyearstart('2014')">2014</li>
									        											        			<li onclick="Cyearstart('2013')">2013</li>
									        											        			<li onclick="Cyearstart('2012')">2012</li>
									        											        			<li onclick="Cyearstart('2011')">2011</li>
									        											        			<li onclick="Cyearstart('2010')">2010</li>
									        											        	</ul>
									        </div>
										</div>
										<div class="fl">
									        <input type="hidden" class="companyMonthStart" name="companyMonthStart" id="companyMonthStart">
								        	<input type="button" value="开始月份" class="profile_select_139 profile_select_normal select_companyMonthStart">
											<div style="display: none;" class="box_companyMonthStart boxUpDown boxUpDown_139 dn">
									            <ul>
									        		<li onclick="Cmonthstart('01')">01</li><li onclick="Cmonthstart('02')">02</li><li onclick="Cmonthstart('03')">03</li><li onclick="Cmonthstart('04')">04</li><li onclick="Cmonthstart('05')">05</li><li onclick="Cmonthstart('06')">06</li><li onclick="Cmonthstart('07')">07</li><li onclick="Cmonthstart('08')">08</li><li onclick="Cmonthstart('09')">09</li><li onclick="Cmonthstart('10')">10</li><li onclick="Cmonthstart('11')">11</li><li onclick="Cmonthstart('12')">12</li>
									        	</ul>
									        </div>
									    </div>
									    <div class="clear"></div>
	            					</td>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
		            						<input type="hidden" id="companyYearEnd" value="" name="companyYearEnd">
								        	<input type="button" value="结束年份" class="profile_select_139 profile_select_normal select_companyYearEnd">
											<div class="box_companyYearEnd  boxUpDown boxUpDown_139 dn" style="display: none;">
									            <ul>
									            	<li onclick="Cyearends()">至今</li>
									        											        			<li onclick="Cyearend('2016')">2016</li>
									            <li onclick="Cyearend('2015')">2015</li>
									        											        			<li onclick="Cyearend('2014')">2014</li>
									        											        			<li onclick="Cyearend('2013')">2013</li>
									        											        			<li onclick="Cyearend('2012')">2012</li>
									        											        			<li onclick="Cyearend('2011')">2011</li>
									        											        			<li onclick="Cyearend('2010')">2010</li>
									        											        	</ul>
									        </div>
										</div>
										<div class="fl" id="CmonthEndss">
									        <input type="hidden" class="companyMonthEnd" value="" name="companyMonthEnd">
								        	<input type="button" value="结束月份" class="profile_select_139 profile_select_normal select_companyMonthEnd">
											<div style="display: none;" class="box_companyMonthEnd boxUpDown boxUpDown_139 dn">
									            <ul>
									        		<li onclick="Cmonthend('01')">01</li><li onclick="Cmonthend('02')">02</li><li onclick="Cmonthend('03')">03</li><li onclick="Cmonthend('04')">04</li><li onclick="Cmonthend('05')">05</li><li onclick="Cmonthend('06')">06</li><li onclick="Cmonthend('07')">07</li><li onclick="Cmonthend('08')">08</li><li onclick="Cmonthend('09')">09</li><li onclick="Cmonthend('10')">10</li><li onclick="Cmonthend('11')">11</li><li onclick="Cmonthend('12')">12</li>
									        	</ul>
									        </div>
								        </div>
								        <div class="clear"></div>
	            					</td>
	            				</tr>
	            				<tr>
	            					<td></td>
	            					<td colspan="3">
										<input type="submit" value="保 存" class="btn_profile_save">
	            					</td>
	            				</tr>
	            			</tbody></table>
	            			<input type="hidden" class="expId" value="">
            			</form><!--end .experienceForm-->
            		</div>
<%} %>
</div><!--end #workExperience-->




<!-- 项目经验 -->
            	<div class="profile_box" id="projectExperience">
            		<h2>项目经验</h2>
            		<%
            		            		if(stu_inter_name.compareTo("项目名称")==0){%>
            		            		<span class="c_add dn"></span>
            		<div class="projectShow dn">
            		            			<ul class="plist clearfix">
	            			            			</ul>
            		</div><!--end .projectShow-->
            		<div class="projectEdit dn">
            			<form class="projectFormss" id="projectFormee" action="updateprojects.do?name=${sessionScope.username}" method="post">
	            			<table>
	            				<tbody><tr>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
							        	<input type="text" placeholder="项目名称" name="projectName" class="projectName">
							      	</td>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
							          	<input type="text" placeholder="担任职务，如：产品负责人" name="thePost" class="thePost">
							      	</td>
							    </tr>
	            				<tr>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
		            					<input type="hidden" value="" name="projectYearStart" id="projectYearStart">
								        	<input type="button" value="开始年份" class="profile_select_139 profile_select_normal select_projectYearStart">
											<div class="box_projectYearStart  boxUpDown boxUpDown_139 dn" style="display: none;">
									            <ul>
									            <li onclick="Pyearstart('2016')">2016</li>
									            <li onclick="Pyearstart('2015')">2015</li>
									        											        			<li onclick="Pyearstart('2014')">2014</li>
									        											        			<li onclick="Pyearstart('2013')">2013</li>
									        											        			<li onclick="Pyearstart('2012')">2012</li>
									        											        			<li onclick="Pyearstart('2011')">2011</li>
									        											        			<li onclick="Pyearstart('2010')">2010</li>
									        											        	</ul>
									        </div>
										</div>
										<div class="fl">
										<input type="hidden" value="" name="projectMonthStart" id="projectMonthStart">
							        	<input type="button" value="开始月份" class="profile_select_139 profile_select_normal select_projectMonthStart">
											<div style="display: none;" class="box_projectMonthStart boxUpDown boxUpDown_139 dn">
									           <ul>
									        		<li onclick="Pmonthstart('01')">01</li><li onclick="Pmonthstart('02')">02</li><li onclick="Pmonthstart('03')">03</li><li onclick="Pmonthstart('04')">04</li><li onclick="Pmonthstart('05')">05</li><li onclick="Pmonthstart('06')">06</li><li onclick="Pmonthstart('07')">07</li><li onclick="Pmonthstart('08')">08</li><li onclick="Pmonthstart('09')">09</li><li onclick="Pmonthstart('10')">10</li><li onclick="Pmonthstart('11')">11</li><li onclick="Pmonthstart('12')">12</li>
									        	</ul>
									        </div>
								        </div>
								        <div class="clear"></div>
	            					</td>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
	            						<div class="fl">
	            						<input type="hidden" value="" name="projectYearEnd" id="projectYearEnd">
								        	<input type="button" value="结束年份" class="profile_select_139 profile_select_normal select_projectYearEnd">
											<div class="box_projectYearEnd  boxUpDown boxUpDown_139 dn" style="display: none;">
									            <ul>
									            	<li onclick="Pyearends()">至今</li>
									        											        			<li onclick="Pyearend('2016')">2016</li>
									            <li onclick="Pyearend('2015')">2015</li>
									        											        			<li onclick="Pyearend('2014')">2014</li>
									        											        			<li onclick="Pyearend('2013')">2013</li>
									        											        			<li onclick="Pyearend('2012')">2012</li>
									        											        			<li onclick="Pyearend('2011')">2011</li>
									        											        			<li onclick="Pyearend('2010')">2010</li>
									        											        	</ul>
									        </div>
										</div>
										<div class="fl" id="PmonthEnd">
									        <input type="hidden" class="projectMonthEnd" value="" name="projectMonthEnd" id="projectMonthEnd">
								        	<input type="button" value="结束月份" class="profile_select_139 profile_select_normal select_projectMonthEnd">
											<div style="display: none;" class="box_projectMonthEnd boxUpDown boxUpDown_139 dn">
									            <ul>
									        		<li onclick="Pmonthend('01')">01</li><li onclick="Pmonthend('02')">02</li><li onclick="Pmonthend('03')">03</li><li onclick="Pmonthend('04')">04</li><li onclick="Pmonthend('05')">05</li><li onclick="Pmonthend('06')">06</li><li onclick="Pmonthend('07')">07</li><li onclick="Pmonthend('08')">08</li><li onclick="Pmonthend('09')">09</li><li onclick="Pmonthend('10')">10</li><li onclick="Pmonthend('11')">11</li><li onclick="Pmonthend('12')">12</li>
									        	</ul>
									        </div>
								        </div>
								        <div class="clear"></div>
	            					</td>
	            				</tr>
	            				<tr>
	            					<td valign="top"></td> 
									<td colspan="3">
										<textarea class="projectDescription s_textarea" name="projectDescription" placeholder="项目描述(200字以内)"></textarea>
									</td>
	            				</tr>
	            				
	            				<tr>
	            					<td valign="top"></td> 
	            					<td colspan="3">
										<input type="submit" value="保 存" class="btn_profile_save">
						          		<a class="btn_profile_cancel" href="javascript:;">取 消</a>
	            					</td>
	            				</tr>
	            			</tbody></table>
            			</form><!--end .projectForm-->
            		</div><!--end .projectEdit-->
            		            		<div class="projectAdd pAdd">
            		            			项目经验是用人单位衡量人才能力的重要指标哦！<br>
						来说说让你难忘的项目吧！
						<span>添加项目经验</span>
            		</div><!--end .projectAdd-->
            		<%}else{ %>
            		<div id="project_exper1">
            			<form id="projectFormss">
	            			<table>
	            				<tbody><tr>
	            					<td>
	            						项目名称 :${stu_info.stu_inter_name}
	            					</td>
	            					<td>
	            					              担任职务 :${stu_info.stu_inter_pos}
	            					</td>
	            				</tr>
	            				<tr>
	            					<td>
							        	日期:${stu_info.stu_inter_sta_y}.${stu_info.stu_inter_sta_m}----->${stu_info.stu_inter_end_y}.${stu_info.stu_inter_end_m}
	            					</td>
	            				</tr>
	            				<tr>
	            				<td>
	            				     项目描述:${stu_info.stu_inter_descr}
	            				     </td>
	            				</tr>
	            				<tr>
	            				<td><input type="button" value="更改" onclick="updateProject()"></td>
	            				</tr>
	            			</tbody></table>
            			</form><!--end #expectForm-->
            		</div><!--end .expectEdit-->
            		<div class="projectEdit dn" id="project_exper2">
            			<form class="projectFormss" action="updateproject.do?name=${sessionScope.username}" method="post">
	            			<table>
	            				<tbody><tr>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
							        	<input type="text" placeholder="项目名称" name="projectName" class="projectName">
							      	</td>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
							          	<input type="text" placeholder="担任职务，如：产品负责人" name="thePost" class="thePost">
							      	</td>
							    </tr>
	            				<tr>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
		            					<input type="hidden" value="" name="projectYearStart" id="projectYearStart">
								        	<input type="button" value="开始年份" class="profile_select_139 profile_select_normal select_projectYearStart">
											<div class="box_projectYearStart  boxUpDown boxUpDown_139 dn" style="display: none;">
									            <ul>
									            <li onclick="Pyearstart('2016')">2016</li>
									            <li onclick="Pyearstart('2015')">2015</li>
									        											        			<li onclick="Pyearstart('2014')">2014</li>
									        											        			<li onclick="Pyearstart('2013')">2013</li>
									        											        			<li onclick="Pyearstart('2012')">2012</li>
									        											        			<li onclick="Pyearstart('2011')">2011</li>
									        											        			<li onclick="Pyearstart('2010')">2010</li>
									        											        	</ul>
									        </div>
										</div>
										<div class="fl">
										<input type="hidden" value="" name="projectMonthStart" id="projectMonthStart">
							        	<input type="button" value="开始月份" class="profile_select_139 profile_select_normal select_projectMonthStart">
											<div style="display: none;" class="box_projectMonthStart boxUpDown boxUpDown_139 dn">
									           <ul>
									        		<li onclick="Pmonthstart('01')">01</li><li onclick="Pmonthstart('02')">02</li><li onclick="Pmonthstart('03')">03</li><li onclick="Pmonthstart('04')">04</li><li onclick="Pmonthstart('05')">05</li><li onclick="Pmonthstart('06')">06</li><li onclick="Pmonthstart('07')">07</li><li onclick="Pmonthstart('08')">08</li><li onclick="Pmonthstart('09')">09</li><li onclick="Pmonthstart('10')">10</li><li onclick="Pmonthstart('11')">11</li><li onclick="Pmonthstart('12')">12</li>
									        	</ul>
									        </div>
								        </div>
								        <div class="clear"></div>
	            					</td>
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
	            						<div class="fl">
	            						<input type="hidden" value="" name="projectYearEnd" id="projectYearEnd">
								        	<input type="button" value="结束年份" class="profile_select_139 profile_select_normal select_projectYearEnd">
											<div class="box_projectYearEnd  boxUpDown boxUpDown_139 dn" style="display: none;">
									            <ul>
									            	<li onclick="Pyearends()">至今</li>
									        											        			<li onclick="Pyearend('2016')">2016</li>
									            <li onclick="Pyearend('2015')">2015</li>
									        											        			<li onclick="Pyearend('2014')">2014</li>
									        											        			<li onclick="Pyearend('2013')">2013</li>
									        											        			<li onclick="Pyearend('2012')">2012</li>
									        											        			<li onclick="Pyearend('2011')">2011</li>
									        											        			<li onclick="Pyearend('2010')">2010</li>
									        											        	</ul>
									        </div>
										</div>
										<div class="fl" id="PmonthEnd">
									        <input type="hidden" class="projectMonthEnd" value="" name="projectMonthEnd" id="projectMonthEnd">
								        	<input type="button" value="结束月份" class="profile_select_139 profile_select_normal select_projectMonthEnd">
											<div style="display: none;" class="box_projectMonthEnd boxUpDown boxUpDown_139 dn">
									            <ul>
									        		<li onclick="Pmonthend('01')">01</li><li onclick="Pmonthend('02')">02</li><li onclick="Pmonthend('03')">03</li><li onclick="Pmonthend('04')">04</li><li onclick="Pmonthend('05')">05</li><li onclick="Pmonthend('06')">06</li><li onclick="Pmonthend('07')">07</li><li onclick="Pmonthend('08')">08</li><li onclick="Pmonthend('09')">09</li><li onclick="Pmonthend('10')">10</li><li onclick="Pmonthend('11')">11</li><li onclick="Pmonthend('12')">12</li>
									        	</ul>
									        </div>
								        </div>
								        <div class="clear"></div>
	            					</td>
	            				</tr>
	            				<tr>
	            					<td valign="top"></td> 
									<td colspan="3">
										<textarea class="projectDescription s_textarea" name="projectDescription" placeholder="项目描述(200字以内)"></textarea>
									</td>
	            				</tr>
	            				
	            				<tr>
	            					<td valign="top"></td> 
	            					<td colspan="3">
										<input type="submit" value="保 存" class="btn_profile_save">
	            					</td>
	            				</tr>
	            			</tbody></table>
            			</form><!--end .projectForm-->
            		</div><!--end .projectEdit-->
            		
    <%} %>        		
            	</div><!--end #projectExperience-->









<!-- 教育背景 -->
            	<div class="profile_box" id="educationalBackground">
            		<h2>学历背景</h2>
<%
            		            		if(stu_undergraduate_name.compareTo("学校名称")==0){%>
            							<span class="c_add dn"></span>
            		<div class="educationalEdit dn">
            			
	            			<%String stu_college =(String)session.getAttribute("stu_college");
	            			if(stu_college.compareTo("博士")==0){%>
	            			<form class="educationalFormss" action="updateEdus.do?name=${sessionScope.username}&colle=doc" method="post">
	            			<table>
	            				<tbody>
	            				<tr>
							      	<td valign="top">
							        	<span class="schoolName">本科</span>
							      	</td> 
							      	<td>
							        	<input type="text" placeholder="学校名称" name="schoolName" class="schoolName" id="schoolName">
							      	</td>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
	            						<input type="text" placeholder="专业名称" name="professionalName" class="professionalName" id="professionalName">
	            					</td>
							    </tr>
	            				<tr>
	            					
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
		            						<input type="text" id="schoolYearStart" placeholder="开始年份" name="schoolYearStart">
										</div>
									</td>
									<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 	
									<td>	
										<div class="fl">
								        	<input type="text" id="schoolYearEnd" placeholder="结束年份" name="schoolYearEnd">
	            						</div>
	            					</td>
	            				</tr>
	            				<tr>
							      	<td valign="top">
							        	<span class="schoolName">硕士</span>
							      	</td> 
							      	<td>
							        	<input type="text" placeholder="学校名称" name="MschoolName" class="schoolName" id="MschoolName">
							      	</td>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
	            						<input type="text" placeholder="专业名称" name="MprofessionalName" class="professionalName" id="MprofessionalName">
	            					</td>
							    </tr>
	            				<tr>
	            					
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
								        	<input type="text" id="MschoolYearStart" placeholder="开始年份" name="MschoolYearStart">
										</div>
									</td>
									<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 	
									<td>	
										<div class="fl">
								        	<input type="text" id="MschoolYearEnd" placeholder="结束年份" name="MschoolYearEnd">
	            						</div>
	            						
	            					</td>
	            				</tr>
	            				<tr>
							      	<td valign="top">
							        	<span class="schoolName">博士</span>
							      	</td> 
							      	<td>
							        	<input type="text" placeholder="学校名称" name="DschoolName" class="schoolName" id="DschoolName">
							      	</td>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
	            						<input type="text" placeholder="专业名称" name="DprofessionalName" class="professionalName" id="DprofessionalName">
	            					</td>
							    </tr>
	            				<tr>
	            					
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
								        	<input type="text" id="DschoolYearStart" placeholder="开始年份" name="DschoolYearStart">
										</div>
									</td>
									<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 	
									<td>	
										<div class="fl">
								        	<input type="text" id="DschoolYearEnd" placeholder="结束年份" name="DschoolYearEnd">
	            						</div>
	            						
	            					</td>
	            				</tr>
	            				<tr>
	            					<td></td>
	            					<td colspan="3">
										<input type="submit" value="保 存" class="btn_profile_save">
	            					</td>
	            				</tr>
	            			</tbody></table>
	            			<input type="hidden" class="eduId" value="">
            			</form><!--end .educationalForm-->
	            			<%}else if(stu_college.compareTo("硕士")==0){ %>
	            			<form class="educationalFormss"  action="updateEdus.do?name=${sessionScope.username}&colle=mas" method="post">
	            			<table>
	            				<tbody>
	            				<tr>
							      	<td valign="top">
							        	<span class="schoolName">本科</span>
							      	</td> 
							      	<td>
							        	<input type="text" placeholder="学校名称" name="schoolName" class="schoolName" id="schoolName">
							      	</td>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
	            						<input type="text" placeholder="专业名称" name="professionalName" class="professionalName" id="professionalName">
	            					</td>
							    </tr>
	            				<tr>
	            					
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
		            						<input type="text" id="schoolYearStart" placeholder="开始年份" name="schoolYearStart">
										</div>
									</td>
									<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 	
									<td>	
										<div class="fl">
								        	<input type="text" id="schoolYearEnd" placeholder="结束年份" name="schoolYearEnd">
	            						</div>
	            					</td>
	            				</tr>
	            				<tr>
							      	<td valign="top">
							        	<span class="schoolName">硕士</span>
							      	</td> 
							      	<td>
							        	<input type="text" placeholder="学校名称" name="MschoolName" class="schoolName" id="MschoolName">
							      	</td>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
	            						<input type="text" placeholder="专业名称" name="MprofessionalName" class="professionalName" id="MprofessionalName">
	            					</td>
							    </tr>
	            				<tr>
	            					
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
								        	<input type="text" id="MschoolYearStart" placeholder="开始年份" name="MschoolYearStart">
										</div>
									</td>
									<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 	
									<td>	
										<div class="fl">
								        	<input type="text" id="MschoolYearEnd" placeholder="结束年份" name="MschoolYearEnd">
	            						</div>
	            						
	            					</td>
	            				</tr>
	            				<tr>
	            					<td></td>
	            					<td colspan="3">
										<input type="submit" value="保 存" class="btn_profile_save">
	            					</td>
	            				</tr>
	            			</tbody></table>
	            			<input type="hidden" class="eduId" value="">
            			</form><!--end .educationalForm-->
	            			<%}else if(stu_college.compareTo("本科")==0) {%>
	            			<form class="educationalFormss"  action="updateEdus.do?name=${sessionScope.username}&colle=und" method="post">
	            			<table>
	            				<tbody>
	            				<tr>
							      	<td valign="top">
							        	<span class="schoolName">本科</span>
							      	</td> 
							      	<td>
							        	<input type="text" placeholder="学校名称" name="schoolName" class="schoolName" id="schoolName">
							      	</td>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
	            						<input type="text" placeholder="专业名称" name="professionalName" class="professionalName" id="professionalName">
	            					</td>
							    </tr>
	            				<tr>
	            					
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
		            						<input type="text" id="schoolYearStart" placeholder="开始年份" name="schoolYearStart">
										</div>
									</td>
									<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 	
									<td>	
										<div class="fl">
								        	<input type="text" id="schoolYearEnd" placeholder="结束年份" name="schoolYearEnd">
	            						</div>
	            					</td>
	            				</tr>
	            				<tr>
	            					<td></td>
	            					<td colspan="3">
										<input type="submit" value="保 存" class="btn_profile_save">
	            					</td>
	            				</tr>
	            			</tbody></table>
	            			<input type="hidden" class="eduId" value="">
            			</form><!--end .educationalForm-->
	            			<%} %>
	            			
            		</div><!--end .educationalEdit-->
            		            		<div class="educationalAdd pAdd">
            		            			教育背景可以充分体现你的学习和专业能力，<br>
						且完善后才可投递简历哦！
						<span>添加教育经历</span>
            		</div><!--end .educationalAdd-->
            		<%}else{ %>
            		<div id="educationalEdit1">
            			<form id="educationalFormss">
            			<%String stu_college =(String)session.getAttribute("stu_college");
            			if(stu_college.compareTo("博士")==0){%>
	            			<table>
	            				<tbody>
	            				<tr>
	            					<td>
	            						本科 :${stu_info.stu_undergraduate_name}
	            					</td>
	            					<td>
	            					              专业 :${stu_info.stu_undergraduate_major}
	            					</td>
	            				</tr>
	            				<tr>
	            					<td>
							        	日期:${stu_info.stu_undergraduate_sta}年----->${stu_info.stu_undergraduate_end}年
	            					</td>
	            				</tr>
	            				<tr>
	            				<tr>
	            					<td>
	            						硕士 :${stu_info.stu_master_name}
	            					</td>
	            					<td>
	            					              专业 :${stu_info.stu_master_major}
	            					</td>
	            				</tr>
	            				<tr>
	            					<td>
							        	日期:${stu_info.stu_master_sta}年----->${stu_info.stu_master_end}年
	            					</td>
	            				</tr>
	            				<tr>
	            				<tr>
	            					<td>
	            						博士 :${stu_info.stu_doctor_name}
	            					</td>
	            					<td>
	            					              专业 :${stu_info.stu_doctor_major}
	            					</td>
	            				</tr>
	            				<tr>
	            					<td>
							        	日期:${stu_info.stu_doctor_sta}年----->${stu_info.stu_doctor_end}年
	            					</td>
	            				</tr>
	            				<tr>
	            				<td><input type="button" value="更改" onclick="updateEdu()"></td>
	            				</tr>
	            			</tbody></table>
	            			<%}else if(stu_college.compareTo("硕士")==0){ %>
	            			<table>
	            				<tbody>
	            				<tr>
	            					<td>
	            						本科 :${stu_info.stu_undergraduate_name}
	            					</td>
	            					<td>
	            					              专业 :${stu_info.stu_undergraduate_major}
	            					</td>
	            				</tr>
	            				<tr>
	            					<td>
							        	日期:${stu_info.stu_undergraduate_sta}年----->${stu_info.stu_undergraduate_end}年
	            					</td>
	            				</tr>
	            				<tr>
	            				<tr>
	            					<td>
	            						硕士 :${stu_info.stu_master_name}
	            					</td>
	            					<td>
	            					              专业 :${stu_info.stu_master_major}
	            					</td>
	            				</tr>
	            				<tr>
	            					<td>
							        	日期:${stu_info.stu_master_sta}年----->${stu_info.stu_master_end}年
	            					</td>
	            				</tr>
	            				<tr>
	            				<td><input type="button" value="更改" onclick="updateEdu()"></td>
	            				</tr>
	            			</tbody></table>
	            			<%}else if(stu_college.compareTo("本科")==0) {%>
	            			<table>
	            				<tbody>
	            				<tr>
	            					<td>
	            						本科 :${stu_info.stu_undergraduate_name}
	            					</td>
	            					<td>
	            					              专业 :${stu_info.stu_undergraduate_major}
	            					</td>
	            				</tr>
	            				<tr>
	            					<td>
							        	日期:${stu_info.stu_undergraduate_sta}年----->${stu_info.stu_undergraduate_end}年
	            					</td>
	            				</tr>
	            				<tr>
	            				<td><input type="button" value="更改" onclick="updateEdu()"></td>
	            				</tr>
	            				<%} %>
	            			</tbody></table>
	            			
            			</form><!--end #expectForm-->
            		</div><!--end .expectEdit-->
            		<div class="educationalEdit dn" id="educationalEdit2">
            			<%if(stu_college.compareTo("博士")==0){%>
	            			<form class="educationalFormss" action="updateEdu.do?name=${sessionScope.username}&colle=doc" method="post">
	            			<table>
	            				<tbody>
	            				<tr>
							      	<td valign="top">
							        	<span class="schoolName">本科</span>
							      	</td> 
							      	<td>
							        	<input type="text" placeholder="学校名称" name="schoolName" class="schoolName" id="schoolName">
							      	</td>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
	            						<input type="text" placeholder="专业名称" name="professionalName" class="professionalName" id="professionalName">
	            					</td>
							    </tr>
	            				<tr>
	            					
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
		            						<input type="text" id="schoolYearStart" placeholder="开始年份" name="schoolYearStart">
										</div>
									</td>
									<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 	
									<td>	
										<div class="fl">
								        	<input type="text" id="schoolYearEnd" placeholder="结束年份" name="schoolYearEnd">
	            						</div>
	            					</td>
	            				</tr>
	            				<tr>
							      	<td valign="top">
							        	<span class="schoolName">硕士</span>
							      	</td> 
							      	<td>
							        	<input type="text" placeholder="学校名称" name="MschoolName" class="schoolName" id="MschoolName">
							      	</td>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
	            						<input type="text" placeholder="专业名称" name="MprofessionalName" class="professionalName" id="MprofessionalName">
	            					</td>
							    </tr>
	            				<tr>
	            					
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
								        	<input type="text" id="MschoolYearStart" placeholder="开始年份" name="MschoolYearStart">
										</div>
									</td>
									<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 	
									<td>	
										<div class="fl">
								        	<input type="text" id="MschoolYearEnd" placeholder="结束年份" name="MschoolYearEnd">
	            						</div>
	            						
	            					</td>
	            				</tr>
	            				<tr>
							      	<td valign="top">
							        	<span class="schoolName">博士</span>
							      	</td> 
							      	<td>
							        	<input type="text" placeholder="学校名称" name="DschoolName" class="schoolName" id="DschoolName">
							      	</td>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
	            						<input type="text" placeholder="专业名称" name="DprofessionalName" class="professionalName" id="DprofessionalName">
	            					</td>
							    </tr>
	            				<tr>
	            					
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
								        	<input type="text" id="DschoolYearStart" placeholder="开始年份" name="DschoolYearStart">
										</div>
									</td>
									<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 	
									<td>	
										<div class="fl">
								        	<input type="text" id="DschoolYearEnd" placeholder="结束年份" name="DschoolYearEnd">
	            						</div>
	            						
	            					</td>
	            				</tr>
	            				<tr>
	            					<td></td>
	            					<td colspan="3">
										<input type="submit" value="保 存" class="btn_profile_save">
	            					</td>
	            				</tr>
	            			</tbody></table>
	            			<input type="hidden" class="eduId" value="">
            			</form><!--end .educationalForm-->
	            			<%}else if(stu_college.compareTo("硕士")==0){ %>
	            			<form class="educationalFormss"  action="updateEdu.do?name=${sessionScope.username}&colle=mas" method="post">
	            			<table>
	            				<tbody>
	            				<tr>
							      	<td valign="top">
							        	<span class="schoolName">本科</span>
							      	</td> 
							      	<td>
							        	<input type="text" placeholder="学校名称" name="schoolName" class="schoolName" id="schoolName">
							      	</td>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
	            						<input type="text" placeholder="专业名称" name="professionalName" class="professionalName" id="professionalName">
	            					</td>
							    </tr>
	            				<tr>
	            					
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
		            						<input type="text" id="schoolYearStart" placeholder="开始年份" name="schoolYearStart">
										</div>
									</td>
									<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 	
									<td>	
										<div class="fl">
								        	<input type="text" id="schoolYearEnd" placeholder="结束年份" name="schoolYearEnd">
	            						</div>
	            					</td>
	            				</tr>
	            				<tr>
							      	<td valign="top">
							        	<span class="schoolName">硕士</span>
							      	</td> 
							      	<td>
							        	<input type="text" placeholder="学校名称" name="MschoolName" class="schoolName" id="MschoolName">
							      	</td>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
	            						<input type="text" placeholder="专业名称" name="MprofessionalName" class="professionalName" id="MprofessionalName">
	            					</td>
							    </tr>
	            				<tr>
	            					
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
								        	<input type="text" id="MschoolYearStart" placeholder="开始年份" name="MschoolYearStart">
										</div>
									</td>
									<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 	
									<td>	
										<div class="fl">
								        	<input type="text" id="MschoolYearEnd" placeholder="结束年份" name="MschoolYearEnd">
	            						</div>
	            						
	            					</td>
	            				</tr>
	            				<tr>
	            					<td></td>
	            					<td colspan="3">
										<input type="submit" value="保 存" class="btn_profile_save">
	            					</td>
	            				</tr>
	            			</tbody></table>
	            			<input type="hidden" class="eduId" value="">
            			</form><!--end .educationalForm-->
	            			<%}else if(stu_college.compareTo("本科")==0) {%>
	            			<form class="educationalFormss"  action="updateEdu.do?name=${sessionScope.username}&colle=und" method="post">
	            			<table>
	            				<tbody>
	            				<tr>
							      	<td valign="top">
							        	<span class="schoolName">本科</span>
							      	</td> 
							      	<td>
							        	<input type="text" placeholder="学校名称" name="schoolName" class="schoolName" id="schoolName">
							      	</td>
							      	<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
							      	<td>
	            						<input type="text" placeholder="专业名称" name="professionalName" class="professionalName" id="professionalName">
	            					</td>
							    </tr>
	            				<tr>
	            					
	            					<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 
	            					<td>
		            					<div class="fl">
		            						<input type="text" id="schoolYearStart" placeholder="开始年份" name="schoolYearStart">
										</div>
									</td>
									<td valign="top">
							        	<span class="redstar">*</span>
							      	</td> 	
									<td>	
										<div class="fl">
								        	<input type="text" id="schoolYearEnd" placeholder="结束年份" name="schoolYearEnd">
	            						</div>
	            					</td>
	            				</tr>
	            				<tr>
	            					<td></td>
	            					<td colspan="3">
										<input type="submit" value="保 存" class="btn_profile_save">
	            					</td>
	            				</tr>
	            			</tbody></table>
	            			<input type="hidden" class="eduId" value="">
            			</form><!--end .educationalForm-->
	            			<%} %>
	            			
	            			
	            			<input type="hidden" class="eduId" value="">
            		</div><!--end .educationalEdit-->
            		<%} %> 
            		
            		
            		
            	</div><!--end #educationalBackground-->





            	<div class="profile_box" id="selfDescription">
            		<h2>自我描述</h2>
            		<%
            		            		if(stu_descr.compareTo("自我描述")==0){%>
            		            		<span class="c_edit dn"></span>
            		<div class="descriptionShow dn">
            		            			
            		</div><!--end .descriptionShow-->
            		<div class="descriptionEdit dn">
            			<form class="descriptionFormss" action="updateDescrs.do?name=${sessionScope.username}" method="post">
	            			<table>
	            				<tbody><tr>
									<td colspan="2">
										<textarea class="selfDescription s_textarea" name="selfDescription" placeholder=""id="selfDescription"></textarea>
										<div class="word_count">限 <span>200</span> 字以内</div>
									</td>
	            				</tr>
	            				<tr>
	            					<td colspan="2">
										<input type="submit" value="保 存" class="btn_profile_save">
						          		<a class="btn_profile_cancel" href="javascript:;">取 消</a>
	            					</td>
	            				</tr>
	            			</tbody></table>
            			</form><!--end .descriptionForm-->
            		</div><!--end .descriptionEdit-->
            		            		<div class="descriptionAdd pAdd">
            		            			描述你的性格、爱好以及吸引人的经历等，<br>
						让企业了解多元化的你！
						<span>添加自我描述</span>
            		</div><!--end .descriptionAdd-->
            		<%}else{ %>
            		<div id="descr1" class="descriptionEdit">
            			<form id="expectFormss">
	            			<table>
	            				<tbody>
	            				<tr>
	            					<td>
							        	${stu_info.stu_descr}
	            					</td>
	            				</tr>
	            				<tr>
	            				<td><input type="button" value="更改" onclick="updateDescr()"></td>
	            				</tr>
	            			</tbody></table>
            			</form><!--end #expectForm-->
            		</div><!--end .expectEdit-->
            		<div class="descriptionEdit dn" id="descr2">
            			<form class="descriptionFormss" action="updateDescr.do?name=${sessionScope.username}" method="post">
	            			<table>
	            				<tbody><tr>
									<td colspan="2">
										<textarea class="selfDescription s_textarea" name="selfDescription" placeholder="" id="selfDescription"></textarea>
										<div class="word_count">限 <span>200</span> 字以内</div>
									</td>
	            				</tr>
	            				<tr>
	            					<td colspan="2">
										<input type="submit" value="保 存" class="btn_profile_save">
	            					</td>
	            				</tr>
	            			</tbody></table>
            			</form><!--end .descriptionForm-->
            		</div><!--end .descriptionEdit-->
            		
            		<%} %>
            		
            		
            		
            		
            	</div><!--end #selfDescription-->

				<input type="hidden" id="resumeId" value="268472">
            </div><!--end .content_l-->
            <div class="content_r">

				<!-- <div class="mycenterR" id="myResume">
            		<h2>我的附件简历 
            			            			<a title="上传附件简历" href="#uploadFile" class="inline cboxElement">上传简历</a>
            			            		</h2>
            		<div class="resumeUploadDiv">
	            			            		暂无附件简历
	            		            		</div>
            	</div>end #myResume -->

            	
				
				
            	
								
				<div class="greybg qrcode mt20">
                	<img width="242" height="242" alt="拉勾微信公众号二维码" src="style/images/qr_resume.png">
                    <span class="c7">微信扫一扫，轻松找工作</span>
                </div>
            </div><!--end .content_r-->
        </div>
        
      <input type="hidden" id="userid" name="userid" value="314873">

<!-------------------------------------弹窗lightbox ----------------------------------------->
<div style="display:none;">
	<!-- 上传简历 -->
	<div class="popup" id="uploadFile">
	    <table width="100%">
	    	<tbody><tr>
	        	<td align="center">
	                <form id="resumeup" action="uploadresume.do?name=${sessionScope.username}" method="post">
	                    <a class="btn_addPic" href="javascript:void(0);">
	                    	<span>选择上传文件</span>
	                        <input type="file" onchange="asdasd()" class="filePrew" id="resumeUpload" name="newResume" size="3" title="支持word、pdf、ppt、txt、wps格式文件，大小不超过10M" tabindex="3">
	                    </a>
	                </form>
	            </td>
	        </tr>
	    	<tr>
	        	<td align="left">支持word、pdf、ppt、wps格式文件<br>文件大小需小于10M</td>
	        </tr>
	        <tr>
	        	<td align="left" style="color:#dd4a38; padding-top:10px;">注：若从其它网站下载的word简历，请将文件另存为.docx格式后上传</td>
	        </tr>
	    	<tr>
	        	<td align="center"><img width="55" height="16" alt="loading" style="visibility: hidden;" id="loadingImg" src="style/images/loading.gif"></td>
	        </tr>
	    </tbody></table>
	</div><!--/#uploadFile-->
	
</div>
<!------------------------------------- end ----------------------------------------->  

<script src="style/js/Chart.min.js" type="text/javascript"></script>
<script src="style/js/profile.min.js" type="text/javascript"></script>
<!-- <div id="profileOverlay"></div> -->
<div class="" id="qr_cloud_resume" style="display: none;">
	<div class="cloud">
		<img width="134" height="134" src="">
		<a class="close" href="javascript:;"></a>
	</div>
</div>
<script>
$(function(){
	$.ajax({
        url:ctx+"/mycenter/showQRCode",
        type:"GET",
        async:false
   	}).done(function(data){
        if(data.success){
             $('#qr_cloud_resume img').attr("src",data.content);
        }
   	}); 
	var sessionId = "resumeQR"+314873;
	if(!$.cookie(sessionId)){
		$.cookie(sessionId, 0, {expires: 1});
	}
	if($.cookie(sessionId) && $.cookie(sessionId) != 5){
		$('#qr_cloud_resume').removeClass('dn');
	}
	$('#qr_cloud_resume .close').click(function(){
		$('#qr_cloud_resume').fadeOut(200);
		resumeQR = parseInt($.cookie(sessionId)) + 1;
		$.cookie(sessionId, resumeQR, {expires: 1});
	});
});
</script>
			<div class="clear"></div>
			<input type="hidden" value="97fd449bcb294153a671f8fe6f4ba655" id="resubmitToken">
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
var score;
function scoreChange(a){function e(){
	var b=document.getElementById("doughnutChartCanvas").getContext("2d");
	new Chart(b).Doughnut(c,d),$("#resumeScore .scoreVal span").text(a).parent().fadeIn(200),100==a?$("#resumeScore .which span").html('<a href="positionshow.do">马上去投递</a>'):$("#resumeScore .which span").html("<a>马上去完善</a>")
			}
score = document.getElementById("sscore").value;
			var b=360*parseInt(score)/100,c=[{value:b,color:"#009a6d"},{value:360-b,color:"#ffffff"}],d={percentageInnerCutout:80,segmentShowStroke:!1,animationEasing:"easeOutQuart"};
			setTimeout(e,300)
			}
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