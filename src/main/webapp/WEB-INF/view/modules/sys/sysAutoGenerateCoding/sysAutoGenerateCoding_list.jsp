<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/include/head.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>编码配置管理</title>
    <script type="text/javascript">
        //分页的方法
        function page(n) {
            $("#pageNum").val(n);
            $("#searchForm").submit();
            return false;
        }
        $(function () {
            //自动完成框
            var autocompleteData = ${autocompleteData};
            $( "#realName" ).autocomplete({
                source: autocompleteData
            });
        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/sysAutoGenerateCoding/list">编码配置</a></li>
    <li><a href="${ctx}/sysAutoGenerateCoding/fromconfig">添加编码</a></li>
</ul>
<form:form id="searchForm" class="list_form" modelAttribute="sysAutoGenerateCodingBean" action="${ctx}/sysAutoGenerateCoding/list" method="post">
    <form:hidden path="pageNum"/>
    <div class="input-prepend">
        <span class="input-label">中文描述：</span>
        <form:input path="cdChineseDesc"/>
    </div>
    <div class="input-btn">
        <button class="btn btn-primary" onclick="return page('1')"><i class="glyphicon glyphicon-search"></i> 查询</button>
    </div>
</form:form>
<table id="contentTable" class="table table-striped table-hover table-dark">
    <thead class="thead-dark">
    <tr>
        <th><input type="checkbox" class="chooseAll"/></th>
        <th>序号</th>
        <th>英文名</th>
        <th>中文描述</th>
        <th>前缀</th>
        <th>当前数字</th>
        <th>长度</th>
        <th>时间格式</th>
        <th>备注</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="sysAutoGenerateCodingBean" varStatus="status">
        <tr>
            <td><input type="checkbox" class="chooseOne"/></td>
            <td>${status.count}</td>
            <td>${sysAutoGenerateCodingBean.cdEnglishName}</td>
            <td>${sysAutoGenerateCodingBean.cdChineseDesc}</td>
            <td>${sysAutoGenerateCodingBean.cdPrefix}</td>
            <td>${sysAutoGenerateCodingBean.cdCurrentNum}</td>
            <td>${sysAutoGenerateCodingBean.cdLength}</td>
            <td>${sysAutoGenerateCodingBean.cdTimeFormat}</td>
            <td>${sysAutoGenerateCodingBean.remarks}</td>
            <td>
                <a style="color: #fff" class="btn btn-warning updateBtn" href="${ctx}/sysAutoGenerateCoding/fromconfig?id=${sysAutoGenerateCodingBean.id}">
                    <i class="glyphicon glyphicon-pencil"></i>修改</a>
                <a style="color: #fff" class="btn btn-danger delBtn" href="${ctx}/sysAutoGenerateCoding/remove?id=${sysAutoGenerateCodingBean.id}" onclick="return confirmx('确认要删除该编码配置吗？', this)">
                    <i class="glyphicon glyphicon-trash"></i>删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
${pagingBar}
</body>
</html>
