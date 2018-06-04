<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'mainRight.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	
	<style type="text/css">
		h1{
			text-align:center;
    		margin-left:auto;
			margin-right:auto;
		}
	</style>
  </head>
  
  <body>
  	<div style="position: absolute; top: 20px; right: 20px;">欢迎  <a href="${pageContext.request.contextPath}/userModify.jsp">${user.username}</a>  进入XXX图示管理系统   | <a href="${pageContext.request.contextPath}/login.jsp" target="_top">退出</a></div>
    <h1>欢迎使用XXX图书管理系统</h1>
  </body>
</html>
