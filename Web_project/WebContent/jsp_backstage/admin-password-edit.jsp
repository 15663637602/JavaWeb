<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="js/html5.js"></script>
<script type="text/javascript" src="js/respond.min.js"></script>
<script type="text/javascript" src="js/PIE_IE678.js"></script>
<![endif]-->
<link type="text/css" rel="stylesheet" href="jsp_backstage/css/H-ui.css"/>
<link type="text/css" rel="stylesheet" href="jsp_backstage/css/H-ui.admin.css"/>
<link type="text/css" rel="stylesheet" href="jsp_backstage/font/font-awesome.min.css"/>
<!--[if IE 7]>
<link href="font/font-awesome-ie7.min.css" rel="stylesheet" type="text/css" />
<![endif]-->
<title>修改管理员信息</title>
</head>
<body>
<div class="pd-20">
  <form  class="Huiform" id="loginform" action="updateAdminInfo.do?name=${name_b}" method="post"  target="_parent" >
    <table class="table table-border table-bordered table-bg">
      <thead>
        <tr>
          <th colspan="2">修改信息</th>
        </tr>
      </thead>
      <tbody>
         <tr>
          <th class="text-r" width="30%">用户名：</th>
          <td><span id="span_name">${name_b}</span>
          </td>
        </tr> 
        <tr>
          <th class="text-r" width="30%">权限变更：</th>
          <td>
          <select class="select" id="status_b" name="status_b">
      <option value="就业负责人">就业负责人</option>
      <option value="系统管理员">系统管理员</option>
    </select>
          </td>
        </tr> 
        <tr>
          <th class="text-r">新密码：</th>
          <td><input name="newpassword" id="newpassword" class="input-text" type="password"  value="${pass_b}" placeholder="设置密码" tabindex="2" datatype="*6-16"  nullmsg="请输入您的新密码！" errormsg="4~16个字符，区分大小写！" >
          <span id="pass1"></span> 
          </td>
        </tr>
        <tr>
          <th class="text-r">再次输入新密码：</th>
          <td><input name="newpassword2" id="newpassword2" class="input-text" type="password"  value="${pass_b}"  placeholder="确认新密码" tabindex="3" datatype="*" recheck="newpassword" nullmsg="请再输入一次新密码！" errormsg="您两次输入的新密码不一致！"> 
          <span id="pass2"></span> 
          </td>
        </tr>
        <tr>
          <th></th>
          <td>
            <button type="submit" class="btn btn-success radius" id="admin-password-save" name="admin-password-save"><i class="icon-ok"></i> 确定</button>
          </td>
        </tr>
      </tbody>
    </table>
  </form>
</div>
<script type="text/javascript" src="jsp_backstage/js/jquery.min.js"></script>
<script type="text/javascript" src="jsp_backstage/js/Validform_v5.3.2_min.js"></script> 
<script type="text/javascript" src="jsp_backstage/js/H-ui.js"></script> 
<script type="text/javascript" src="jsp_backstage/js/H-ui.admin.js"></script> 
<script type="text/javascript">
$(".Huiform").Validform(); 
</script>

</body>
</html>