// 列表宽度重设
function tableWidthReset(widths){
    $('#contentTable').find("th").each(function(index){
        $(this).css("width",widths[index]);
    });
}
//全选，反选
//动态复选框事件
$(document).on(".chooseOne","click",function(){
    if($(".chooseOne:checked").length==$(".chooseOne").length){//全部选中时
        $(".chooseAll").prop("checked",true);
    }else if($(".chooseOne:checked").length < $(".chooseOne").length){//选中数量小于可用复选框数量
        $(".chooseAll").prop("checked",false);
    }
});

$(document).on(".chooseAll","click",function(){
    $(".chooseOne").prop("chekced",$(this).prop("checked"));
});
//确认提示框
function confirmx(msg,obj){
    layer.confirm(msg, {
        btn: ['确认','取消'],//按钮
        title:"警告"
    }, function(){
        window.location.href = obj.href;
        return false;
    }, function(index){
        layer.close(index);
        return false;
    });
    return false;
}
$(function () {
    //name相同id不同即可,validate验证扩展
    if($.validator){
            $.validator.prototype.elements = function () {
                var validator = this,
                    rulesCache = {};
                // Select all valid inputs inside the form (no submit or reset buttons)
                return $( this.currentForm )
                    .find( "input, select, textarea, [contenteditable]" )
                    .not( ":submit, :reset, :image, :disabled" )
                    .not( this.settings.ignore )
                    .filter( function() {
                        var name = this.id || this.name || $( this ).attr( "name" ); // For contenteditable
                        if ( !name && validator.settings.debug && window.console ) {
                            console.error( "%o has no name assigned", this );
                        }
                        // Set form expando on contenteditable
                        if ( this.hasAttribute( "contenteditable" ) ) {
                            this.form = $( this ).closest( "form" )[ 0 ];
                        }
                        // Select only the first element for each name, and only those with rules specified
                        if (name in rulesCache || !validator.objectLength( $( this ).rules() ) ) {
                            return false;
                        }
                        rulesCache[ name ] = true;
                        return true;
                    } );
            }
        }
});
