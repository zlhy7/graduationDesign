package com.renyong.modules.sys.web;
import com.github.pagehelper.PageInfo;
import com.renyong.base.util.StringUtil;
import com.renyong.base.web.BaseController;
import com.renyong.modules.sys.model.SysAutoGenerateCoding;
import com.renyong.modules.sys.service.SysAutoGenerateCodingService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.PrintWriter;
import java.util.List;

/**
 * @Auther: 任勇勇
 * @Date: 2019/5/20 20:23:20
 * @Description: 字典管理控制器
 */
@Controller
@RequestMapping("/sysAutoGenerateCoding/")
public class SysAutoGenerateCodingController extends BaseController<SysAutoGenerateCodingService>{

    /**
     * 查询一个
     * @param id
     * @return
     */
    @ModelAttribute("sysAutoGenerateCodingBean")
    public SysAutoGenerateCoding get(String id){
        if(StringUtil.isBlank(id)){
            /**
             * 新建
             */
            return new SysAutoGenerateCoding();
        }
        return service.get(id);
    }

    /**
     * 去往列表页面
     * @param sysAutoGenerateCodingBean
     * @param model
     * @return
     */
    @RequestMapping("list")
    public String list(SysAutoGenerateCoding sysAutoGenerateCodingBean,Model model){
        PageInfo<SysAutoGenerateCoding> page = service.findPage(sysAutoGenerateCodingBean);
        /**
         * 条件
         */
        model.addAttribute("sysAutoGenerateCodingBean",sysAutoGenerateCodingBean);
        /**
         * 记录行
         */
        model.addAttribute("page",page);
        /**
         * 分页栏
         */
        model.addAttribute("pagingBar",getPagingBar(page));
        return "modules/sys/sysAutoGenerateCoding/sysAutoGenerateCoding_list";
    }

    /**
     * 增加或修改记录行
     * @param sysAutoGenerateCodingBean
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("save")
    public String save(SysAutoGenerateCoding sysAutoGenerateCodingBean,RedirectAttributes redirectAttributes){
        String messages = "";
        if(StringUtil.isBlank(sysAutoGenerateCodingBean.getId())){
            /**
             * 添加
             */
            String currtNum = String.format("%0"+sysAutoGenerateCodingBean.getCdLength()+"d",sysAutoGenerateCodingBean.getCdStartNum());
            sysAutoGenerateCodingBean.setCdCurrentNum(currtNum);
            service.insert(sysAutoGenerateCodingBean);
            messages = "添加成功";
        }else{//修改
            service.update(sysAutoGenerateCodingBean);
            messages = "修改成功";
        }
        return "redirect:list";
    }

    /**
     * 去往表单页面
     * @param sysAutoGenerateCodingBean
     * @param model
     * @return
     */
    @RequestMapping("fromconfig")
    public String formCfg(SysAutoGenerateCoding sysAutoGenerateCodingBean,Model model){
        if(StringUtil.isBlank(sysAutoGenerateCodingBean.getId())){
            /**
             * 添加
             */

        }else{
            /**
             * 修改
             */
        }
        model.addAttribute("sysAutoGenerateCoding",sysAutoGenerateCodingBean);
        return "modules/sys/sysAutoGenerateCoding/sysAutoGenerateCoding_form";
    }

    /**
     * 删除某记录
     * @param sysAutoGenerateCodingBean
     * @return
     */
    @RequestMapping("remove")
    public String remove(SysAutoGenerateCoding sysAutoGenerateCodingBean){
        service.delete(sysAutoGenerateCodingBean);
        return "redirect:list";
    }

    /**
     * 验证英文名唯一
     * @param sysAutoGenerateCoding
     * @param cdEnglishName2
     * @param out
     */
    @RequestMapping("checkCdEnglishName")
    public void checkDictEnglishName(SysAutoGenerateCoding sysAutoGenerateCoding, String cdEnglishName2, PrintWriter out){
        List<SysAutoGenerateCoding> sysAutoGenerateCodingList = service.findAll(sysAutoGenerateCoding);
        boolean flag = sysAutoGenerateCodingList.size()==0;
        if(sysAutoGenerateCoding.getCdEnglishName().equals(cdEnglishName2)){
            flag = true;
        }
        out.print(flag);
        out.flush();
        out.close();
    }
    @RequestMapping("exceptionalPage")
    public String toExceptionalPage(){
        return "modules/sys/exceptional/exceptional";
    }
}
