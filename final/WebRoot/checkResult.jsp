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
    
    <title>My JSP 'detail.jsp' starting page</title>
    
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
		body {
			background: #f1f1f1;
		}
		ul {
			padding-left: 30px;
			width: 1000px;
			
			overflow: hidden;
			background: #fff;
		}
		li {
			width: 200px;
			height: 304px;
			margin-top: 28px;
			margin-right: 8px;
			float: left;
			border: 1px solid transparent;
			position: relative;
			background: #f5f5f5;
		}
		p {
			width:180px;
			font-size: 12px;
			color: black;
			text-align: center;
		}
		.left {
			float: left;
			font-size: 12px;
			color: #F40;
			font-weight: bold;
		}
		.right {
			float: right;
			color: #9ca0aa;
			margin-top: 3px;
			font-size: 10px;
		}
		.top {
			padding: 3px 12px;
			line-height: 18px;
		}
		.bottom {
			margin-top: 8px;
			padding: 0 13px;
		}
	</style>

  </head>
  
  <body>
  	<h1>图书查询</h1>
  	<div style="position: absolute; top: 20px; right: 20px;">欢迎  <a href="${pageContext.request.contextPath}/userModify.jsp">${user.username}</a>  进入XXX图示管理系统  | <a href="${pageContext.request.contextPath}/login.jsp" target="_top">退出</a></div>
  	<form action="${pageContext.request.contextPath}/book/check" method="post">
    	<input type="text" name="bookname" id="bookname" placeholder="可用书名或类别名查找" class="check">
    	<input type="submit" class="button" value="搜索">
    </form>
    <ul>
    <c:forEach items="${bookList}" var="bl">
    	<li>
	    	<a href="${pageContext.request.contextPath}/bookDetail.jsp?id=${bl.id}&name=${bl.name}&type=${bl.type}&author=${bl.author}&press=${bl.press}&detail=${bl.detail}">
	    		<c:choose>
	    			<c:when test="${bl.type == '哲学'}">
	    				<img src="images/a${bl.id}.jpg" alt="" width="200px">
	    			</c:when>
	    			<c:when test="${bl.type == '文学'}">
	    				<img src="images/b${bl.id}.jpg" alt="" width="200px">
	    			</c:when>
	    			<c:when test="${bl.type == '科学与自然'}">
	    				<img src="images/c${bl.id}.jpg" alt="" width="200px">
	    			</c:when>
	    			<c:when test="${bl.type == '历史'}">
	    				<img src="images/d${bl.id}.jpg" alt="" width="200px">
	    			</c:when>
	    			<c:when test="${bl.type == '励志与成功'}">
	    				<img src="images/e${bl.id}.jpg" alt="" width="200px">
	    			</c:when>
	    			<c:when test="${bl.type == '法律'}">
	    				<img src="images/f${bl.id}.jpg" alt="" width="200px">
	    			</c:when>
	    			<c:when test="${bl.type == '心理'}">
	    				<img src="images/g${bl.id}.jpg" alt="" width="200px">
	    			</c:when>
	    			<c:when test="${bl.type == '政治与军事'}">
	    				<img src="images/h${bl.id}.jpg" alt="" width="200px">
	    			</c:when>
	    			<c:when test="${bl.type == '健康与养生'}">
	    				<img src="images/i${bl.id}.jpg" alt="" width="200px">
	    			</c:when>
	    			<c:when test="${bl.type == '计算机与互联网'}">
	    				<img src="images/j${bl.id}.jpg" alt="" width="200px">
	    			</c:when>
	    			<c:when test="${bl.type == '艺术'}">
	    				<img src="images/k${bl.id}.jpg" alt="" width="200px">
	    			</c:when>
	    			<c:when test="${bl.type == '儿童读物'}">
	    				<img src="images/l${bl.id}.jpg" alt="" width="200px">
	    			</c:when>
	    			<c:when test="${bl.type == '恋爱和婚姻'}">
	    				<img src="images/m${bl.id}.jpg" alt="" width="200px">
	    			</c:when>
	    		</c:choose>
	    	</a>
	    		<p class="top">${bl.name}</p>
	    		<p class="bottom">
	    			<span class="left">${bl.author}</span>
	    			<span class="right">${bl.press}</span>
	    		</p>
	  	</li>
    </c:forEach>
    </ul>
  </body>
</html>
