<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/include/head.jsp" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="${ctxStatic}/modules/welcome/css/welcome.css"/>
    <style>
        li.nav-item.list-group-item-dark:hover a{
            background-color: blue;
        }
    </style>
</head>
<body>
    <div class="navbar navbar-duomi navbar-static-top" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#" id="logo">停车管理系统</a>
            </div>
        </div>
    </div>
    <div class="container-full row">
        <div class="col-xl-2">
            <ul class="nav flex-column list-group">
                <li class="nav-item list-group-item-primary">
                    <a class="nav-link" href="#" data-toggle="collapse" data-target="#demo">菜单1</a>
                    <div id="demo" class="collapse show">
                        <ul class="nav flex-column">
                            <li class="nav-item list-group-item-dark">
                                <a class="nav-link text-center" href="#">Link</a>
                            </li>
                            <li class="nav-item list-group-item-dark">
                                <a class="nav-link text-center" href="#">Link</a>
                            </li>
                            <li class="nav-item list-group-item-dark">
                                <a class="nav-link text-center" href="#">Link</a>
                            </li>
                            <li class="nav-item list-group-item-dark">
                                <a class="nav-link text-center" href="#">Disabled</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">菜单4</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">菜单3</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">关于系统</a>
                </li>
            </ul>
        </div>
        <div class="col-xl-10">
            <iframe src="/WEB-INF/view/index.jsp"></iframe>
        </div>
    </div>
</body>
</html>
