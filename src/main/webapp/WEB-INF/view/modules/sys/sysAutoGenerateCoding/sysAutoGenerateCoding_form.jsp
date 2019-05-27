<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/include/head.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>编码配置</title>
    <script>
        $(function () {
            //带搜索的下拉框
            $("#cdStartNum,#cdTimeFormat").select2({
                placeholder: "请选择",
                allowClear: true
            });
            $("#cdStartNum").select2('val','1');//设置默认值
            $("#cdTimeFormat").select2('val','');//设置默认值
            //表单验证
            $("#searchForm").validate({
                rules: {
                    cdEnglishName:{
                        required:true,
                        remote: {
                            scriptCharset: 'UTF-8',
                            url: "${ctx}/sysAutoGenerateCoding/checkCdEnglishName",
                            data: {
                                cdEnglishName: function () {
                                    return $("#cdEnglishName").val();
                                },
                                cdEnglishName2:function(){
                                    return "${sysAutoGenerateCodingBean.cdEnglishName}";
                                }
                            },
                            type: "post"
                        },
                        checkLoginName:true,
                        minlength:6,
                        maxlength:18
                    },
                    cdChineseDesc:{
                        required:true,
                    },
                    cdPrefix:{
                        required:true,
                        minlength:2
                    },
                    cdStartNum:{
                        required:true
                    },
                    remarks:{
                        required:true
                    },
                    cdLength:{
                        required:true,
                        number:true,
                        max:9,
                        min:6
                    }
                },
                messages: {
                    cdEnglishName: {remote: "编码名已被占用"}
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
        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/sysAutoGenerateCoding/list">编码配置</a></li>
    <li class="active"><a href="${ctx}/sysAutoGenerateCoding/fromconfig?id=${sysAutoGenerateCodingBean.id}">${not empty sysAutoGenerateCodingBean.id?'修改':'添加'}编码</a></li>
</ul>
<form:form id="searchForm" class="form_form form_form2" modelAttribute="sysAutoGenerateCodingBean" action="${ctx}/sysAutoGenerateCoding/save" method="post">
    <form:hidden path="id" />
    <div class="row">
        <div class="col">
            <label class="control-label">编码英文名：</label>
            <form:input type="text" class="form-control" path="cdEnglishName" value="${sysAutoGenerateCodingBean.cdEnglishName}" placeholder="请输入编码英文名"/>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">编码中文描述：</label>
            <form:input type="text" class="form-control" path="cdChineseDesc" value="${sysAutoGenerateCodingBean.cdChineseDesc}" placeholder="请输入中文描述"/>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">前缀：</label>
            <form:input type="text" path="cdPrefix" class="form-control" placeholder="请输入前缀"/>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">长度：</label>
            <form:input type="text" path="cdLength" class="form-control" placeholder="请输入长度"/>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">计数从0开始：</label>
            <select id="cdStartNum" name="cdStartNum" class="form-control select2">
                <option value="1" <c:if test="${sysAutoGenerateCodingBean.cdStartNum ne '2'}">selected</c:if>>是</option>
                <option value="2" <c:if test="${sysAutoGenerateCodingBean.cdStartNum eq '2'}">selected</c:if>>否</option>
            </select>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">时间格式：</label>
            <select id="cdTimeFormat" name="cdTimeFormat" class="form-control select2">
                <option value="">请选择</option>
                <option value="%Y%M%d" <c:if test="${sysAutoGenerateCodingBean.cdTimeFormat eq '%Y%M%d'}">selected</c:if>>yyyyMMdd</option>
                <option value="%y%M%d" <c:if test="${sysAutoGenerateCodingBean.cdTimeFormat eq '%y%M%d'}">selected</c:if>>yyMMdd</option>
                <option value="%M%d" <c:if test="${sysAutoGenerateCodingBean.cdTimeFormat eq '%M%d'}">selected</c:if>>MMdd</option>
                <option value="%H%m%s" <c:if test="${sysAutoGenerateCodingBean.cdTimeFormat eq '%H%m%s'}">selected</c:if>>HHmmss</option>
            </select>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">备注：</label>
            <textarea path="remarks" class="form-control" style="resize:none;font-size: 14px;height: 100px;"maxlength="255">
                    ${sysAutoGenerateCodingBean.remarks}
            </textarea>
        </div>
    </div>
    <div class="row">
        <label class="control-label"></label>
        <button style="color: #fff;margin-right: 50px;" id="btnSubmit" class="btn btn-primary" type="submit">
            <i class="glyphicon glyphicon-floppy-disk"></i>&nbsp;&nbsp;保 存
        </button>
        <button style="color: #fff" id="btnCancel" class="btn btn-warning" type="button"
                onclick="window.document.location.href='${ctx}/sysAutoGenerateCoding/list'">
            <i class="glyphicon glyphicon-home"></i>&nbsp;返 回
        </button>
    </div>
</form:form>
</body>
</html>