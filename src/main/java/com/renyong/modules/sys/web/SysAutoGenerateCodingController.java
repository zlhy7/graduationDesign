package com.renyong.modules.sys.web;
import com.github.pagehelper.PageInfo;
import com.renyong.base.util.StringUtil;
import com.renyong.base.web.BaseController;
import com.renyong.modules.sys.model.SysAutoGenerateCoding;
import com.renyong.modules.sys.service.SysAutoGenerateCodingService;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Autowired
    private SysAutoGenerateCodingService sysAutoGenerateCodingBeanService;//字典业务层
    //查询一个
    @ModelAttribute("sysAutoGenerateCodingBean")
    public SysAutoGenerateCoding get(String id){
        if(StringUtil.isBlank(id)){//新建
            return new SysAutoGenerateCoding();
        }
        return sysAutoGenerateCodingBeanService.get(id);
    }
    //去往列表页面
    @RequestMapping("list")
    public String list(SysAutoGenerateCoding sysAutoGenerateCodingBean,Model model){
        PageInfo<SysAutoGenerateCoding> page = sysAutoGenerateCodingBeanService.findPage(sysAutoGenerateCodingBean);
        model.addAttribute("sysAutoGenerateCodingBean",sysAutoGenerateCodingBean);//条件
        model.addAttribute("page",page);//记录行
        model.addAttribute("pagingBar",getPagingBar(page));//分页栏
        return "modules/sys/sysAutoGenerateCoding/sysAutoGenerateCoding_list";
    }
    //增加或修改记录行
    @RequestMapping("save")
    public String save(SysAutoGenerateCoding sysAutoGenerateCodingBean,RedirectAttributes redirectAttributes){
        String messages = "";
        if(StringUtil.isBlank(sysAutoGenerateCodingBean.getId())){//添加
            String currtNum = String.format("%0"+sysAutoGenerateCodingBean.getCdLength()+"d",sysAutoGenerateCodingBean.getCdStartNum());
            sysAutoGenerateCodingBean.setCdCurrentNum(currtNum);
            sysAutoGenerateCodingBeanService.insert(sysAutoGenerateCodingBean);
            messages = "添加成功";
        }else{//修改
            sysAutoGenerateCodingBeanService.update(sysAutoGenerateCodingBean);
            messages = "修改成功";
        }
        addMessage(redirectAttributes,messages);
        return "redirect:list";
    }
    //去往表单页面
    @RequestMapping("fromconfig")
    public String formCfg(SysAutoGenerateCoding sysAutoGenerateCodingBean,Model model){
        if(StringUtil.isBlank(sysAutoGenerateCodingBean.getId())){//添加

        }else{//修改
            List<SysAutoGenerateCoding> sysAutoGenerateCodingList = sysAutoGenerateCodingBeanService.findAll(sysAutoGenerateCodingBean);
            model.addAttribute("key_value_list",sysAutoGenerateCodingList);
        }
        model.addAttribute("sysAutoGenerateCoding",sysAutoGenerateCodingBean);
        return "modules/sys/sysAutoGenerateCoding/sysAutoGenerateCoding_form";
    }
    //删除某记录
    @RequestMapping("remove")
    public String remove(SysAutoGenerateCoding sysAutoGenerateCodingBean){
        sysAutoGenerateCodingBeanService.delete(sysAutoGenerateCodingBean);
        return "redirect:list";
    }
    //验证英文名唯一
    @RequestMapping("checkCdEnglishName")
    public void checkDictEnglishName(SysAutoGenerateCoding sysAutoGenerateCoding, String cdEnglishName2, PrintWriter out){
        List<SysAutoGenerateCoding> sysAutoGenerateCodingList = sysAutoGenerateCodingBeanService.findAll(sysAutoGenerateCoding);
        boolean flag = sysAutoGenerateCodingList.size()==0;
        if(sysAutoGenerateCoding.getCdEnglishName().equals(cdEnglishName2)){
            flag = true;
        }
        out.print(flag);
        out.flush();
        out.close();
    }
}
