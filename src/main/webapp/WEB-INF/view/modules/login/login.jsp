<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/include/head.jsp" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>停车管理系统</title>
		<%--<link rel="stylesheet" type="text/css" href="${ctxStatic}/modules/login/css/login.css"/>--%>
		<%--<script src="${ctxStatic}/modules/login/js/login.js" type="text/javascript" charset="utf-8"></script>--%>
		<script>
			$(function () {
                //表单验证
                $("#loginForm").validate({
                    rules: {
                        loginName:{
                            required:true
                        },
                        password:{
                            required:true
                        }
                    },
                    messages: {},
                    submitHandler: function(form){
                        loading('正在提交，请稍等...');
                        form.submit();
                    },
                    success: function(lable){
                        lable.remove();
                    },
                    errorContainer: "#messageBox",
                    errorPlacement: function(error, element) {
                        if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
                            error.appendTo(element.parent().parent());
                        } else if("SELECT"==element.prop("nodeName")){//如果是下拉框，错误出现在
                            element.next().after(error);
                        }else{
                            error.insertAfter(element);
                        }
                    }
                });
            });
		</script>
		<style>
			.login-form-div{
				background: url('${ctxStatic}/modules/login/img/back.gif') no-repeat;
				background-size: contain;
			}
		</style>
	</head>
	<body>
		<%--<div class="box">
			<div class="top">
				欢迎使用停车管理系统
			</div>
			<form id="loginForm" action="#" method="post" name="form1">
				<div class="login">
					<div class="login_top">
						请在输入框中填写用户信息
					</div>
					<div class="login_bottom">
						<input type="text" id="user" placeholder="请输入用户名" name="loginName"/><br />
						<input type="password" id="pwd" placeholder="请输入密码" name="password"/>
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
		</div>--%>
		<div class="container-fluid">
			<div class="row">
				<%--变蓝 标题1 居中--%>
				<div class="col-md-6 offset-md-3 text-primary display-2 text-center">
					欢迎使用停车管理系统
				</div>
			</div>
			<%--居上有点距离--%>
			<div class="row mt-10">
				<div class="col-md-8 offset-md-2 login-form-div">
					<div class="col-md-4 offset-md-9">
						<form id="loginForm" action="${ctx}/toLogin" method="post" name="form1"
							  style="height: 750px;width: 100%">
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
