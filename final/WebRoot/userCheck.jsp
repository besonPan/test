<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userCheck.jsp' starting page</title>
    
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
		.check{
			position:absolute;
			left:50%;
			margin-left:-100px;
		}
		.button{
			position:absolute;
			left:55%;
		}
		*{
			list-style: none;
			margin: 0px;
			padding: 0px;
		}
		ul {
			padding-left: 30px;
			width: 1000px;
			
			overflow: hidden;
			background: #fff;
		}
		li {
			width: 200px;
			height: 150px;
			margin-top: 28px;
			margin-right: 8px;
			float: left;
			border: 1px solid transparent;
			position: relative;
			background: #f5f5f5;
		}
		p {
			margin-bottom: 10px;
		}
		#userid {
			display: none
		}
		#userid1 {
			display: none
		}
	</style>
  </head>
  
  <body>
    <h1>图书查询</h1>
  	<div style="position: absolute; top: 20px; right: 20px;">欢迎  <a href="${pageContext.request.contextPath}/userModify.jsp">${user.username}</a>  进入XXX图示管理系统  | <a href="${pageContext.request.contextPath}/login.jsp" target="_top">退出</a></div>
  	<form action="${pageContext.request.contextPath}/user/check" method="post">
    	<input type="text" name="username" id="username" placeholder="查找用户" class="check">
    	<input type="submit" class="button" value="搜索">
    </form>
    <ul>
    <c:forEach items="${userList}" var="ul">
    	<li>
	    	<p>用户名：${ul.username}</p>
	    	<c:set var="abandon" scope="session" value="${ul.abandon}"/>  
	    	<c:choose>
		    	<c:when test="${abandon == 1}">
		    		<p>是否有权限：是</p>
		    	</c:when>
		    	<c:otherwise>
		    		<p>是否有权限：否</p>
		    	</c:otherwise>
	    	</c:choose>
	    	<form action="${pageContext.request.contextPath}/user/deleteUser" method="post">
	    		<input type="text" name="userid" id="userid" value="${ul.id}">
	    		<button type="submit" id="deleteButton">删除</button>
	    	</form>
	    	<form action="${pageContext.request.contextPath}/user/openUser" method="post">
	    		<input type="text" name="userid1" id="userid1" value="${ul.id}">
	    		<button type="submit" id="openButton">解除权限</button>
	    	</form>
	    	
	  	</li>
    </c:forEach>    
    </ul>
  </body>
</html>
