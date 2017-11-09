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
<title>招聘</title>
<meta property="qc:admins" content="23635710066417756375" />
<meta content="内容运营 武汉 本科 3-5年 全职 运营 大家都来了 你还在等什么！！ 立方网 北京立方网信息技术有限公司 立方网努力尝试把许多人对互联网的需求从现有的娱乐、资讯和交流平台进一步引导到文化与生活伴侣的方面." name="description">
<meta content="内容运营 武汉 本科 3-5年 全职 运营 大家都来了 你还在等什么！！ 立方网 北京立方网信息技术有限公司 立方网努力尝试把许多人对互联网的需求从现有的娱乐、资讯和交流平台进一步引导到文化与生活伴侣的方面." name="keywords">
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
<script src="style/js/jquery-hbzx.js" type="text/javascript"></script>
<!--[if lte IE 8]>
    <script type="text/javascript" src="style/js/excanvas.js"></script>
<![endif]-->
<script type="text/javascript">
var youdao_conv_id = 271546; 
</script> 
<script type="text/javascript" src="style/js/conv.js"></script>
</head>
<body>
<div id="body">
	<div id="header">
    	<div class="wrapper">
    		<a  class="logo">
    			<img src="style/images/logo.png" width="229" height="43" alt="招聘" />
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
                <div class="clearfix">
            <div class="content_l">
            	                <dl class="job_detail">
                    <dt>
                        <h1 title="内容运营">
                            <em></em>
                                                        	<div>${hif_Info.c_name}招聘</div>
                           	                           	${pif_Info.p_name}
                        </h1>
                        
                                               	
           	                      </dt>
                    <dd class="job_request">
                    	<span class="red">${pif_Info.p_low_salary}k-${pif_Info.p_high_salary}k</span>
                       	<span>${pif_Info.p_loc}</span> 
                       	<span>${pif_Info.p_degree}</span> 
                       	<span>${pif_Info.p_type}</span><br />
                      	  职位诱惑 :${pif_Info.p_charm}
                      	<div>发布时间：${pif_Info.date}</div>
                    </dd>
                    <dd class="job_bt">
                        <h3 class="description">职位描述</h3>
                        <p>岗位职责： <br />${pif_Info.p_descr}</p>
<p>&nbsp;岗位要求： <br />${pif_Info.p_demand}</p>
                    </dd>
                    
                </dl>
                                <div id="weibolist"></div>
            </div>	
            <div class="content_r">
                <dl class="job_company">
                    <dt>
                    	<a href="${hif_Info.c_website}" target="_blank">
                            <img class="b2" src="${hif_Info.logo}" width="80" height="80" alt="北京立方网信息技术有限公司" />
                            <div>
                                <h2 class="fl">
                                	                                  		${hif_Info.c_name}(${hif_Info.auth})
                                </h2>
                            </div>
                        </a>
                    </dt>
<dd>
                    	<ul class="c_feature reset">
                        	<li><span>领域</span> ${hif_Info.c_type}</li>
                        	<li><span>规模</span> ${hif_Info.c_population}</li>
                        	<li>
                        		<span>主页</span> 
                        		           							<a href="${hif_Info.c_website}" target="_blank"  rel="nofollow">${hif_Info.c_website}</a>
                       	  </li>
                        </ul>
                        
                        <h4>发展阶段</h4>
                        <ul class="c_feature reset">
                        	<li><span>目前阶段</span> ${hif_Info.c_fin_stage}</li>
                        	                        	<li><span>投资机构</span>${hif_Info.c_fin_name}</li>
  </ul>
                        
                        	                    	<h4>公司著名产品</h4>
	                        <ul class="c_feature reset">
	                        		                        		<li><span>${hif_Info.c_pro_name}</span></li>
  </ul>
                                                
                       	<h4>公司标签</h4>
                        <ul class="company_tags reset" id="hasLabels">
                        <c:forEach items="${TagList}" var="temp">
                        	                            	<li><span>${temp.ctag_content}</span></li>
                        	                            	</c:forEach>
                        </ul>
                       
                       	
 </div></div></div>                      	                       	
                   

<script type="text/javascript" src="style/js/job_detail.js"></script>
<script type="text/javascript" src="style/js/count.js"></script>


			<div class="clear"></div>
			<input type="hidden" id="resubmitToken" value="6e1925fdbe7142468f154abd1d33f5a8" />
	    	<a id="backtop" title="回到顶部" rel="nofollow"></a>
	    <!-- end #body -->
	

<script type="text/javascript" src="style/js/core.min.js"></script>
<script type="text/javascript" src="style/js/popup.min.js"></script>

<!--  -->

</body>
</html>