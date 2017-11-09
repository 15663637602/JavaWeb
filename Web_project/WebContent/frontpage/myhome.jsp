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
<title>公司主页</title>
<meta content="23635710066417756375" property="qc:admins">
<meta name="description" content="主页">
<meta name="keywords" content="主页">
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
<script src="style/js/ajaxCross.json" charset="UTF-8"></script>
<script src="style/js/ajaxfileupload.js" type="text/javascript"></script>
<script type="text/javascript">
var req;
function updateCT(){
	document.getElementById("editDetailFormss").className="clear editDetailss";
}

function size(String){
	document.getElementById("companySize").value = String;
}

function stage(String){
	document.getElementById("financeStage").value = String;
	document.getElementById("stagesList").style.display = "block";
}

function updateFin(){
	document.getElementById("stageform1").className="reset stageshow dn";
	document.getElementById("stageform2").className="";
}

function stages(){
	document.getElementById("stagesList").style.display = "none";
	document.getElementById("financeStage").value = "未融资";
	document.getElementById("stageorg").value = "无";
}

function contact(){
	document.getElementById("contact1").className="member_info newMember";
	document.getElementById("contact2").className="member_info dn";
}

function del(String,name){
	 var ct_id = String;
	 var h_email = name;
	 if(confirm("确定删除吗")){
		
		 if (window.XMLHttpRequest) {
            req = new XMLHttpRequest();
        }else if (window.ActiveXObject) {
            req = new ActiveXObject("Microsoft.XMLHTTP");
        }
       if(req){
    	   var t = new Date();
	   		req.open("POST","delTag.do?time="+t.getTime(),true);
		 	req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	        req.send("ct_id=" + ct_id+"&name="+ h_email);
       }
     }else{
    	 window.location.href="myhome.do?name="+h_email;
     }
}
function ajaxFileUpload(){
	var h_email = document.getElementById("h_email").value;
	//开始上传文件时显示一个图片,文件上传完成将图片隐藏
	//$("#loading").ajaxStart(function(){$(this).show();}).ajaxComplete(function(){$(this).hide();});
	//执行上传文件操作的函数
	$.ajaxFileUpload({
		//处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
		url:'fileUpload.do?uname='+h_email,
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

</script>
</head>
<body>
<div id="body">
	<div id="header">
    	<div class="wrapper">
    		<a class="logo" >
    			<img width="229" height="43" alt="公司主页" src="style/images/logo.png">
    		</a>
    		<ul id="navheader" class="reset">
    			<li class="current"><a href="myhome.do?name=${sessionScope.username}">公司</a></li>
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
        <!-- <script src="style/js/swfobject_modified.js" type="text/javascript"></script> -->
        <div class="clearfix">
        				
            <div class="content_l">           
	                <div class="c_detail">
	                
	                	<div style="background-color:#fff;" class="c_logo">
		                	<a title="上传公司LOGO" id="logoShow"  href="#logoUploader">
		                	<img width="190" height="190" alt="公司logo" src="${hr_info.logo}" id="uploadImage">
	                        <input type="file" title="支持jpg、jpeg、gif、png格式，文件小于5M"  name="myfiles" id="myBlogImage" onchange="ajaxFileUpload()">
	                        		                        	
	                        	<span><input type="button" value="更换公司Logo" onclick="ajaxFileUpload()"><br>190px*190px 小于5M</span>
	                        </a>
		                </div>
		                
		                
		                
	                    <div class="c_box companyName">
	                    		                   			<h2 title="请填写您的公司名称">${hr_info.c_name}</h2>
	                   			                        
	                        	                        	 <%String auth =(String)session.getAttribute("auth") ;
if(auth.compareTo("认证通过")==0){%>                 			                        
	                        	<em class="valid"></em>
                        		<span class="va dn">认证企业</span>
                        		<%}else{ %>
                        		<em class="unvalid"></em>
                        		<span class="va dn">未认证企业</span>
                        		<a target="_blank" class="applyC" href="auth.jsp">申请认证</a>
                        		<%} %>
	                        	
	                        	                        <div class="clear"></div>
	                       	
	                        	                        
	                        <form class="clear editDetailss dn" id="editDetailFormss" action="updateCT.do?name=${sessionScope.username}" method="post">
	                            <input type="text" placeholder="请输入公司名称" maxlength="15"  name="companyShortName" id="companyShortName">
	                            <input type="text" placeholder="一句话描述公司优势，核心价值，限20字" maxlength="20" name="companyFeatures" id="companyFeatures">
	                            <input type="submit" value="保存" id="saveDetail" class="btn_small">
		                    </form>
	                            
	                        <div class="clear oneword"><img width="17" height="15" src="style/images/quote_l.png">&nbsp; <span>${hr_info.c_title}</span> &nbsp;<img width="17" height="15" src="style/images/quote_r.png"></div>
	                    </div>
	                    <a title="编辑基本信息" class="c_edit" id="editCompanyDetail" onclick="updateCT()"></a>
	                	<div class="clear"></div>
	                </div>
                
                	<div class="c_breakline"></div>
       
       				<div id="Product">
        					        				
	        					<div class="product_wrap">

						    		<!--无产品 -->
									<dl class="c_section dn">
					                	<dt>
					                    	<h2><em></em>公司产品</h2>
					                    </dt>
					                </dl>
	                
					            	<!--产品编辑-->
					                <dl id="newProduct" class="newProduct dn">
					                	<dt>
					                    	<h2><em></em>公司产品</h2>
					                    </dt>
					                    <dd>
					                        <form method="post" class="productFormss" action="updatePro.do?name=${sessionScope.username}">
					                            <div class="new_product">
					                            	
							                            <div class="product_upload productShow">
							                            	<img width="380" height="220" src="style/images/product_default.png">
								                        </div>
							                        
							                    	<input type="hidden" value="3" name="type" class="type"> 
							                    	<input type="hidden" value="images/product_default.png" name="productPicUrl" class="productInfos">   
							                    </div>
					                            
					                            <div class="cp_intro">
					                               	<input type="text" placeholder="请输入产品名称"  name="product" id="product">	
					                                <textarea placeholder="请简短描述该产品定位、产品特色、用户群体等" maxlength="200"  class="s_textarea" name="productProfile" id="productProfile"></textarea>	
					                                <div class="word_count fr">限 <span>200</span> 字</div>
					                                <div class="clear"></div>
					                                <input type="submit" value="保存" class="btn_small">
					                        		<input type="hidden" value="11867" class="product_id">
					                            </div>
											</form>
					                    </dd>
					                </dl>
					                <!--有产品-->
					                <dl class="c_product">
					                	<dt>
					                    	<h2><em></em>公司产品</h2>
					                    </dt>
					                    <dd>
					                    	<img width="380" height="220" alt="发大发" src="style/images/product_default.png">
				                        	<div class="cp_intro">
				                        						                        		<h3><a>${hr_info.c_pro_name}</a></h3>
					                            <div class="scroll-pane" style="overflow: hidden; padding: 0px; width: 260px;">
					                            	
					                            <div class="jspContainer" style="width: 260px; height: 140px;"><div class="jspPane" style="padding: 0px; top: 0px; width: 260px;"><div>${hr_info.c_pro_content}</div></div></div></div>
					                        </div>
					                        <a title="编辑公司产品" class="c_edit product_edit" href="javascript:void(0)"></a>
					            								                    </dd>
					                </dl>
	            
	              				</div>
       								        						    			        			</div>   <!-- end #Product --> 
       	
       				<div id="Profile">
			            				        	<div class="profile_wrap">
					             <!--无介绍 -->
									<dl class="c_section dn">
					                	<dt>
					                    	<h2><em></em>公司介绍</h2>
					                    </dt>
					                </dl>
					            <!--编辑介绍-->
					                <dl class="c_section newIntro dn">
					                    <dt>
					                        <h2><em></em>公司介绍</h2>
					                    </dt>
					                    <dd>
						                    <form id="companyDesFormss" action="updateIntroduce.do?name=${sessionScope.username}" method="post">
						                        <textarea placeholder="请分段详细描述公司简介、企业文化等" name="companyProfile" id="companyProfile"></textarea>		                                        
						                        <div class="word_count fr">你还可以输入 <span>1000</span> 字</div>
						                        <div class="clear"></div>
						                        <input type="submit" value="保存" id="submitProfile" class="btn_small">
						                        <a id="delProfile" class="btn_cancel_s" href="javascript:void(0)">取消</a>
						                    </form>
					                    </dd>
					                </dl>
					            
					            <!--有介绍-->
					               <dl class="c_section">
					               		<dt>
					                   		<h2><em></em>公司介绍</h2>
					                   	</dt>
					                   	<dd>
					                   		<div class="c_intro">${hr_info.c_introduction}</div>
					                   		<a title="编辑公司介绍" id="editIntro" class="c_edit" href="javascript:void(0)"></a>
					                   	</dd>
					               	</dl>
				            </div>
				                 	
	     			</div><!-- end #Profile -->
      	
      	<!--[if IE 7]> <br /> <![endif]-->
	    
	        	 		        	<!--无招聘职位-->
						<dl id="noJobs" class="c_section">
		                	<dt>
		                    	<h2><em></em>招聘职位</h2>
		                    </dt>
		                    <dd>
		                    	<div class="addnew">
		                        	发布需要的人才信息，让伯乐和千里马尽快相遇……<br>
		                        	<table>
		                     <tr><td>       <a href="create.do?name=${sessionScope.username}">+添加招聘职位</a></td> </tr>
		                     <tr><td>       <a href="positions.do?name=${sessionScope.username}">O管理招聘职位</a></td> </tr>
		                            </table>
		                        </div>
		                    </dd>
		                </dl>
	          	
	          	<input type="hidden" value="" name="hasNextPage" id="hasNextPage">
	          	<input type="hidden" value="" name="pageNo" id="pageNo">
	          	<input type="hidden" value="" name="pageSize" id="pageSize">
          		<div id="flag"></div>
            </div>	<!-- end .content_l -->
            
            <div class="content_r">
            	<div id="Tags">
	            	<div id="c_tags_show" class="c_tags solveWrap">
	                    <table>
	                        <tbody><tr>
	                            <td width="45">地点</td>
	                            <td>${hr_info.c_loc}</td>
	                        </tr>
	                        <tr>
	                            <td>领域</td><!-- 支持多选 -->
	                            <td>${hr_info.c_type}</td>
	                        </tr>
	                        <tr>
	                            <td>规模</td>
	                            <td>${hr_info.c_population}</td>
	                        </tr>
	                        <tr>
	                            <td>主页</td>
	                            <td>
                                ${hr_info.c_website}
            					</td>
	                        </tr>
	                    </tbody></table>
	                    <a id="editTags" class="c_edit" href="javascript:void(0)"></a>
	                </div>
	                <div id="c_tags_edit" class="c_tags editTags dn">
		                <form id="tagFormsss" action="updateBase.do?name=${sessionScope.username}" method="post">
		                    <table>
		                        <tbody><tr>
		                            <td>地点</td>
		                            <td>
		                            	<input type="text" placeholder="请输入公司地点" name="city" id="city">	
		                            </td>
		                        </tr>
		                        <tr>
		                            <td>领域</td><!-- 支持多选 -->
		                            <td>
		                            	<input type="text" placeholder="请输入公司运营领域" name="field" id="field">
		                            </td>
		                        </tr>
		                        <tr>
		                            <td>规模</td>
		                            <td>
		                            	<input type="hidden" value="150-500人" id="companySize" name="companySize">
		                            	<input type="button" value="150-500人" id="select_sca" class="select_tags">
		                                <div class="selectBox dn" id="box_sca" style="display: none;">
		                                    <ul class="reset">
		                                    <li onclick="size('少于15人')">少于15人</li>
		                            		<li onclick="size('15-50人')">15-50人</li>
	                 		       			<li onclick="size('50-150人')">50-150人</li>
    		                            	<li onclick="size('150-500人')" class="current">150-500人</li>
                         			        <li onclick="size('500-2000人')">500-2000人</li>
				                            <li onclick="size('2000人以上')">2000人以上</li>
				                            </ul>
		                                </div>	
		                            </td>
		                        </tr>
		                        <tr>
		                            <td>主页</td>
		                            <td>
                            			<input type="text" placeholder="请输入网址"  name="companyUrl" id="companyUrl">	
		                            </td>
		                        </tr>
		                    </tbody></table>
		                    <input type="hidden" id="comCity" value="">
		                    <input type="hidden" id="comInd" value="">
		                    <input type="hidden" id="comSize" value="150-500人">
		                    <input type="hidden" id="comUrl" value="">
		                    <input type="submit" value="保存" id="submitFeatures" class="btn_small">
		                    <a id="cancelFeatures" class="btn_cancel_s" href="javascript:void(0)">取消</a>
		                    <div class="clear"></div>
		            	</form>
	                </div>
       			</div><!-- end #Tags -->
       			
       			<dl class="c_section c_stages">
                	<dt>
                    	<h2><em></em>融资阶段</h2>
                    	
                    </dt>
                    
                    <dd>
                    	<ul class="reset stageshow" id="stageform1">
                    	<a title="编辑融资阶段" class="c_edit" onclick="updateFin()"></a>
                    		<li>目前阶段：<span class="c5">${hr_info.c_fin_stage}</span></li>
                    		<li>投资机构：<span class="c5">${hr_info.c_fin_name}</span></li>
                    		                    	</ul>
                    	<form class="dn" id="stageform2" action="updatefinance.do?name=${sessionScope.username}" method="post">
                    		<div class="stageSelect">
                    			<label>目前阶段</label>
                    			<input type="hidden" value="天使轮" id="financeStage" name="financeStage">
	                         	<input type="button" value="天使轮" id="select_fin" class="select_tags_short fl">
	                            <div class="selectBoxShort dn" id="box_fin" style="display: none;">
	                                 <ul class="reset">
	                                 		                                 		
		                                 						                           			<li onclick="stages()">未融资</li>
				                           					                           		
	                                     	                                 		
		                                 						                           			<li class="current" onclick="stage('天使轮')">天使轮</li>
				                           					                           		
	                                     	                                 		
		                                 						                           			<li onclick="stage('A轮')">A轮</li>
				                           					                           		
	                                     	                                 		
		                                 						                           			<li onclick="stage('B轮')">B轮</li>
				                           					                           		
	                                     	                                 		
		                                 						                           			<li onclick="stage('C轮')">C轮</li>
				                           					                           		
	                                     	                                 		
		                                 						                           			<li onclick="stage('D轮及以上')">D轮及以上</li>
				                           					                           		
	                                     	                                 		
		                                 						                           			<li onclick="stage('上市公司')">上市公司</li>
				                           					                           		
	                                     	                                 </ul>
	                             </div>	
                    		</div>	
                    		<div>
	                    	<ul id="stagesList" class="reset">
		                    	<li>
				                    <label>投资机构</label>
				                    <input type="text" placeholder="如真格基金" name="stageorg" id="stageorg">
		                    	</li>
		                    </ul>
		                    </div>
		                    <input type="submit" value="保存" class="btn_small">
		                    <div class="clear"></div>
		                    
		                    
		                </form>
                    </dd>
                </dl><!-- end .c_stages -->
       				
	      
	       		<div id="Member">		
		                <dl class="c_section c_member">
		                	<dt>
		                    	<h2><em></em>联系人</h2>
	                    	</dt>
		                    <dd> 
		                    			                    				                    
			       					<div class="member_wrap">
			       						
				                        <div class="member_info addnew_right dn">
				                        </div>
				                        
				                        <!-- 编辑创始人 -->
		                        		<div class="member_info newMember dn" id="contact1">
			                        		<form class="memberFormss" action="updateContact.do?name=${sessionScope.username}" method="post">
						                        <input type="text" placeholder="请输入联系人姓名" id="cooname" name="cooname">	
					                            <input type="text" placeholder="请输入联系方式"  name="contactInfo" id="contactInfo">	
					                            <div class="clear"></div>
					                            <input type="submit" value="保存" class="btn_small">
				                        		<input type="hidden" value="11493" class="leader_id">
				                        	</form>
				                        </div>
				                        
				                        <!-- 显示创始人 -->
				                    	<div class="member_info" id="contact2">
	                    					<a title="编辑联系人" class="c_edit member_edit" onclick="contact()"></a>
				                            <dl class="c_section c_stages">
				                            <ul class="reset stageshow">
                    		<li>${hr_info.c_con_name}<span class="c5"></span></li>
                    		<li>${hr_info.c_con_cont}<span class="c5"></span></li>
                    		                    	</ul>
                    		                    	</dl>
				                        </div>
				                        
				                     </div><!-- end .member_wrap -->
				                     				                 		                    </dd>
		                </dl>
		       			       	</div> <!-- end #Member -->
	       	
	       	
	       <!--公司标签-->
            <div id="Reported">	
	            		            <!--无报道-->
		            <dl class="c_section c_reported">
		            	<dt>
		                	<h2><em></em> 公司标签</h2>
                   			<a title="添加报道" class="c_add" href="javascript:void(0)"></a>
		                </dt>
		                
		                
		                <dd>
		                	<!-- 编辑标签 -->
                       		<ul class="reset">
                       		<c:forEach items="${TagList}" var="temp">
                       		<li>
		                			<a style="" class="article" id="">${temp.ctag_content}</a>
		                			<a title="删除标签" class="c_edit dn" onclick="del('${temp.ct_id}','${sessionScope.username}')" href="javascript:;" style="display: inline;"></a>
		                    </li>
		                    </c:forEach>
		                	</ul>
		                	<ul class="newReport dn">
	                        	<li>
		                			<a style="display:none;" class="article" title="" target="_blank" ></a>
		                			<a title="添加标签" class="c_edit dn" href="javascript:;"></a>
		                			<form class="reportFormss" action="insertTag.do?name=${sessionScope.username}" method="post">
		                				<input type="text" placeholder="添加标签" value="" name="articleTitle" id="articleTitle">
		                				<input type="text" placeholder="" value="" name="articleUrl" style="display: none;">
		                				<input type="submit" value="保存" class="btn_small">
			                            <a class="btn_cancel_s report_cancel" href="javascript:;">取消</a>
			                            <input type="hidden" value="" class="article_id">
			                     	</form>
		                		</li>
	                        </ul>
				        </dd>
		            </dl><!-- end .c_reported -->
		                    </div><!-- end #Reported -->
	       	
        </div>
   	</div>

<!-------------------------------------弹窗lightbox  ----------------------------------------->
<div style="display:none;">
	<div style="width:650px;height:470px;" class="popup" id="logoUploader">
		<object width="650" height="470" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="FlashID">
		  <param value="../../flash/avatar.swf?url=http://www.lagou.com/cd/saveProfileLogo.json" name="movie">
		  <param value="high" name="quality">
		  <param value="opaque" name="wmode">
		  <param value="111.0.0.0" name="swfversion">
		  <!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
		  <param value="../../Scripts/expressInstall.swf" name="expressinstall">
		  <!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
		  <!--[if !IE]>-->
		  <object width="650" height="470" data="../../flash/avatar.swf?url=http://www.lagou.com/cd/saveProfileLogo.json" type="application/x-shockwave-flash">
		    <!--<![endif]-->
		    <param value="high" name="quality">
		    <param value="opaque" name="wmode">
		    <param value="111.0.0.0" name="swfversion">
		    <param value="../../Scripts/expressInstall.swf" name="expressinstall">
		    <!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 -->
		    <div>
		      <h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
		      <p><a href="http://www.adobe.com/go/getflashplayer"><img width="112" height="33" src="style/images/get_flash_player.gif" alt="获取 Adobe Flash Player"></a></p>
		    </div>
		    <!--[if !IE]>-->
		  </object>
		  <!--<![endif]-->
		</object>
	</div><!-- #logoUploader -->
</div>
<!------------------------------------- end ----------------------------------------->

<script src="style/js/company.min.js" type="text/javascript"></script>
<script>
var avatar = {};
avatar.uploadComplate = function( data ){
	var result = eval('('+ data +')');
	if(result.success){
		jQuery('#logoShow img').attr("src",ctx+ '/'+result.content);
		jQuery.colorbox.close();
	}
};
</script>
			<div class="clear"></div>
			<input type="hidden" value="d1035b6caa514d869727cff29a1c2e0c" id="resubmitToken">
	    	<a rel="nofollow" title="回到顶部" id="backtop" style="display: inline;"></a>
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