<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图书信息</title>
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
		    top:30%;  
		    margin:-200px 0 0 -200px;
		}
		.text_1{
			width: 200px;
		    height: 20px;
		    margin-top : -20px;
		}
		.save{
		    margin-top: 20px;
		}
		
    </style>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript" src="JQ/jquery.min.js"></script>
	<script type="text/javascript" src="JQ/calenderJS.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#button').click(function(){
					addAjax();
			});
		});
		
		function addAjax(){
			var bookname = $("input[name=bookname]").val();
			var author = $("input[name=author]").val();
			var type = $("#type").val();
			var press = $("input[name=press]").val();
			var publishdate = $("input[name=publishdate]").val();
			var detail = $("input[name=detail]").val();
			$.ajax({
				url : '${pageContext.request.contextPath}/book/addBook',
				type : 'post',
				data : {
					'bookname' : bookname,
					'author' : author,
					'type' : type,
					'press' : press,
					'publishdate' : publishdate,
					'detail' : detail,
				},
				success : function(mess){
					if(mess.code == 1){
						alert("添加成功!!!");
						window.location.href = "${pageContext.request.contextPath}/upload.jsp";
					}else{
						alert("添加失败!!!相关信息不允许为空");
					}
				}
			});
		}
	</script>

  </head>
  
  <body>
    <div style="position: absolute; top: 20px; right: 20px;">欢迎  <a href="${pageContext.request.contextPath}/userModify.jsp">${user.username}</a>  进入XXX图示管理系统  | <a href="${pageContext.request.contextPath}/login.jsp" target="_top">退出</a></div>
  	<div class="modifyDiv">
  		<h1>添加图书信息</h1>
	  		<h4>书名</h4><input type="text" name="bookname" id="bookname" class="text_1">
  			<h4>作者</h4><input type="text" name="author" id="author" class="text_1">
  			<h4>类别</h4>
	  			<select name="type" id="type">
    		        <option value="哲学">哲学</option>
					<option value="文学">文学</option>
    		    	<option value="科学与自然">科学与自然</option>
    		    	<option value="历史">历史</option>
    		    	<option value="励志与成功">励志与成功</option>
    		    	<option value="法律">法律</option>
    		    	<option value="心理">心理</option>
    		    	<option value="政治与军事">政治与军事</option>
    		    	<option value="健康与养生">健康与养生</option>
    		    	<option value="计算机与互联网">计算机与互联网</option>
    		    	<option value="艺术">艺术</option>
    		    	<option value="儿童读物">儿童读物</option>
    		    	<option value="恋爱和婚姻">恋爱和婚姻</option>
    		    </select>
  			<h4>出版社</h4><input type="text" name="press" id="press" class="text_1"><br>
	  		<h4>出版时间</h4><input type="text" name="publishdate" id="publishdate" class="text_1" size="15" onFocus="HS_setDate(this);" readonly="readonly" style="background:#EEEEEE"><br>
	  		<h4>简介</h4><input type="text" name="detail" id="detail" class="text_1"><br>
	  		<button type="button" id="button" class="save">添加</button>
  	</div>
  </body>
</html>
