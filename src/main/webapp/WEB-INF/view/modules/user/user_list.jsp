<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/include/head.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>用户管理</title>
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
    <li class="active"><a href="${ctx}/user/list">用户列表 </a></li>
    <li><a href="${ctx}/user/fromconfig">添加用户</a></li>
</ul>
<form:form id="searchForm" class="list_form" modelAttribute="userBean" action="/user/list" method="post">
    <form:hidden path="pageNum"/>
    <div class="input-prepend">
        <span class="input-label">姓名：</span>
        <form:input path="realName"/>
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
        <th>用户编号</th>
        <th>登录名</th>
        <th>真实姓名</th>
        <th>性别</th>
        <th>电话</th>
        <th>头像</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="userBean" varStatus="status">
        <tr>
            <td><input type="checkbox" class="chooseOne"/></td>
            <td>${status.count}</td>
            <td>${userBean.userCd}</td>
            <td>${userBean.loginName}</td>
            <td>${userBean.realName}</td>
            <td>${userBean.userSex}</td>
            <td>${userBean.userPhone}</td>
            <td>${userBean.headPortrait}</td>
            <td>
                <a style="color: #fff" class="btn btn-warning updateBtn" href="/user/fromconfig?id=${userBean.id}">
                    <i class="glyphicon glyphicon-pencil"></i>修改</a>
                <a style="color: #fff" class="btn btn-danger delBtn" href="/user/remove?id=${userBean.id}" onclick="return confirmx('确认要删除该参数吗？删除后将无法恢复', this.href)">
                    <i class="glyphicon glyphicon-trash"></i>删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
${pagingBar}
</body>
</html>
