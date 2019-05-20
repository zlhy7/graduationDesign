package com.renyong.modules.sys.web;
import com.github.pagehelper.PageInfo;
import com.renyong.base.util.GenerateUtil;
import com.renyong.base.util.StringUtil;
import com.renyong.base.web.BaseController;
import com.renyong.modules.sys.model.SysDictBean;
import com.renyong.modules.sys.service.SysDictBeanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Auther: 任勇勇
 * @Date: 2019/5/20 20:23:20
 * @Description: 字典管理控制器
 */
@Controller
@RequestMapping("/sysDictBean/")
public class SysDictBeanController extends BaseController<SysDictBeanService>{
    @Autowired
    private SysDictBeanService sysDictBeanBeanService;//汽车业务层
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
    public String save(SysDictBean sysDictBeanBean){
        if(StringUtil.isBlank(sysDictBeanBean.getId())){//添加

            sysDictBeanBeanService.insert(sysDictBeanBean);
        }else{//修改
            sysDictBeanBeanService.update(sysDictBeanBean);
        }
        return "redirect:list";
    }
    //去往表单页面
    @RequestMapping("fromconfig")
    public String formCfg(SysDictBean sysDictBeanBean,Model model){
        if(StringUtil.isBlank(sysDictBeanBean.getId())){
            String code = GenerateUtil.getAutoCd(sysDictBeanBean.getCD_NAME().split(",")[0]);
        }else{

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

}
