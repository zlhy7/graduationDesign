<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/include/head.jsp" %>
<html>
<head>
    <title>登录页面</title>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/modules/login/css/login.css"/>
    <script type="text/javascript" charset="UTF-8">
        //跳转到主菜单
        <c:if test="${not empty loginFlag}">
            toMainMenu();
        </c:if>
        $(function () {
            //表单验证
            $("#loginForm").validate({
                rules: {
                    loginName:{
                        required:true,
                        remote: {
                            scriptCharset: 'UTF-8',
                            url: "${ctx}/loginController/isExistsUser",
                            data: {
                                loginName: function () {
                                    return $("#loginName").val();
                                }
                            },
                            type: "post"
                        }
                    },
                    password:{
                        required:true
                    }
                },
                messages: {
                    loginName:{
                        remote:"不存在"
                    }
                },
                submitHandler: function(form){
                    layer.load(0, {shade: [0.8, '#393D49'], time: 3000})
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
            //登录按钮长度
            $("#btnSubmit").width($(".hang-pwd:eq(0)").width()-30);
            // 提示密码不正确
            <c:if test="${not empty message}">
                layer.msg("${message}",{time:2000, shift: 6,skin:'demo-class'});
            </c:if>
        });
    </script>
</head>
<body>
    <form id="loginForm" action="${ctx}/loginController/dealwithLogin" method="post" name="form1" style="padding-left: 8%">
        <div class="p-2 d-flex hang-top">
        </div>
        <div class="p-2 d-flex hang">
            <div class="input-group-prepend">
                <span class="input-group-text glyphicon glyphicon-user"></span>
            </div>
            <input type="text" id="loginName" name="loginName" class="form-control" placeholder="请输入用户名"
                   value="${userBean.loginName}"/>
        </div>
        <div class="p-2 d-flex hang hang-pwd">
            <div class="input-group-prepend">
                <span class="input-group-text glyphicon glyphicon-lock"></span>
            </div>
            <input type="password" id="password" name="password" class="form-control" placeholder="请输入密码"
                   value="${userBean.password}"/>
        </div>
        <div class="p-2 d-flex hang">
            <label><input type="checkbox" id="keepPwd" name="keepPwd" value="keep"/>记住密码</label>
        </div>
        <div class="p-2 d-flex hang">
            <input type="submit" id="btnSubmit" name="btnSubmit" class="btn btn-primary" value="登录"/>
        </div>
        <div class="p-2 d-flex hang-bottom">
            <a href="#" class="alert-link" >忘记密码</a>
            <a href="#" class="alert-link" style="margin-left: 11rem">立即注册</a>
        </div>
    </form>
</body>
</html>
