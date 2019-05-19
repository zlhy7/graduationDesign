<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/include/head.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>用户管理</title>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/user/list">用户列表 </a></li>
    <li><a href="${ctx}/user/fromconfig">添加用户</a></li>
</ul>
<form:form id="searchForm" class="list_form" modelAttribute="userBean" action="/user/list" method="post">
    <%--<form:hidden path="orderBy"/>--%>
    <%--<form:hidden path="pageNo"/>--%>
    <%--<form:hidden path="pageSize"/>--%>
    <div class="input-prepend">
        <span class="input-label">姓名：</span>
        <form:input path="realName"/>
    </div>
    <div class="input-prepend">
        <span class="input-label">角色：</span>
        <form:input path="loginName"/>
    </div>
    <div class="input-btn">
        <button class="btn btn-primary" onclick="return page('1')"><i class="icon-search"></i> 查询</button>
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
    <tr>
        <td><input type="checkbox" class="chooseOne"/></td>
        <td>1</td>
        <td>
            福04
        </td>
        <td>三号线</td>
        <td>福田B</td>
        <td>男</td>
        <td>1234567894</td>
        <td>头像</td>
        <td>
        <a style="color: #fff" class="btn btn-warning updateBtn" href="/alp/alpEarthWirePlace/fromconfig?id=5f7a1b20446040aea38a06854b3291e3">修改</a>
        <a style="color: #fff" class="btn btn-danger delBtn" href="/alp/alpEarthWirePlace/remove?id=5f7a1b20446040aea38a06854b3291e3" onclick="return confirmx('确认要删除该参数吗？删除后将无法恢复', this.href)">删除</a>
        </td>
    </tr>
    <tr>
        <td><input type="checkbox" class="chooseOne"/></td>
        <td>2</td>
        <td>
            福02
        </td>
        <td>三号线</td>
        <td>福田B</td>
        <td>男</td>
        <td>1234567894</td>
        <td>头像</td>
        <td>
            <a style="color: #fff" class="btn btn-warning updateBtn" href="/alp/alpEarthWirePlace/fromconfig?id=5f7a1b20446040aea38a06854b3291e3">修改</a>
            <a style="color: #fff" class="btn btn-danger delBtn" href="/alp/alpEarthWirePlace/remove?id=5f7a1b20446040aea38a06854b3291e3" onclick="return confirmx('确认要删除该参数吗？删除后将无法恢复', this.href)">删除</a>
        </td>
    </tr>
    <tr>
        <td><input type="checkbox" class="chooseOne"/></td>
        <td>3</td>
        <td>
            少03
        </td>
        <td>三号线</td>
        <td>少年宫A</td>
        <td>男</td>
        <td>1234567894</td>
        <td>头像</td>
        <td>
            <a style="color: #fff" class="btn btn-warning updateBtn" href="/alp/alpEarthWirePlace/fromconfig?id=5f7a1b20446040aea38a06854b3291e3">修改</a>
            <a style="color: #fff" class="btn btn-danger delBtn" href="/alp/alpEarthWirePlace/remove?id=5f7a1b20446040aea38a06854b3291e3" onclick="return confirmx('确认要删除该参数吗？删除后将无法恢复', this.href)">删除</a>
        </td>
    </tr>
    <tr>
        <td><input type="checkbox" class="chooseOne"/></td>
        <td>4</td>
        <td>
            少01
        </td>
        <td>三号线</td>
        <td>少年宫A</td>
        <td>男</td>
        <td>1234567894</td>
        <td>头像</td>
        <td>
            <a style="color: #fff" class="m-btn btn-remarks zx-cyy-btn cyy-btn-zy" id="checkLabel"
               href="/alp/alpEarthWirePlace/fromconfig?id=d9a77442bc544a0db8fcc2bf4f08aab8"><span>修改</span></a>
            <a style="color: #fff" class="m-btn btn-red zx-cyy-btn cyy-btn-zy"
               href="/alp/alpEarthWirePlace/remove?id=d9a77442bc544a0db8fcc2bf4f08aab8"
               onclick="return confirmx('确认要删除该参数吗？删除后将无法恢复', this.href)">删除</a>
        </td>
    </tr>
    <tr>
        <td><input type="checkbox" class="chooseOne"/></td>
        <td>5</td>
        <td>
            六04
        </td>
        <td>三号线</td>
        <td>六约B</td>
        <td>男</td>
        <td>1234567894</td>
        <td>头像</td>
        <td>
            <a style="color: #fff" class="m-btn btn-remarks zx-cyy-btn cyy-btn-zy" id="checkLabel"
               href="/alp/alpEarthWirePlace/fromconfig?id=c908a0a8c351445995f2e3e8a175a759"><span>修改</span></a>
            <a style="color: #fff" class="m-btn btn-red zx-cyy-btn cyy-btn-zy"
               href="/alp/alpEarthWirePlace/remove?id=c908a0a8c351445995f2e3e8a175a759"
               onclick="return confirmx('确认要删除该参数吗？删除后将无法恢复', this.href)">删除</a>
        </td>
    </tr>
    <tr>
        <td><input type="checkbox" class="chooseOne"/></td>
        <td>6</td>
        <td>
            六02
        </td>
        <td>三号线</td>
        <td>六约B</td>
        <td>男</td>
        <td>1234567894</td>
        <td>头像</td>
        <td>
            <a style="color: #fff" class="m-btn btn-remarks zx-cyy-btn cyy-btn-zy" id="checkLabel"
               href="/alp/alpEarthWirePlace/fromconfig?id=b896d742610a4ddf93cbe4ddcdced18e"><span>修改</span></a>
            <a style="color: #fff" class="m-btn btn-red zx-cyy-btn cyy-btn-zy"
               href="/alp/alpEarthWirePlace/remove?id=b896d742610a4ddf93cbe4ddcdced18e"
               onclick="return confirmx('确认要删除该参数吗？删除后将无法恢复', this.href)">删除</a>
        </td>
    </tr>
    <tr>
        <td><input type="checkbox" class="chooseOne"/></td>
        <td>7</td>
        <td>
            六03
        </td>
        <td>三号线</td>
        <td>六约A</td>
        <td>男</td>
        <td>1234567894</td>
        <td>头像</td>
        <td>
            <a style="color: #fff" class="m-btn btn-remarks zx-cyy-btn cyy-btn-zy" id="checkLabel"
               href="/alp/alpEarthWirePlace/fromconfig?id=a4492087f3f1433eacc394d01f05ab79"><span>修改</span></a>
            <a style="color: #fff" class="m-btn btn-red zx-cyy-btn cyy-btn-zy"
               href="/alp/alpEarthWirePlace/remove?id=a4492087f3f1433eacc394d01f05ab79"
               onclick="return confirmx('确认要删除该参数吗？删除后将无法恢复', this.href)">删除</a>
        </td>
    </tr>
    <tr>
        <td><input type="checkbox" class="chooseOne"/></td>
        <td>8</td>
        <td>
            六01
        </td>
        <td>三号线</td>
        <td>六约A</td>
        <td>男</td>
        <td>1234567894</td>
        <td>头像</td>
        <td>
            <a style="color: #fff" class="m-btn btn-remarks zx-cyy-btn cyy-btn-zy" id="checkLabel"
               href="/alp/alpEarthWirePlace/fromconfig?id=70335241c2344d69bb31730e52d46414"><span>修改</span></a>
            <a style="color: #fff" class="m-btn btn-red zx-cyy-btn cyy-btn-zy"
               href="/alp/alpEarthWirePlace/remove?id=70335241c2344d69bb31730e52d46414"
               onclick="return confirmx('确认要删除该参数吗？删除后将无法恢复', this.href)">删除</a>
        </td>
    </tr>
    <tr>
        <td><input type="checkbox" class="chooseOne"/></td>
        <td>9</td>
        <td>
            丹04
        </td>
        <td>三号线</td>
        <td>丹竹头B</td>
        <td>男</td>
        <td>1234567894</td>
        <td>头像</td>
        <td>
            <a style="color: #fff" class="m-btn btn-remarks zx-cyy-btn cyy-btn-zy" id="checkLabel"
               href="/alp/alpEarthWirePlace/fromconfig?id=6792cfeda282412b993aca952aa02d36"><span>修改</span></a>
            <a style="color: #fff" class="m-btn btn-red zx-cyy-btn cyy-btn-zy"
               href="/alp/alpEarthWirePlace/remove?id=6792cfeda282412b993aca952aa02d36"
               onclick="return confirmx('确认要删除该参数吗？删除后将无法恢复', this.href)">删除</a>
        </td>
    </tr>
    <tr>
        <td><input type="checkbox" class="chooseOne"/></td>
        <td>10</td>
        <td>
            丹02
        </td>
        <td>三号线</td>
        <td>丹竹头B</td>
        <td>男</td>
        <td>1234567894</td>
        <td>头像</td>
        <td>
            <a style="color: #fff" class="m-btn btn-remarks zx-cyy-btn cyy-btn-zy" id="checkLabel"
               href="/alp/alpEarthWirePlace/fromconfig?id=9b9cc83228d14b4fabc767660f956f4b"><span>修改</span></a>
            <a style="color: #fff" class="m-btn btn-red zx-cyy-btn cyy-btn-zy"
               href="/alp/alpEarthWirePlace/remove?id=9b9cc83228d14b4fabc767660f956f4b"
               onclick="">删除</a>
        </td>
    </tr>
    </tbody>
</table>
</body>
</html>