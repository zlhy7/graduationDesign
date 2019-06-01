<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/include/head.jsp" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>停车管理系统</title>
		<script>
            /**
			 * 如果有提示信息就提示
             */
			<c:if test="${not empty message}">
            	layer.msg("没登录吧，请先登录",{time:2500, shift: 6,skin:'demo-class'});
			</c:if>
            /**
			 * 改变iframe引入
             */
			function changeIframeSrc(iframeSrc) {
                $("#showChildModule")[0].src = iframeSrc;
            }
		</script>
		<style>
			.login-form-div{
				background: url('${ctxStatic}/modules/login/img/back.gif') no-repeat;
				background-size: contain;
			}
			#showChildModule{
				border: 1px solid white;
				height: 80%;
				width: 100%
			}
		</style>
	</head>
	<body>
		<div class="container-fluid">
			<div class="row">
				<%--变蓝 标题1 居中--%>
				<div class="col-md-6 offset-md-3 text-primary display-3 text-center">
					欢迎使用停车管理系统
				</div>
			</div>
			<%--居上有点距离--%>
			<div class="row mt-10">
				<div class="col-md-10 offset-md-2 login-form-div">
					<div class="col-md-5 offset-md-7">
						<iframe id="showChildModule" name="showChildModule" frameborder="0" src="${ctx}/loginController/iframeSrc?modulesName=loginPage" class="form_form2"/>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
