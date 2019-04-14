<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/include/head.jsp" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>停车管理系统</title>
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/modules/login/css/login.css"/>
		<script src="${ctxStatic}/modules/login/js/login.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body>
		<div class="box">
			<div class="top">
				欢迎使用停车管理系统
			</div>
			<div id="register" style="display: none">
				<span>用户注册</span>
				<span id="close">X</span>
				<div class="register_form">
					<form onsubmit="return register$form(this)" name="form2">
						用户名:<input type="text" id="register_user" name="user2" placeholder="请输入用户名"/><br />
						真实姓名:<input type="text" id="real_user" name="real_name" placeholder="请输入真实姓名"/><br />
						密码:<input type="password" id="register_pwd" name="pwd2" placeholder="请输入密码"/><br />
						确认密码:<input type="password" id="pwd_ok" name="pwd_ok" placeholder="请再次输入密码"/><br />
						出生日期:<span>
							<select id="year"></select><select id="month"></select><select id="day"></select>
						</span><br />
						联系电话:<input type="tel" id="tel" name="tel"/><br />
						地址:<select id="provinces"></select><select id="city"></select><select id="county"></select>
						<div class="eye">
							<input type="submit" id="register_submit" name="submit" value="注册"/>
							<input type="reset" id="register_reset" name="reset" value="重置"/>
						</div>
					</form>
				</div>
			</div>
			<form action="#" method="post" name="form1" onsubmit="return verification1(this)">
				<div class="login">
					<div class="login_top">
						请在输入框中填写用户信息
					</div>
					<div class="login_bottom">
						<input type="text" id="user" placeholder="请输入用户名" name="user" maxlength="10"/><br />
						<input type="password" id="pwd" placeholder="请输入密码" name="pwd" maxlength="10"/>
					</div>
					<div class="bottom">
						<div class="bottom_top">
							<input type="submit" id="submit" name="submit" value="登录"/>
							<input type="reset" id="reset" name="reset" value="重置"/>
						</div>
						<div class="bottom_bottom">
							<a href="#" id="show">免费注册</a>
						</div>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>
