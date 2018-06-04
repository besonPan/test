<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎使用XXX图书管理系统</title>
    <style type="text/css">
		body {
			text-align:center;
			margin-left:auto;
			margin-right:auto;
			background:#1D3647 url(images/final1.jpg) no-repeat 50% 0%;
		}
		.loginDiv{
	        width:200px;  
		    height:200px;  
		    position:absolute;  
		    left:50%;  
		    top:50%;  
		    margin:-100px 0 0 -100px;
		    color:white;
		}
		#username{
			margin:20px;
			text-align:center;
		}
		#password{
			margin:20px;
			text-align:center;
		}
		
	</style>	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="JQ/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#button').click(function(){
				loginAjax();
			});
		});
		
		function loginAjax(){
			var username = $("input[name='username']").val();
			var password = $("input[name='password']").val();
			$.ajax({
				url : '${pageContext.request.contextPath}/user/login',
				type : 'post',
				dataType : 'json',
				data : {
					'username' : username,
					'password' : password
				},
				success : function(mess){
					if(mess.status == 0){
						window.location.href = "${pageContext.request.contextPath}/guanliMain.jsp";
					}else if(mess.status == 1){
						window.location.href = "${pageContext.request.contextPath}/userMain.jsp";
					}
					else{
						alert("用户名或密码错误！");
					}
				}
			});
		}
	</script>
  </head>
  
  <body>
  	<div class="loginDiv">
  		<h3>XXX图书管理系统</h3>
   		用户名<input type="text" name="username" id="username">
   		密    码<input type="password" name="password" id="password">
    	<button type="button" id="button">登录</button>
    </div>
  </body>
</html>
