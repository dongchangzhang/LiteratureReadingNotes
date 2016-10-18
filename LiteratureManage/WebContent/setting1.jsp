<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LiteratureManager Welcome</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<%int i = 2; %>
    <% try { %>
	<% i = (int) session.getAttribute("i"); %>
	<% } catch (Exception e) { %>
	<% i=2; %>
	<%} %>
<div class="container">
	<div class="row clearfix">
	<div class="col-md-12 column">
						<p>
							<br>
							<br>
							<br>
							<br>
						</p>
					</div>
		<nav class="navbar navbar-default navbar-fixed-top"
					role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href=personalCenter?<%out.print("2333"); %>>阅读</a>
				</div>
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					
					<form action="search" class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input class="form-control" type="text" placeholder="搜索内容"/>
						</div>
						<button type="submit" class="btn btn-default">开始搜索</button>
					</form>
					<ul class="nav navbar-nav navbar-right" style="padding-right:10px;">
						
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><img src="sources/pics/Avatar.png" height="20" width="20" /><strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li><a href=mainPage>我的主页</a></li>
								<li><a href=fileManage>内容管理</a></li>
								<li><a href=timeLine>时间线</a></li>
								
								<li><a href=settings>设置</a></li>
								<li class="divider"></li>
								<li><a href=signOut>注销</a></li>
							</ul></li>
					</ul>
				</div>
				</nav>
	</div>
	<div class="row clearfix">
		<div class="col-md-2 column">
		<img alt="140x140" src="sources/pics/Avatar.png" height="200" width="200" class="img-rounded" />
		<ul class="nav nav-list">
				<li class="nav-header">
					设置
				</li>
				<li class="active">
					<a href="setting1.jsp">修改密码</a>
				</li>
				<li>
					<a href="setting2.jsp">个人信息</a>
				</li>
				<li>
					<a href="#">空</a>
				</li>
		</ul>
		</div>
		<div class="col-md-6 column">
			<h2>设置</h2>
			<form action="setting1" id="setting_form" method="post">
				<div class="form-group">
					 <label>旧密码</label><input name="oldpasswd" type="password" class="form-control" id="oldpasswd" />
					 <span class=""></span>
				</div>
				<div class="form-group">
					 <label>新密码</label><input name="passwd" type="password" class="form-control" id="passwd" />
					 <span class=""></span>
				</div>
				<div class="form-group">
					<label>新密码确认</label>
					 <input class="form-control" name="passwd_confirm" type="password" id="passwd_confirm" />
					 <span class=""></span>
				</div>
				<div class="modal-footer">
				<button type="submit" class="btn btn-default" form="setting_form">更改</button>
				<%if(i==1)
					out.print("更改成功");
				else if(i==0)
					out.print("更改失败");%>
				</div>
			</form>
		</div>
		<div class="col-md-4 column" style='text-align:center'>
			<img alt="140x140" src="sources/pics/setting2.jpg" /> <button type="button" class="btn btn-lg btn-info">返回</button>
		</div>
	</div>
</div>
<link href="sources/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="sources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css"></script>
	<script src="sources/jquery-3.1.1/jquery-3.1.1.min.js"></script>
	<script src="sources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<style>
		.state2 {
			color: #000;
		}
		.state3 {
			color: red;
		}
		.state4 {
			color: green;
		}
	</style>
	<script type="text/javascript">
		$(function() {
			var oldpasswdsetting = false;
			var passwdConfirm = false;
			var passwdsetting = false;
			//验证旧密码
			$('input[name="oldpasswd"]').focus(function() {
				$(this).next().text('密码错误').addClass('state2');}).blur(function() {
					if ($(this).val() != '' && $(this).value == $('password').value) {
						$(this).next().text('密码正确').removeClass().addClass('state4');
						oldpasswdsetting = true;
					}
					else {
						$(this).next().text('密码错误').removeClass().addClass('state3');
					}
				});
			//验证密码
			$('input[name="passwd"]').focus(function() {
				$(this).next().text('密码应大于等于6位').addClass('state2');}).blur(function() {
					if ($(this).val().length >= 6 && $(this).val() != '') {
						$(this).next().text('输入成功').removeClass().addClass('state4');
						passwdsetting = true;
					}
					else {
						$(this).next().text('密码应大于等于6位').removeClass().addClass('state3');
					}
				});
			//验证确认密码
			$('input[name="passwd_confirm"]').focus(function() {
				$(this).next().text('请输入相同的密码').addClass('state2');}).blur(function() {
					if ($(this).val() != '' && $(this).value == $('input[name="passwd"]').value) {
						passwdConfirm = true;
						$(this).next().text('输入成功').removeClass().addClass('state4');
					}
					else {
						$(this).next().text('请输入相同的密码').removeClass().addClass('state3');
					}
				});
			//所有验证通过方可提交表单
			$('.submit').click(function() {
				if (oldpasswdsetting && passwdsetting && passwdConfirm) {
					$('form').submit();
				}
				else {
					return false;
				}
			});
		});
	</script>
</body>
</html>







