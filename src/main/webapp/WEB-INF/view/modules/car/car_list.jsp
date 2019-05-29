<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/include/head.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>车辆管理</title>
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
    <li class="active"><a href="${ctx}/car/list">车辆列表 </a></li>
    <li><a href="${ctx}/car/fromconfig">添加车辆</a></li>
</ul>
<form:form id="searchForm" class="list_form" modelAttribute="car" action="${ctx}/car/list" method="post">
    <form:hidden path="pageNum"/>
    <div class="input-prepend">
        <span class="input-label">品牌：</span>
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
        <th>车辆编号</th>
        <th>车辆品牌</th>
        <th>车辆型号</th>
        <th>颜色</th>
        <th>车牌号</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="car" varStatus="status">
        <tr>
            <td><input type="checkbox" class="chooseOne"/></td>
            <td>${status.count}</td>
            <td>${car.carCd}</td>
            <td>${car.carBrand}</td>
            <td>${car.carModel}</td>
            <td>
                <div style="width: 30px;height: 30px;background-color: ${car.carColor}"></div>
            </td>
            <td>${car.carNumber}</td>
            <td>
                <a style="color: #fff" class="btn btn-warning updateBtn" href="${ctx}/car/fromconfig?id=${car.id}">
                    <i class="glyphicon glyphicon-pencil"></i>修改</a>
                <a style="color: #fff" class="btn btn-danger delBtn" href="${ctx}/car/remove?id=${car.id}" onclick="return confirmx('确认要删除该车辆吗？', this)">
                    <i class="glyphicon glyphicon-trash"></i>删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
${pagingBar}
</body>
</html>
