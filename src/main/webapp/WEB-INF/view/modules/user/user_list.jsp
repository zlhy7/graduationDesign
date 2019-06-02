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
        function aaa(title,domainName,obj) {
            /**
             * 打开页面的window对象
             * */
            var openPageWindow;
            top.layer.open({
                type: 2,
                area: ['700px', '450px'],
                skin:"demo-class",
                title:title,
                btn:['保存','取消'],
                btn1:function (index) {
                    /**
                     * 拿到选中的数据
                     * */
                    var resultData = openPageWindow.result();
                    /**
                     * 不包含键
                     * */
                    var jsonToArr =  openPageWindow.jsonToArr(resultData);
                    /**
                     * 给隐藏域赋值
                     * */
                    var backKey = $(obj).attr("back_key");
                    // for (var i in resultData){
                    //     if (backKey == i){
                    //         /**
                    //          * 这个值赋给自己
                    //          * */
                    //         $(obj).val(getPropertyArr(jsonToArr,i));
                    //     } else {
                    //         /**
                    //          * 剩下的值赋给同级的兄弟
                    //          * */
                    //         $(obj).siblings("[back_key="+i+"]").val(getPropertyArr(jsonToArr,i));
                    //     }
                    // }
                    top.layer.close(index);
                    return false;
                },
                btn2: function(index, layero){//取消
                    top.layer.close(index);
                    return false;
                },
                success: function(layero, index){
                    var layer_content = top.document.body.getElementsByClassName("layui-layer-content")[0];
                    //获取内容页的widow对象
                    openPageWindow = $(layer_content).find("iframe")[0].contentWindow;
                    //如果没传多选参数，默认是单选
                    if(!$(obj).attr("multiSelect")){
                        openPageWindow.resetEvent();
                    }
                    $(obj).siblings('[back_key=user_cd]').val([]);
                },
                btnAlign: 'c',//底部按钮居中
                fixed: false, //不固定
                content: '${ctx}/domainBean/toDomainPage'
            });
            return false;
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/user/list">用户列表 </a></li>
    <li><a href="${ctx}/user/fromconfig">添加用户</a></li>
</ul>
<form:form id="searchForm" class="list_form" modelAttribute="userBean" action="${ctx}/user/list" method="post">
    <form:hidden path="pageNum"/>
    <div class="input-prepend">
        <span class="input-label">姓名：</span>
        <form:input path="realName"/>
    </div>
    <div class="input-btn">
        <button class="btn btn-primary" onclick="return page('1')"><i class="glyphicon glyphicon-search"></i> 查询</button>
    </div>
</form:form>
<input type="hidden" name="userCd" back_key="user_cd"/>
<input type="hidden" name="id" back_key="user_id"/>
<input readonly="readonly" back_key="real_name" onclick="aaa('用户选择','SYS_USER',this)" multiSelect="multiSelect">表域</input>
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
            <td>${fns:getDictValByKey("USER_SEX",userBean.userSex)}</td>
            <td>${userBean.userPhone}</td>
            <td><img src="${userBean.headPortrait}" height="50" width="50"/></td>
            <td>
                <a style="color: #fff" class="btn btn-warning updateBtn" href="${ctx}/user/fromconfig?id=${userBean.id}">
                    <i class="glyphicon glyphicon-pencil"></i>修改</a>
                <a style="color: #fff" class="btn btn-danger delBtn" href="${ctx}/user/remove?id=${userBean.id}" onclick="return confirmx('确认要删除该用户吗？', this)">
                    <i class="glyphicon glyphicon-trash"></i>删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
${pagingBar}
</body>
</html>
