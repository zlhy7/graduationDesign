package com.renyong.modules.sys.web;
import com.github.pagehelper.PageInfo;
import com.renyong.base.util.StringUtil;
import com.renyong.base.web.BaseController;
import com.renyong.modules.sys.model.SysDictBean;
import com.renyong.modules.sys.service.SysDictBeanService;
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
@RequestMapping("/sysDictBean/")
public class SysDictBeanController extends BaseController<SysDictBeanService>{
    @Autowired
    private SysDictBeanService sysDictBeanBeanService;//字典业务层
    //查询一个
    @ModelAttribute("sysDictBeanBean")
    public SysDictBean get(String id){
        if(StringUtil.isBlank(id)){//新建
            return new SysDictBean();
        }
        return sysDictBeanBeanService.get(id);
    }
    //去往列表页面
    @RequestMapping("list")
    public String list(SysDictBean sysDictBeanBean,Model model){
        PageInfo<SysDictBean> page = sysDictBeanBeanService.findPage(sysDictBeanBean);
        model.addAttribute("sysDictBeanBean",sysDictBeanBean);//条件
        model.addAttribute("page",page);//记录行
        model.addAttribute("pagingBar",getPagingBar(page));//分页栏
        return "modules/sys/sysDictBean/sysDictBean_list";
    }
    //增加或修改记录行
    @RequestMapping("save")
    public String save(SysDictBean sysDictBeanBean,RedirectAttributes redirectAttributes){
        String messages = "";
        if(StringUtil.isBlank(sysDictBeanBean.getId())){//添加
            String[] keys = sysDictBeanBean.getDictKey().split(",");
            String[] values = sysDictBeanBean.getDictValue().split(",");
            for (int i=0;i<keys.length;i++){
                sysDictBeanBean.setDictKey(keys[i]);
                sysDictBeanBean.setDictValue(values[i]);
                sysDictBeanBeanService.insert(sysDictBeanBean);
                sysDictBeanBean.setId(null);
            }
            messages = "添加成功";
        }else{//修改
            sysDictBeanBeanService.update(sysDictBeanBean);
            messages = "修改成功";
        }
        addMessage(redirectAttributes,messages);
        return "redirect:list";
    }
    //去往表单页面
    @RequestMapping("fromconfig")
    public String formCfg(SysDictBean sysDictBeanBean,Model model){
        if(StringUtil.isBlank(sysDictBeanBean.getId())){//添加

        }else{//修改

        }
        model.addAttribute("sysDictBeanBean",sysDictBeanBean);
        return "modules/sys/sysDictBean/sysDictBean_form";
    }
    //删除某记录
    @RequestMapping("remove")
    public String remove(SysDictBean sysDictBeanBean){
        sysDictBeanBeanService.delete(sysDictBeanBean);
        return "redirect:list";
    }
    //验证英文名唯一
    @RequestMapping("checkDictEnglishName")
    public void checkDictEnglishName(SysDictBean sysDictBean, String dictEnglishName2, PrintWriter out){
        List<SysDictBean> sysDictBeanList = sysDictBeanBeanService.findAll(sysDictBean);
        boolean flag = sysDictBeanList.size()==0;
        if(sysDictBean.getDictEnglishName().equals(dictEnglishName2)){
            flag = true;
        }
        out.print(flag);
        out.flush();
        out.close();
    }
}
