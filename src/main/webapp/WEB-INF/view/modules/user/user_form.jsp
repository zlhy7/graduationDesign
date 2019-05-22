<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/include/head.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>用户管理</title>
    <script>
        $(function () {
            //带搜索的下拉框
            $("#userSex").select2({
                placeholder: "请选择",
                allowClear: true
            });
            //登录名验证
            $.validator.addMethod("checkLoginName",function(value,element,params){
                //以字母开头，其他的由字母，数字，下划线组成
                var regex = /^[a-zA-Z][a-zA-Z0-9_]+$/;
                return regex.test(value);
            },"用户名以字母开头");
            //姓名验证
            $.validator.addMethod("checkRealName",function(value,element,params){
                //真实姓名为2~5位的汉字
                var regex = /^[\u4E00-\uFA29]{2,5}$/;
                return regex.test(value);
            },"姓名必须是中文");
            //手机号验证
            $.validator.addMethod("checkPhone",function(value,element,params){
                var regex = /^(0|86|17951)?(13[0-9]|15[012356789]|166|17[3678]|18[0-9]|14[57])[0-9]{8}$/;
                return regex.test(value);
            },"手机号格式不正确");
            //表单验证
            $("#searchForm").validate({
                rules: {
                    loginName:{
                        required:true,
                        remote: {
                            scriptCharset: 'UTF-8',
                            url: "${ctx}/user/checkLoginName",
                            data: {
                                loginName: function () {
                                    return $("#loginName").val();
                                },
                                loginName2:function(){
                                    return "${userBean.loginName}";
                                }
                            },
                            type: "post"
                        },
                        checkLoginName:true,
                        minlength:6,
                        maxlength:18
                    },
                    userCd:{
                        required:true
                    },
                    realName:{
                        required:true,
                        checkRealName:true,
                        minlength:2
                    },
                    userSex:{
                        required:true
                    },
                    isAllowFlag:{
                        required:true
                    },
                    userPhone:{
                        required:true,
                        checkPhone:true,
                        number:true
                    },
                    remarks:{
                        required:true
                    }
                },
                messages: {
                    loginName: {remote: "用户名已被占用"},
                    realName:{minlength:"名字至少两个字"}
                },
                submitHandler: function(form){
                    loading('正在提交，请稍等...');
                    form.submit();
                },
                success: function(lable){
                    lable.remove();
                },
                errorContainer: "#messageBox",
                errorPlacement: function(error, element) {
                    console.log(element.prop("nodeName"));
                    if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
                        error.appendTo(element.parent().parent());
                    } else if("SELECT"==element.prop("nodeName")){//如果是下拉框，错误出现在
                        element.next().after(error);
                    }else{
                        error.insertAfter(element);
                    }
                }
            });
        })
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/user/list">用户列表 </a></li>
    <li class="active"><a href="${ctx}/user/fromconfig?id=${userBean.id}">${not empty userBean.id?'修改':'添加'}用户</a></li>
</ul>
<form:form id="searchForm" class="form_form" modelAttribute="userBean" action="${ctx}/user/save" method="post">
    <form:hidden path="id" />
    <div class="row">
        <div class="col">
            <label class="control-label">用户名：</label>
            <input type="text" class="form-control" id="loginName" name="loginName" value="${userBean.loginName}"/>
            <span class="help-inline">*</span>
        </div>
        <div class="col">
            <label class="control-label">用户编号：</label>
            <input type="text" class="form-control" readonly="readonly" name="userCd" value="${userBean.userCd}"/>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">姓名：</label>
            <input type="text" name="realName" class="form-control"/>
            <span class="help-inline">*</span>
        </div>
        <div class="col">
            <label class="control-label">性别：</label>
            <select id="userSex" name="userSex" class="form-control select2">
                <option value="">保密</option>
                <option value="1" selected>男</option>
                <option value="2">女</option>
            </select>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">手机：</label>
            <input type="text" name="userPhone" class="form-control"/>
            <span class="help-inline">*</span>
        </div>
        <div class="col">
            <label class="control-label">是否允许登陆：</label>
            <select id="isAllowFlag" name="isAllowFlag" class="form-control select2">
                <option value="1" selected>允许</option>
                <option value="2">拒绝</option>
            </select>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">备注：</label>
                <%--<input type="text" class="form-control"/>--%>
            <textarea path="remarks" class="form-control" style="resize:none;font-size: 14px;height: 100px;"
                      maxlength="255"></textarea>
        </div>
        <div class="col"></div>
    </div>
    <div class="row">
        <div class="col">
            <div class="form_btns" style="margin:  0 auto;">
                <button style="color: #fff;margin-right: 50px;" id="btnSubmit" class="btn btn-primary" type="submit">
                    <i class="glyphicon glyphicon-floppy-disk"></i>&nbsp;&nbsp;保 存
                </button>
                <button style="color: #fff" id="btnCancel" class="btn btn-warning" type="button"
                        onclick="window.document.location.href='${ctx}/user/list'">
                    <i class="glyphicon glyphicon-home"></i>&nbsp;返 回
                </button>
            </div>
        </div>
    </div>
</form:form>
</body>
</html>