<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/include/head.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>用户管理</title>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/user/list">用户列表 </a></li>
    <li class="active"><a href="${ctx}/user/fromconfig?id=${userBean.id}">${not empty userBean.id?'修改':'添加'}用户</a></li>
</ul>
<form:form id="searchForm" class="form_form" modelAttribute="userBean" action="${ctx}/user/save" method="post">
    <div class="row">
        <div class="col">
            <label class="control-label">用户名：</label>
            <input type="text" class="form-control" name="loginName" value="${userBean.loginName}"/>
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
            <input type="text" class="form-control"/>
            <span class="help-inline">*</span>
        </div>
        <div class="col">
            <label class="control-label">性别：</label>
            <select id="userSex" name="userSex" class="form-control select2">
                <option value="123">选项1</option>
                <option value="456">选项2</option>
            </select>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">手机：</label>
            <input type="text" class="form-control"/>
            <span class="help-inline">*</span>
        </div>
        <div class="col">
            <label class="control-label">是否允许登陆：</label>
            <input type="text" class="form-control"/>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">备注：</label>
                <%--<input type="text" class="form-control"/>--%>
            <textarea path="remarks" class="form-control" style="resize:none;font-size: 14px;height: 100px;"
                      maxlength="255"></textarea>
            <span class="help-inline">*</span>
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
<script>
    $("#monitor-manage-bind-rule-select").select2({
        placeholder: "请选择规则名",
        width: "190px",
        allowClear: true
    });
</script>
</body>
</html>