// 列表宽度重设
function tableWidthReset(widths){
    $('#contentTable').find("th").each(function(index){
        $(this).css("width",widths[index]);
    });
}
//全选，反选
//动态复选框事件
$(".chooseOne").on("click",function(){
    if($(".chooseOne:checked").length==$(".chooseOne:not(:disabled)").length){//全部选中时
        $(".chooseAll").prop("checked",true);
    }else if($(".chooseOne:checked").length < $(".chooseOne:not(:disabled)").length){//选中数量小于可用复选框数量
        $(".chooseAll").prop("checked",false);
    }
});