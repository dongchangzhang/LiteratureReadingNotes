<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="sources/css/animate.css" rel="stylesheet" type="text/css">
<link href="sources/css/bootstrap.min.css" rel="stylesheet">
<link href="sources/css/bootstrap-theme.min.css" rel="stylesheet">
<script src="sources/js/jquery-3.1.1.min.js"></script>
<script src="sources/js/bootstrap.min.js"></script>
<script src="sources/js/modernizr.custom.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>提示信息</title>
	<style>
		.city {
		margin:0 auto;
		height: 300px;
	 	width: 500px;
		
		padding: 50px;			
	} 
	</style>
	<script type="text/javascript"> 
		var t=3;
		setInterval("refer()",1000);  
		function refer(){  
	    if(t==0){ 
	        location="personalcenter.jsp";
	    } 
	    document.getElementById('show').innerHTML=""+t+"秒后跳转到个人中心";
	    t--; 
	    if (t < 0) {
	    	t = 3;
	    }
	} 
	</script> 
</head>
	<body >
	<div style="position:absolute; width:100%; height:100%; z-index:-1; left:0; top:0;">      
    <img src="sources/pics/bg11.jpg" style="left:0; position:fixed;top:0;" width="100%" height="100%">      
    </div>

	<div class="city" style="text-align:center;">
	<!-- 返回成功信息 -->
		<% String a = (String)request.getAttribute("flag"); %>
		<% if (a == "TRUE"){%>					
		<div class="alert  animated wobble"  style="background-color: rgba(255,255,255,	 0.60);">
			<a href="#" class="close" data-dismiss="alert" >
			&times;
			 </a>
			 <span id="show"></span> 
			 <h3><strong>成功！</strong></h3>
			 <a href="personalcenter.jsp">点击这里返回个人中心</a><br>
			 <a href="mainpage.jsp">点击这里返回个人主页</a><br>
		</div>
		<%} else {%>
			<div class="alert animated wobble" style="background-color:#d8d8d8;">
				 <a href="#" class="close" data-dismiss="alert">
					 &times;
				 </a>
				 <span id="show"></span> 
				 <h3> <strong>失败！</strong></h3>
				  <a href="personalcenter.jsp">点击这里返回个人中心</a><br>
				  <a href="mainpage.jsp">点击这里返回个人主页</a><br>
			</div>
		<%} %>
</div>
</body>
</html>