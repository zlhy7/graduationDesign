package com.renyong.modules.sys.web;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.renyong.base.util.StringUtil;
import com.renyong.base.web.BaseController;
import com.renyong.modules.sys.model.DomainBean;
import com.renyong.modules.sys.service.DomainBeanService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/**
 * @Auther: 任勇勇
 * @Date: 2019/6/1 20:48:20
 * @Description: 表域控制器
 */
@Controller
@RequestMapping("/domainBean/")
public class DomainBeanController extends BaseController<DomainBeanService>{
    /**
     * 查询一个
     * @param id
     * @return
     */
    @ModelAttribute("domainBean")
    public DomainBean get(String id){
        if(StringUtil.isBlank(id)){
            /**
             * 新建
             */
            return new DomainBean();
        }
        return service.get(id);
    }

    /**
     * 去往列表页面
     * @param domainBean
     * @param model
     * @return
     */
    @RequestMapping("list")
    public String list(DomainBean domainBean,Model model){
        PageInfo<DomainBean> page = service.findPage(domainBean);
        /**
         * 条件
         */
        model.addAttribute("domainBean",domainBean);
        /**
         * 记录行
         */
        model.addAttribute("page",page);
        /**
         * 分页栏
         */
        Map map = service.getMapObj(domainBean);
        model.addAttribute("pagingBar",getPagingBar(page));
        model.addAttribute("mapObj", JSONObject.toJSONString(map));
        return "modules/sys/domainBean/domainBean_list";
    }

    /**
     * 增加或修改记录行
     * @param domainBean
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("save")
    public String save(DomainBean domainBean,RedirectAttributes redirectAttributes){
        String messages = "";
        if(StringUtil.isBlank(domainBean.getId())){
            /**
             * 添加
             */
            service.insert(domainBean);
            messages = "添加成功";
        }else{
            /**
             * 修改
             */
            service.update(domainBean);
            messages = "修改成功";
        }
        return "redirect:list";
    }

    /**
     * 去往表单页面
     * @param domainBean
     * @param model
     * @return
     */
    @RequestMapping("fromconfig")
    public String formCfg(DomainBean domainBean,Model model){
        if(StringUtil.isBlank(domainBean.getId())){
            /**
             * 添加
             */

        }else{
            /**
             * 修改
             */
        }
        model.addAttribute("domainBean",domainBean);
        return "modules/sys/domainBean/domainBean_form";
    }

    /**
     * 删除某记录
     * @param domainBean 通过id逻辑删除
     * @return
     */
    @RequestMapping("remove")
    public String remove(DomainBean domainBean){
        service.delete(domainBean);
        return "redirect:list";
    }

    /**
     * 验证表域名唯一
     * @param domainBean 待验证的
     * @param domainName2 自身
     * @param out
     */
    @RequestMapping("checkDomainName")
    public void checkDomainName(DomainBean domainBean, String domainName2, PrintWriter out){
        List<DomainBean> domainBeanList = service.findAll(domainBean);
        /**
         * 为空表示可以用
         */
        boolean flag = domainBeanList.isEmpty();
        if(domainBean.getDomainName().equals(domainName2)){
            flag = true;
        }
        out.print(flag);
        out.flush();
        out.close();
    }

    /**
     * 检查表是否存在
     * @param domainBean
     * @param out
     */
    @RequestMapping("isTableExist")
    public void isTableExist(DomainBean domainBean, PrintWriter out){
        boolean flag = service.isTableExist(domainBean);
        out.print(flag);
        out.flush();
        out.close();
    }

    /**
     * 引入表域
     * @param domainBean
     * @return
     */
    @RequestMapping("toDomainPage")
    public String toDomainPage(DomainBean domainBean,Model model){
        /**
         * 数据源
         */
        Map map = service.getMapObj(domainBean);
        model.addAttribute("domainBean",domainBean);
        model.addAttribute("mapObj",map);
        return "modules/sys/domainBean/domainBean_list";
    }
}
