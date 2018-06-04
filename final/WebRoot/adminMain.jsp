<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!--String bp = ${pageContext.request.contextPath};-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>主界面</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.box {
		    width: 200px;
		    background-color: #1D3647;
		    margin-top:100px;
		}
		.menu{
			overflow:hidden;
		    border-style: solid;
		    border-width: 1px 1px 1px 1px;
		}
		/* lv1 */
		.menu li.level1 a{
		    display: block;
		    height: 28px;
		    line-height: 28px;
			font-weight:700;
			text-indent: 14px;
			border-top: 0px solid #C4D5DF;
			color: white;
		}
		.menu li.level1 a:hover{text-decoration:none;}
		.menu li.level1 a.current{background:black;}
		/* lv2 */
		.menu li ul{overflow:hidden;}
		.menu li ul.level2{display:none;}
		.menu li ul.level2 li a{
		    display: block;
		    height: 28px;
		    line-height: 28px;
			font-weight:400;
		    color: grey;;
			text-indent: 18px;
			border-top: 0px solid #ffffff;
		    overflow: hidden;
		}
		.menu li ul.level2 li a:hover{
			color:#f60;
		}
		.li_style {
		    list-style-type:none;
		    padding-top:20px;
		    
		}
		.level1{
			list-style-type:none;
			padding-top:40px;
		}
	</style>
	<script type="text/javascript" src="JQ/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
		  $(".level1 > a").click(function(){
			$(this).addClass("current")   //给当前元素添加"current"样式
			.next().show()                //下一个元素显示
			.parent().siblings().children("a").removeClass("current")        //父元素的兄弟元素的子元素<a>移除"current"样式
			.next().hide();                //它们的下一个元素隐藏
			return false;
		  });
		});
	</script>

  </head>
  
  <body>
	<div class="box">
	  <ul class="menu">
	    <li class="level1"><a href="#none">用户操作</a>
		  <ul class="level2">
		    <li class="li_style"><a href="#none">个人信息修改</a></li>
			<li class="li_style"><a href="#none">用户注销</a></li>
			<li class="li_style"><a href="#none">添加用户</a></li>
			<li class="li_style"><a href="#none">修改用户</a></li>
			<li class="li_style"><a href="#none">删除用户</a></li>
		  </ul>
		</li>
		<li class="level1">
		  <a href="#none">借阅操作</a>
		  <ul class="level2">
			<li class="li_style"><a href="#none">借书</a></li>
			<li class="li_style"><a href="#none">还书</a></li>
			<li class="li_style"><a href="#none">续借</a></li>
		  </ul>
		</li>
		<li class="level1">
		  <a href="#none">图书操作</a>
		  <ul class="level2">
			<li class="li_style"><a href="#none">图书查询</a></li>
			<li class="li_style"><a href="#none">图书上架</a></li>
			<li class="li_style"><a href="#none">图书下架</a></li>
			<li class="li_style"><a href="#none">图书修改</a></li>
		  </ul>
		</li>
	  </ul>
	</div>
	
  </body>

</html>
