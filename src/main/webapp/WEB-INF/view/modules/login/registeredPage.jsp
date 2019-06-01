<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title></title>
</head>
<body>
<form name="form2">
    <div class="p-2 d-flex hang">
        <div class="input-group-prepend">
            <span class="input-group-text">用户名：</span>
        </div>
        <input type="text" id="loginName" name="loginName" class="form-control" placeholder="请输入用户名"
               value="${userBean.loginName}"/>
    </div>
    <div class="p-2 d-flex hang">
        <div class="input-group-prepend">
            <span class="input-group-text">密码：</span>
        </div>
        <input type="text" id="password" name="password" class="form-control" placeholder="请输入用户名"
               value="${userBean.loginName}"/>
    </div>
    <div class="p-2 d-flex hang">
        <div class="input-group-prepend">
            <span class="input-group-text">确认密码：</span>
        </div>
        <input type="text" id="loginName" name="loginName" class="form-control" placeholder="请输入用户名"
               value="${userBean.loginName}"/>
    </div>
    <div class="p-2 d-flex hang">
        <div class="input-group-prepend">
            <span class="input-group-text">联系电话：</span>
        </div>
        <input type="text" id="loginName" name="loginName" class="form-control" placeholder="请输入用户名"
               value="${userBean.loginName}"/>
    </div>
    联系电话:<input type="tel" id="tel" name="tel"/><br/>
    地址:<select id="provinces"></select><select id="city"></select><select id="county"></select>
    <div class="eye">
        <input type="submit" id="register_submit" name="submit" value="注册"/>
        <input type="reset" id="register_reset" name="reset" value="重置"/>
    </div>
</form>
</body>
</html>
