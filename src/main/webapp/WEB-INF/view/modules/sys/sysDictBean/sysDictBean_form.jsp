<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/include/head.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>字典管理</title>
    <script>
        var num=1;
        function getArrElementLen(arr,element) {
            var count = 0;
            for (var i=0;i<arr.length;i++){
                if(arr[i] == element){
                    count++;
                }
            }
            return count;
        }
        //验证key值唯一
        $.validator.addMethod("checkKeyUnique",function(value,element,params){
            // var uniqueFlag = true;
            var keys = [];
            var id = "";
            $("[name=key1]").each(function () {
                if($(this).val() == value){
                    id = $(this)[0].id;
                }
                keys.push($(this).val());
            });
            return (getArrElementLen(keys,value)==1 && id==$(element)[0].id);
        },"key值唯一");
        $(function () {
            //表单验证
            $("#searchForm").validate({
                rules: {
                    dictEnglishName: {
                        required: true,
                        remote: {
                            scriptCharset: 'UTF-8',
                            url: "${ctx}/sysDictBean/checkDictEnglishName",
                            data: {
                                dictEnglishName: function () {
                                    return $("#dictEnglishName").val();
                                },
                                dictEnglishName2:function(){
                                    return "${sysDictBean.dictEnglishName}";
                                }
                            },
                            type: "post"
                        }
                    },
                    dictChineseDesc: {
                        required: true
                    },
                    key1: {
                        required: true,
                        checkKeyUnique:true
                    },
                    value1: {
                        required: true
                    }
                },
                messages: {
                    dictEnglishName: {remote: "名称已存在"}
                },
                success: function (lable) {
                    lable.remove();
                },
                errorContainer: "#messageBox",
                errorPlacement: function (error, element) {
                    if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
            $("#btnSubmit").click(function () {
                var keys=[];
                var values=[];
                $("[name=key1]").each(function (index) {
                    keys.push($(this).val());
                    values.push($("[name=value1]").eq(index).val());
                })
                $("#dictKey").val(keys);
                $("#dictValue").val(values);
            });
        });
        //添加行
        function addRow(obj){
            var $tr = $("<tr><td></td><td></td><td></td></tr>");
            var i = num++;
            $tr.find("td:eq(0)").append('<input type="text" name="key1" id="key'+i+'" class="form-control"/>');
            $tr.find("td:eq(1)").append('<input type="text" name="value1"id="value'+i+'" class="form-control"/>');
            $tr.find("td:eq(2)").append('<a style="color: #fff;font-size: 14px" class="btn btn-outline-primary" onclick="addRow(this)">插入行</a>');
            $tr.find("td:eq(2)").append('<a style="color: #fff;font-size: 14px" class="btn btn-outline-primary" onclick="delRow(this)">删除行</a>');
            $(obj).parents("tr").after($tr);
        }
        //删除行
        function delRow(obj){
            $(obj).parents("tr").remove();
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/sysDictBean/list">字典列表 </a></li>
    <li class="active"><a
            href="${ctx}/sysDictBean/fromconfig?dictEnglishName=${sysDictBean.dictEnglishName}">${not empty sysDictBean.dictEnglishName?'修改':'添加'}字典</a>
    </li>
</ul>
<form:form id="searchForm" class="form_form form_form2" modelAttribute="sysDictBean"
           action="${ctx}/sysDictBean/save" method="post">
    <form:hidden path="dictKey"/>
    <form:hidden path="dictValue"/>
    <div class="row">
        <div class="col">
            <label class="control-label">字典名：</label>
            <input type="text" class="form-control" name="dictEnglishName" value="${sysDictBean.dictEnglishName}"/>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">中文描述：</label>
            <input type="text" name="dictChineseDesc" class="form-control" value="${sysDictBean.dictChineseDesc}"/>
            <span class="help-inline">*</span>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">备注：</label>
            <textarea name="remarks" class="form-control" style="resize:none;font-size: 14px;height: 100px;"
                      maxlength="255">${sysDictBean.remarks}</textarea>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <label class="control-label">字典值设置：</label>
            <table class="form_table" style="width: 60%" class="table-bordered">
                <thead>
                <tr>
                    <th width="30%">key</th>
                    <th width="30%">value</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                    <c:if test="${empty sysDictBean.dictEnglishName}" var="flag1">
                        <tr>
                            <td>
                                <input type="text" name="key1" id="key0" class="form-control"/>
                            </td>
                            <td>
                                <input type="text" name="value1" id="value0" class="form-control"/>
                            </td>
                            <td>
                                <a style="color: #fff;font-size: 14px" class="btn btn-outline-primary" onclick="addRow(this)">插入行</a>
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${!flag1}">
                        <c:forEach items="${key_value_list}" var="key_value" varStatus="status">
                            <tr>
                                <td>
                                    <input type="text" name="key1" id="key${status.index}" class="form-control" value="${key_value.dictKey}"/>
                                </td>
                                <td>
                                    <input type="text" name="value1" id="value${status.index}" class="form-control" value="${key_value.dictValue}"/>
                                </td>
                                <td>
                                    <a style="color: #fff;font-size: 14px" class="btn btn-outline-primary" onclick="addRow(this)">插入行</a>
                                    <c:if test="${!status.first}">
                                        <a style="color: #fff;font-size: 14px" class="btn btn-outline-primary" onclick="delRow(this)">删除行</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <label class="control-label"></label>
        <button style="color: #fff;margin-right: 50px;" id="btnSubmit" class="btn btn-primary" type="submit">
            <i class="glyphicon glyphicon-floppy-disk"></i>&nbsp;&nbsp;保 存
        </button>
        <button style="color: #fff" id="btnCancel" class="btn btn-warning" type="button"
                onclick="window.document.location.href='${ctx}/sysDictBean/list'">
            <i class="glyphicon glyphicon-home"></i>&nbsp;返 回
        </button>
    </div>

</form:form>
</body>
</html>