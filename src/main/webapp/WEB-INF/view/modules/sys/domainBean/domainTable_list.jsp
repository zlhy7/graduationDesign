<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/include/head.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>表域表格</title>
    <script type="text/javascript">
        //分页的方法
        function page(n) {
            $("#pageNum").val(n);
            $("#searchForm").submit();
            return false;
        }
        /**
         * 数据源
         */
        var dataSource = ${mapJSONArr};
        /**
         * 返回结果
         */
        function result() {
            /**
             * 遍历选中行，收集结果
             */
            var resultData = [];
            $(".chooseOne:checked").each(function (index) {
                resultData.push({id:dataSource[index]['${domainBean.primaryKey}'],objProperty:dataSource[index]});
            });
            return resultData;
        }
        /**
         * 取消全局事件重新定义事件
         */
        function resetEvent() {
            /**
             * 解绑所有事件
             */
            $(".chooseAll,.chooseOne").unbind();
            /**
             * 全选隐藏
             */
            $(".chooseAll").hide();
            $(".chooseOne").click(function () {
                if(this.checked){
                    /**
                     * 只考虑选中就行了，未选不做处理
                     */
                    $(".chooseOne").prop("checked",false);
                    /**
                     * 添加当前个
                     */
                    $(this).prop("checked",true);
                }
            });
        }
    </script>
</head>
<body>
<form:form id="searchForm" modelAttribute="domainBean" action="/domainBean/toDomainPage" method="post">
    <form:hidden path="pageNum"/>
</form:form>
<table id="contentTable" class="table table-striped table-hover table-dark">
    <thead class="thead-dark">
    <tr>
        <th><input type="checkbox" class="chooseAll"/></th>
        <th>序号</th>
        <c:forTokens items="${domainBean.theadThs}" var="thName" delims="," varStatus="status1">
            <th class="<c:if test="${columnShowNames[status1.index].contains('@hidden')}">hidden</c:if>">${thName}</th>
        </c:forTokens>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="mapObj" varStatus="status2">
        <tr>
            <td><input type="checkbox" class="chooseOne"/></td>
            <td>${status2.count}</td>
            <c:forEach items="${columnShowNames}" var="columnShowName" varStatus="status1">
                <td class="<c:if test="${columnShowName.contains('@hidden')}">hidden</c:if>">${columnShowName.contains('@hidden')?(mapObj.get(columnShowName.split("@")[0])):mapObj.get(columnShowName)}</td>
            </c:forEach>
        </tr>
    </c:forEach>
    </tbody>
</table>
${pagingBar}
</body>
</html>
