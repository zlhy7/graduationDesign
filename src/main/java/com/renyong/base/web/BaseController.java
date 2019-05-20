package com.renyong.base.web;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * @Auther: 任勇勇
 * @Date: 2019/5/9 23:38
 * @Description: 基础控制器
 */
public class BaseController<S>{
    @Autowired
    private S service;//业务层bean
    protected static StringBuffer pagingBarStr = new StringBuffer();
    //页面分页栏
    public String getPagingBar(PageInfo pageInfo){
        if(pageInfo == null){
            return "";
        }
        pagingBarStr.setLength(0);
        pagingBarStr.append("<ul class='pagination' style='float: right;'>");
        boolean preFlag = pageInfo.isHasPreviousPage();//是否还有上一页
        pagingBarStr.append("<li class='page-item"+(preFlag?"":" disabled")+"'><a class='page-link' href='javascript:page(1)'>首页</a></li>");
        pagingBarStr.append("<li class='page-item"+(preFlag?"":" disabled")+"'><a class='page-link' href='javascript:page("+pageInfo.getPrePage()+")'>上一页</a></li>");
        int[] pageNumLink = pageInfo.getNavigatepageNums();
        for(int i=0;i<pageNumLink.length;i++){//添加页码链
            preFlag = pageInfo.getPageNum() == pageNumLink[i];
            pagingBarStr.append("<li class='page-item"+(preFlag?" active":"")+"'><a class='page-link' href='javascript:page("+pageNumLink[i]+")'>"+pageNumLink[i]+"</a></li>");
        }
        boolean nextFlag = pageInfo.isHasNextPage();//是否还有下一页
        pagingBarStr.append("<li class='page-item"+(nextFlag?"":" disabled")+"'><a class='page-link' href='javascript:page("+pageInfo.getNextPage()+")'>下一页</a></li>");
        pagingBarStr.append("<li class='page-item"+(nextFlag?"":" disabled")+"'><a class='page-link' href='javascript:page("+pageInfo.getEndRow()+")'>尾页</a></li>");
        pagingBarStr.append("<li class='page-item disabled'><a class='page-link' href='javascript:void(0))'>共"+pageInfo.getTotal()+"条记录,共"+pageInfo.getPages()+"页</a></li></ul>");
        return pagingBarStr.toString();
    }
    //页面提示信息
    protected void addMessage(RedirectAttributes redirectAttributes, String... messages) {
        StringBuilder sb = new StringBuilder();
        String[] var7 = messages;
        int var6 = messages.length;

        for(int var5 = 0; var5 < var6; ++var5) {
            String message = var7[var5];
            sb.append(message).append(messages.length > 1 ? "<br/>" : "");
        }

        redirectAttributes.addFlashAttribute("message", sb.toString());
    }
}
