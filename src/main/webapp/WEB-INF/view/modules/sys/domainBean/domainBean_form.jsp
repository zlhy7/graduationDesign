<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/include/head.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>表域配置</title>
    <script>
        $(function () {
            //表单验证
            $("#searchForm").validate({
                rules: {
                    domainName:{
                        required:true,
                        remote: {
                            scriptCharset: 'UTF-8',
                            url: "${ctx}/domainBean/checkDomainName",
                            data: {
                                domainName: function () {
                                    return $("#domainName").val();
                                },
                                domainName2:function(){
                                    return "${domainBean.domainName}";
                                }
                            },
                            type: "post"
                        }
                    },
                    domainDesc:{
                        required:true,
                    },
                    tableName:{
                        required:true,
                        remote: {
                            scriptCharset: 'UTF-8',
                            url: "${ctx}/domainBean/isTableExist",
                            data: {
                                tableName: function () {
                                    return $("#tableName").val();
                                }
                            },
                            type: "post"
                        }
                    },
                    theadThs:{
                        required:true
                    },
                    primaryKey:{
                        required:true,
                        remote: {
                            scriptCharset: 'UTF-8',
                            url: "${ctx}/domainBean/isColumnExist",
                            data: {
                                tableName: function () {
                                    return $("#tableName").val();
                                },
                                primaryKey: function () {
                                    return $("#primaryKey").val();
                                }
                            },
                            type: "post"
                        }
                    },
                    columnShowNames:{
                        required:true
                    },
                    columnOutputNames:{
                        required:true
                    }
                },
                messages: {
                    domainName: {remote: "表域名已被占用"},
                    tableName:{remote: "表不存在"},
                    primaryKey:{remote: "字段不存在"}
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
        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/domainBean/list">表域配置</a></li>
    <li class="active"><a href="${ctx}/domainBean/fromconfig?id=${domainBean.id}">${not empty domainBean.id?'修改':'添加'}表域</a></li>
</ul>
<form:form id="searchForm" class="form_form form_form2" modelAttribute="domainBean" action="${ctx}/domainBean/save" method="post">
    <form:hidden path="id" />
    <div class="row">
        <div class="col">
            <label class="control-label">表域名：</label>
            <form:input type="text" class="form-control" path="domainName"  placeholder="请输入表域名"/>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">中文描述：</label>
            <form:input type="text" class="form-control" path="domainDesc" placeholder="请输入中文描述"/>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">表名：</label>
            <form:input type="text" path="tableName" class="form-control" placeholder="请输入表名"/>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">主键：</label>
            <form:input type="text" path="primaryKey" class="form-control" placeholder="请输入表主键"/>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">展示title：</label>
            <textarea name="theadThs" class="form-control" style="resize:none;font-size: 14px;height: 100px;" maxlength="255">${domainBean.theadThs}</textarea>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">显示字段：</label>
            <textarea name="columnShowNames" class="form-control" style="resize:none;font-size: 14px;height: 100px;" maxlength="255">${domainBean.columnShowNames}</textarea>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">输出字段：</label>
            <textarea name="columnOutputNames" class="form-control" style="resize:none;font-size: 14px;height: 100px;" maxlength="255">${domainBean.columnOutputNames}</textarea>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">备注：</label>
            <textarea name="remarks" class="form-control" style="resize:none;font-size: 14px;height: 100px;" maxlength="255">${domainBean.remarks}</textarea>
        </div>
    </div>
    <div class="row">
        <label class="control-label"></label>
        <button style="color: #fff;margin-right: 50px;" id="btnSubmit" class="btn btn-primary" type="submit">
            <i class="glyphicon glyphicon-floppy-disk"></i>&nbsp;&nbsp;保 存
        </button>
        <button style="color: #fff" id="btnCancel" class="btn btn-warning" type="button"
                onclick="window.location.href='${ctx}/domainBean/list'">
            <i class="glyphicon glyphicon-home"></i>&nbsp;返 回
        </button>
    </div>
</form:form>
</body>
</html>