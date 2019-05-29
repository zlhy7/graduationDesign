<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/include/head.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>用户管理</title>
    <script>
        $(function () {
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
                        minlength:2,
                        maxlength:10
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
                    if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
                        error.appendTo(element.parent().parent());
                    } else if("SELECT"==element.prop("nodeName")){//如果是下拉框，错误出现在
                        element.next().after(error);
                    }else{
                        error.insertAfter(element);
                    }
                }
            });
            //头像预览
            $("#headPortraitFile").change(function () {
                var file = this.files[0];
                var reader = new FileReader();
                reader.onload = function (e) {
                    var isPhotoFileRegular = /^.*\.(jpg|gif|png|bmp)$/i;
                    if(isPhotoFileRegular.test($("#headPortraitFile").val())){
                        //设置图片src
                        $("#headPortraitImg")[0].src = this.result;
                        $("#headPortrait").val(this.result);
                    }else{
                        $("#headPortraitFile").val('');//清空文件域
                        alert("请上传正确的图片格式");
                    }
                }
                reader.readAsDataURL(file);
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
            <form:input type="text" class="form-control" path="loginName" value="${userBean.loginName}" placeholder="请输入用户名"/>
            <span class="help-inline">*</span>
        </div>
        <div class="col">
            <label class="control-label">用户编号：</label>
            <form:input type="text" class="form-control" readonly="true" path="userCd" value="${userBean.userCd}"/>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">姓名：</label>
            <form:input type="text" path="realName" class="form-control"/>
            <span class="help-inline">*</span>
        </div>
        <div class="col">
            <label class="control-label">性别：</label>
            <form:select path="userSex">
                <form:option value="">请选择</form:option>
                <form:options items="${fns:getDict('USER_SEX')}" itemLabel="dictValue" itemValue="dictKey" htmlEscape="false"/>
            </form:select>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">手机：</label>
            <form:input type="text" path="userPhone" class="form-control"/>
            <span class="help-inline">*</span>
        </div>
        <div class="col">
            <label class="control-label">是否允许登陆：</label>
            <form:select path="userSex">
                <form:option value="">请选择</form:option>
                <form:options items="${fns:getDict('IS_ALLOW')}" itemLabel="dictValue" itemValue="dictKey" htmlEscape="false"/>
            </form:select>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">备注：</label>
            <textarea name="remarks" class="form-control" style="resize:none;font-size: 14px;height: 100px;"
                      maxlength="255">${userBean.remarks}</textarea>
        </div>
        <div class="col">
            <label class="control-label">上传头像：</label>
            <input type="file" id="headPortraitFile"/>
            <form:hidden path="headPortrait"/>
            <img id="headPortraitImg" height="200" width="200" src="${userBean.headPortrait}"/>
        </div>
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