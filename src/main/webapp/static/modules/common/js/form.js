//登录名验证/变量名验证
$.validator.addMethod("checkLoginName",function(value,element,params){
    //以字母开头，其他的由字母，数字，下划线组成
    var regex = /^[a-zA-Z][a-zA-Z0-9_]+$/;
    return regex.test(value);
},"用户名以字母开头");
//姓名验证 / 中文验证
$.validator.addMethod("checkRealName",function(value,element,params){
    //真实姓名为2~5位的汉字
    var regex = /^[\u4E00-\uFA29]+$/;
    return regex.test(value);
},"姓名必须是中文");
//去登录
function toLogin() {
    top.window.location.href = ctx+"/loginController/toLogin";
}
//去主菜单
function toMainMenu() {
    top.window.location.href = ctx+"/loginController/toMainMenu";
}
//所有select 渲染成selec2
$(function () {
    $("select").addClass("form-control select2");
    $("select").each(function () {
        $(this).select2({
            placeholder: "请选择",
            allowClear: true
        });
    });
});

/**
 *
 * @param domainName 表域名
 * @param obj 当前标签
 */
function domain(domainName,obj) {
    layer.open({
        type: 2,
        area: ['700px', '450px'],
        fixed: false, //不固定
        maxmin: true,
        content: '/domainBean/toDomainPage'
    });
}