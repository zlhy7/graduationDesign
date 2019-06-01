<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/include/head.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>表域管理</title>
    <script type="text/javascript">
        //分页的方法
        function page(n) {
            $("#pageNum").val(n);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/domainBean/list">表域配置 </a></li>
    <li><a href="${ctx}/domainBean/fromconfig">添加表域</a></li>
</ul>
<form:form id="searchForm" class="list_form" modelAttribute="domainBean" action="/domainBean/list" method="post">
    <form:hidden path="pageNum"/>
    <div class="input-prepend">
        <span class="input-label">中文描述：</span>
        <form:input path="domainDesc"/>
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
        <th>表域名</th>
        <th>中文描述</th>
        <th>创建时间</th>
        <th>备注</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="domainBean" varStatus="status">
        <tr>
            <td><input type="checkbox" class="chooseOne"/></td>
            <td>${status.count}</td>
            <td>${domainBean.domainName}</td>
            <td>${domainBean.domainDesc}</td>
            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${domainBean.createDate}"/></td>
            <td>${domainBean.remarks}</td>
            <td>
                <a style="color: #fff" class="btn btn-warning updateBtn" href="${ctx}/domainBean/fromconfig?id=${domainBean.id}">
                    <i class="glyphicon glyphicon-pencil"></i>修改</a>
                <a style="color: #fff" class="btn btn-danger delBtn" href="${ctx}/domainBean/remove?id=${domainBean.id}" onclick="return confirmx('确认要删除该表域吗？', this)">
                    <i class="glyphicon glyphicon-trash"></i>删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
${pagingBar}
</body>
</html>
