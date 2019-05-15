<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/include/head.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>停车管理系统</title>
    <link rel="stylesheet" href="${ctxStatic}/modules/welcome/css/welcome.css"/>
    <script type="text/javascript">
        // 展示内容
        function showContent(linkAddress){
            $("iframe")[0].src = linkAddress;
        }
    </script>
</head>
<body>
<div class="navbar navbar-duomi navbar-static-top bg-dark" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#" id="logo">停车管理系统</a>
        </div>
        <nav class="navbar navbar-expand-sm bg-dark">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">Link 1</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link 2</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                        当前用户:admin
                    </a>
                    <div class="dropdown-menu bg-dark">
                        <a class="dropdown-item text-primary" href="#">个人信息</a>
                        <a class="dropdown-item text-primary" href="#">修改密码</a>
                        <a class="dropdown-item text-primary" href="#">退出系统</a>
                    </div>
                </li>
            </ul>
        </nav>
    </div>
</div>
<div id="container-full" class="container-full row">
    <div class="col-xl-2 left">
        <div id="accordion">
            <div class="card">
                <div class="card-header list-group-item-primary" data-toggle="collapse" href="#collapseOne">
                    <a class="card-link" data-toggle="collapse" href="#collapseOne">
                        业务分类
                    </a>
                </div>
                <div id="collapseOne" class="collapse show" data-parent="#accordion">
                    <div class="bg-dark">
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link text-center" href="#" onclick="showContent('${ctx}/user/list')">用户管理</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-center" href="#">车辆管理</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-center" href="#">车位管理</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" data-toggle="collapse" href="#collapseTwo">
                    <a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">
                        系统设置
                    </a>
                </div>
                <div id="collapseTwo" class="collapse" data-parent="#accordion">
                    <div class="bg-dark">
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link text-center" href="#">编码配置</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-center" href="#">角色管理</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-center" href="#">权限管理</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-center" href="#"></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" data-toggle="collapse" href="#collapse3">
                    <a class="collapsed card-link" data-toggle="collapse" href="#collapse3">
                        关于系统
                    </a>
                </div>
                <div id="collapse3" class="collapse" data-parent="#accordion">
                    <div class="bg-dark">
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link text-center" href="#">关于系统</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-center" href="#">帮助</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-center" href="#">联系我们</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-center" href="#">GitHub地址</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-10 right">
        <iframe src="${ctx}/user/list"></iframe>
    </div>
</div>
</body>
</html>
