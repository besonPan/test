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
    
    <title>My JSP 'bookDetail.jsp' starting page</title>
    
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
			width: 990px;
			
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
		.detail {
			font-size: 14px;
		}
		.button {
			margin-left: 500px;
			margin-top: 20px;
		}
	</style>
	
	<script type="text/javascript" src="JQ/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#button').click(function(){
				borrow();
			});
			$('#button1').click(function(){
				deletebook();
			});
		});
		
		function borrow(){
			var id = ${param.id};
			$.ajax({
				url : '${pageContext.request.contextPath}/book/borrow',
				type : 'post',
				dataType : 'json',
				data : {
					'id' : id
				},
				success : function(mess){
					if(mess.back == 1){
						alert("借书成功！！！");
					}else if(mess.back == 0){
						alert("你不具备借书的条件！！！");
					}else{
						alert("此书已被借出！！！");
					}
				}
			});
		}
		
		function deletebook(){
			var id = ${param.id};
			$.ajax({
				url : '${pageContext.request.contextPath}/book/deleteBook',
				type : 'post',
				dataType : 'json',
				data : {
					'id' : id
				},
				success : function(mess){
					if(mess.back == 1){
						alert("删除成功！！！");
						window.location.href = "${pageContext.request.contextPath}/checkbook.jsp";
					}else{
						alert("此书已借出，不允许删除！！！");
					}
				}
			});
		}
	</script>
  </head>
  
  <body>
  	<h1>图书详情</h1>
  	<div style="position: absolute; top: 20px; right: 20px;">欢迎  <a href="${pageContext.request.contextPath}/userModify.jsp">${user.username}</a>  进入XXX图示管理系统  | <a href="${pageContext.request.contextPath}/login.jsp" target="_top">退出</a></div>
    <ul>
	    <li>
	    <c:set var="type" value="${param.type}"></c:set>
	    <c:choose>
   			<c:when test="${type == '哲学'}">
   				<img src="images/a${param.id}.jpg" alt="" width="200px">
   			</c:when>
   			<c:when test="${type == '文学'}">
   				<img src="images/b${param.id}.jpg" alt="" width="200px">
   			</c:when>
   			<c:when test="${type == '科学与自然'}">
   				<img src="images/c${param.id}.jpg" alt="" width="200px">
   			</c:when>
   			<c:when test="${type == '历史'}">
   				<img src="images/d${param.id}.jpg" alt="" width="200px">
   			</c:when>
   			<c:when test="${type == '励志与成功'}">
   				<img src="images/e${param.id}.jpg" alt="" width="200px">
   			</c:when>
   			<c:when test="${type == '法律'}">
   				<img src="images/f${param.id}.jpg" alt="" width="200px">
   			</c:when>
   			<c:when test="${type == '心理'}">
   				<img src="images/g${param.id}.jpg" alt="" width="200px">
   			</c:when>
   			<c:when test="${type == '政治与军事'}">
   				<img src="images/h${param.id}.jpg" alt="" width="200px">
   			</c:when>
   			<c:when test="${type == '健康与养生'}">
   				<img src="images/i${param.id}.jpg" alt="" width="200px">
   			</c:when>
   			<c:when test="${type == '计算机与互联网'}">
   				<img src="images/j${param.id}.jpg" alt="" width="200px">
   			</c:when>
   			<c:when test="${type == '艺术'}">
   				<img src="images/k${param.id}.jpg" alt="" width="200px">
   			</c:when>
   			<c:when test="${type == '儿童读物'}">
   				<img src="images/l${param.id}.jpg" alt="" width="200px">
   			</c:when>
   			<c:when test="${type == '恋爱和婚姻'}">
   				<img src="images/m${param.id}.jpg" alt="" width="200px">
   			</c:when>
   		</c:choose>
	    	<p class="top">${param.name}</p>
	    	<p class="bottom">
	    		<span class="left">${param.author}</span>
	    		<span class="right">${param.press}</span>
	    	</p>
		</li>
		<div>
			<h2>图书类型：${param.type}</h2>
			<h4>简介：</h4>
			<span class="detail">${param.detail}</span>
		</div>
	</ul>
	<button type="button" id="button" class="button"><h3>借阅图书</h3></button>
	<button type="button" id="button1"><h3>删除图书</h3></button>
	<a href="${pageContext.request.contextPath}/checkbook.jsp"><button type="button" id="button"><h3>返回</h3></button></a>
  </body>
</html>
