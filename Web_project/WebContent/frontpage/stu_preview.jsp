<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html><head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>简历预览-我的简历-拉勾网-最专业的互联网招聘平台</title>
<meta content="23635710066417756375" property="qc:admins">
<meta name="description" content="拉勾网是3W旗下的互联网领域垂直招聘网站,互联网职业机会尽在拉勾网">
<meta name="keywords" content="拉勾,拉勾网,拉勾招聘,拉钩, 拉钩网 ,互联网招聘,拉勾互联网招聘, 移动互联网招聘, 垂直互联网招聘, 微信招聘, 微博招聘, 拉勾官网, 拉勾百科,跳槽, 高薪职位, 互联网圈子, IT招聘, 职场招聘, 猎头招聘,O2O招聘, LBS招聘, 社交招聘, 校园招聘, 校招,社会招聘,社招">

<meta content="QIQ6KC1oZ6" name="baidu-site-verification">

<!-- <div class="web_root"  style="display:none">h</div> -->
</script><script type="text/javascript">
var ctx = "h";
console.log(1);
</script>
<link href="h/images/favicon.ico" rel="Shortcut Icon">
<link href="style/css/style.css" type="text/css" rel="stylesheet">
<link href="style/css/colorbox.min.css" type="text/css" rel="stylesheet">
<link href="style/css/popup.css" type="text/css" rel="stylesheet">

<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>

<script src="style/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script>
$(function(){
	 $("body").on("click","a.btn_s",function(){
		$.colorbox.close();
		parent.jQuery.colorbox.close();
	});
	$(".inline").colorbox({
		inline:true
	});
});
</script>
<script src="style/js/ajaxCross.json" charset="UTF-8"></script></head>

<body>
  	<div id="previewWrapper">
        <div class="preview_header">
            <h1 title="jason的简历">${stu_info.stu_jianli_title}</h1>
                    </div><!--end .preview_header-->

        <div class="preview_content">
            <div class="profile_box" id="basicInfo">
                <h2>基本信息</h2>
                <div class="basicShow">
                   <span>${stu_info.stu_name} | 
                    ${stu_info.stu_sex} |                     ${stu_info.stu_college}    
            		            			 <br>
            			            				${stu_info.stu_exp_pos}<br>
            			            			${stu_info.stu_tel} | ${stu_info.stu_email}<br>
            			
            		</span>
           			<div class="m_portrait">
                    	<div></div>
                    	<img width="120" height="120" alt="jason" src="${stu_info.stu_profile}">
                    </div>
                </div><!--end .basicShow-->
            </div><!--end #basicInfo-->
			
				            <div class="profile_box" id="expectJob">
	                <h2>期望工作</h2>
	                <div class="expectShow">
	                	${stu_info.stu_exp_city}，${stu_info.stu_exp_type}，月薪${stu_info.stu_exp_salary}，${stu_info.stu_exp_pos}
	                </div><!--end .expectShow-->
	            </div><!--end #expectJob-->
						
				            <div class="profile_box" id="workExperience">
	                <h2>实习或工作经历</h2>
	                <div class="experienceShow">
	                  <ul class="wlist clearfix">
	                  	                    	           				            				<li class="clear">
            					           					<span class="c9">${stu_info.stu_work_sta_y}.${stu_info.stu_work_sta_m}-${stu_info.stu_work_end_y}.${stu_info.stu_work_end_m}</span>
	           					<div>
	           			职位：			${stu_info.stu_work_pos} <br>
	           			公司名称：			${stu_info.stu_work_name}
	           					</div>
	           				</li>
	           					          				                  </ul>
	                </div><!--end .experienceShow-->
	            </div><!--end #workExperience-->
			
				            <div class="profile_box" id="projectExperience">
	                <h2>项目经验</h2>
	                <div class="projectShow">
	                  <ul class="plist clearfix">
	                  			            				            					            				<li class="noborder">
	            					            					<div class="projectList">
		            					<div class="f16 mb10">项目名称:${stu_info.stu_inter_name}
		            						<span class="c9">
		            									            								（${stu_info.stu_inter_sta_y}.${stu_info.stu_inter_sta_m}-${stu_info.stu_inter_end_y}.${stu_info.stu_inter_end_m}）
		            									            						</span>
		            									            						<br>
		            									            						项目描述：${stu_info.stu_inter_descr}
		            					</div>
		            							            					<div class="dl1"></div>
		            							            				</div>
	            				</li>
	            				            				                      </ul>
	                </div><!--end .projectShow-->
	            </div><!--end #projectExperience-->
						
				            <div class="profile_box" id="educationalBackground">
	                <h2>教育背景</h2>
	                <div class="educationalShow">
	                  <ul class="elist clearfix">
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
	            				<%} %>
	            			</tbody></table>
            				           					                  </ul>
	                </div><!--end .educationalShow-->
	            </div><!--end #educationalBackground-->
						
				            <div class="profile_box" id="selfDescription">
	                <h2>自我描述</h2>
	                <div class="descriptionShow">
	            	${stu_info.stu_descr}
	                </div><!--end .descriptionShow-->
	            </div><!--end #selfDescription-->
						
			        </div><!--end .preview_content-->
  	</div><!--end #previewWrapper-->

<!-------------------------------------弹窗lightbox ----------------------------------------->

<!------------------------------------- end ----------------------------------------->  




<div id="cboxOverlay" style="display: none;"></div><div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;"><div id="cboxWrapper"><div><div id="cboxTopLeft" style="float: left;"></div><div id="cboxTopCenter" style="float: left;"></div><div id="cboxTopRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxMiddleLeft" style="float: left;"></div><div id="cboxContent" style="float: left;"><div id="cboxTitle" style="float: left;"></div><div id="cboxCurrent" style="float: left;"></div><button type="button" id="cboxPrevious"></button><button type="button" id="cboxNext"></button><button id="cboxSlideshow"></button><div id="cboxLoadingOverlay" style="float: left;"></div><div id="cboxLoadingGraphic" style="float: left;"></div></div><div id="cboxMiddleRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxBottomLeft" style="float: left;"></div><div id="cboxBottomCenter" style="float: left;"></div><div id="cboxBottomRight" style="float: left;"></div></div></div><div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div></div></body></html>