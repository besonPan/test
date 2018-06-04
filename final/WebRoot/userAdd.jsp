<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加用户信息</title>
    <style type="text/css">
    	h1{
    		text-align:center;
    		margin-left:auto;
			margin-right:auto;
    	}
    	.modifyDiv{
	        width:300px;  
		    height:400px;  
		    position:absolute;  
		    left:50%;  
		    top:35%;  
		    margin:-200px 0 0 -200px;
		}
		.text_1{
			width: 200px;
		    height: 20px;
		}
		.save{
		    margin-top: 20px;
		}
		
    </style>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript" src="JQ/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#button').click(function(){
				if($("input[name=username]") != null && $("input[name=password]") != null){
					addAjax();
				}
			});
		});
		
		function addAjax(){
			var username = $("input[name=username]").val();
			var password = $("input[name=password]").val();
			var sex = $("#sex").val();
			var address = $("input[name=address]").val();
			var phone = $("input[name=phone]").val();
			var role = $("#role").val();
			$.ajax({
				url : '${pageContext.request.contextPath}/user/add',
				type : 'post',
				data : {
					'username' : username,
					'password' : password,
					'sex' : sex,
					'address' : address,
					'phone' : phone,
					'role' : role
				},
				success : function(mess){
					if(mess.code == 1){
						alert("添加成功!!!");
					}else{
						alert("添加失败!!!");
					}
				}
			});
		}
	</script>

  </head>
  
  <body>
    <div style="position: absolute; top: 20px; right: 20px;">欢迎  <a href="${pageContext.request.contextPath}/userModify.jsp">${user.username}</a>  进入XXX图示管理系统  | <a href="${pageContext.request.contextPath}/login.jsp" target="_top">退出</a></div>
  	<div class="modifyDiv">
  		<h1>添加用户信息</h1>
	  		<h4>* 用户名</h4><input type="text" name="username" id="username">
  			<h4>* 密码</h4><input type="password" name="password" id="password" class="text_1">
	  		<h4>性别</h4>
	  			<select name="sex" id="sex">
    		        <option value="1"> 男</option>
					<option value="2"> 女</option>
    		    	<option value="3"> 保密</option>
    		    </select>
    		<h4>* 权限</h4>
	  			<select name="role" id="role">
    		        <option value="0"> 管理员</option>
					<option value="1"> 普通用户</option>
    		    </select>
	  		<h4>地址</h4><input type="text" name="address" id="address" class="text_1"><br>
	  		<h4>手机</h4><input type="text" name="phone" id="phone" class="text_1"><br>
	  		<button type="button" id="button" class="save">保存</button>
  	</div>
  </body>
</html>
