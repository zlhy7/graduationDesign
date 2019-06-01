<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/include/head.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>车辆管理</title>
    <script>
        //车牌号验证
        // $.validator.addMethod("checkCarNumber",function(value,element,params){
        //
        //     return regex.test(value);
        // },"姓名必须是中文");
        $(function () {
            //表单验证
            $("#searchForm").validate({
                rules: {
                    carCd:{
                        required:true
                    },
                    carNumber:{
                        required:true
                    },
                    carBrand:{
                        required:true
                    },
                    carModel:{
                        required:true
                    },
                    remarks:{
                        required:true
                    }
                },
                messages: {
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
        })
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/car/list">车辆列表</a></li>
    <li class="active"><a href="${ctx}/car/fromconfig?id=${car.id}">${not empty car.id?'修改':'添加'}车辆</a></li>
</ul>
<form:form id="searchForm" class="form_form form_form2" modelAttribute="car" action="${ctx}/car/save" method="post">
    <form:hidden path="id" />
    <div class="row">
        <div class="col">
            <label class="control-label">车辆编号：</label>
            <form:input type="text" class="form-control" readonly="true" path="carCd" value="${car.carCd}"/>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">车牌号：</label>
            <form:input type="text" class="form-control" path="carNumber" value="${car.carNumber}" placeholder="陕A·YG666，'·'用','代替"/>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">品牌：</label>
            <form:input type="text" class="form-control" path="carBrand" value="${car.carBrand}"/>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">型号：</label>
            <form:input type="text" class="form-control" path="carModel" value="${car.carModel}"/>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">颜色：</label>
            <form:select path="carColor">
                <form:option value="other">其他</form:option>
                <form:options items="${fns:getDict('CAR_COLOR')}" itemLabel="dictValue" itemValue="dictKey" htmlEscape="false"/>
            </form:select>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">备注：</label>
            <textarea path="remarks" class="form-control" style="resize:none;font-size: 14px;height: 100px;"
                      maxlength="255">${car.remarks}</textarea>
        </div>
    </div>
    <div class="row">
        <label class="control-label"></label>
        <button style="color: #fff;margin-right: 50px;" id="btnSubmit" class="btn btn-primary" type="submit">
            <i class="glyphicon glyphicon-floppy-disk"></i>&nbsp;&nbsp;保 存
        </button>
        <button style="color: #fff" id="btnCancel" class="btn btn-warning" type="button"
                onclick="window.location.href='${ctx}/car/list'">
            <i class="glyphicon glyphicon-home"></i>&nbsp;返 回
        </button>
    </div>
</form:form>
</body>
</html>