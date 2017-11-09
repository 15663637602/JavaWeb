<%@ page language="java" contentType="application/msexcel" pageEncoding="utf-8"%>
<% response.setHeader("Content-disposition","inline; filename=test1.xls");%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<table class="table table-border table-bordered table-hover table-bg" id="information">
      <thead>
        <tr class="text-c">
           <th width="25"><input type="checkbox" name="" value=""></th>
        <th width="30">姓名</th>
        <th width="60">学号</th>
        <th width="50">就职单位</th>
        <th width="70">职位</th>
        <th width="60">地址</th>
        <th width="50">薪资</th>
        </tr>
      </thead>
      <tbody>
      <c:forEach items="${EnrollList1}" var="temp">
       <tr class="text-c">
       <td><input type="checkbox" value="${temp.stu_id}"id="checkbox" name="checkbox"></td>
       <td>${temp.e_name}</td>
       <td>${temp.stu_id}</td>
       <td>${temp.e_company}</td>
       <td>${temp.e_position}</td>
       <td>${temp.e_location}</td>
       <td>${temp.e_salary}</td>
      </tr>
      </c:forEach>
      </tbody>
    </table>
</body>
</html>