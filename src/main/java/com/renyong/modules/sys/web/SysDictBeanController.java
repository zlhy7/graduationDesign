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
    /**
     * 字典业务层
     */
    @Autowired
    private SysDictBeanService sysDictBeanBeanService;

    /**
     * 查询一个
     * @param id
     * @return
     */
    @ModelAttribute("sysDictBeanBean")
    public SysDictBean get(String id){
        if(StringUtil.isBlank(id)){
            /**
             * 新建
             */
            return new SysDictBean();
        }
        return sysDictBeanBeanService.get(id);
    }

    /**
     * 去往列表页面
     * @param sysDictBeanBean
     * @param model
     * @return
     */
    @RequestMapping("list")
    public String list(SysDictBean sysDictBeanBean,Model model){
        PageInfo<SysDictBean> page = sysDictBeanBeanService.findPage(sysDictBeanBean);
        /**
         * 条件
         */
        model.addAttribute("sysDictBeanBean",sysDictBeanBean);
        /**
         * 记录行
         */
        model.addAttribute("page",page);
        /**
         * 分页栏
         */
        model.addAttribute("pagingBar",getPagingBar(page));
        return "modules/sys/sysDictBean/sysDictBean_list";
    }

    /**
     * 增加或修改记录行
     * @param sysDictBeanBean
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("save")
    public String save(SysDictBean sysDictBeanBean,RedirectAttributes redirectAttributes){
        String messages = "";
        if(StringUtil.isBlank(sysDictBeanBean.getId())){
            /**
             * 添加
             */
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
        return "redirect:list";
    }

    /**
     * 去往表单页面
     * @param sysDictBeanBean
     * @param model
     * @return
     */
    @RequestMapping("fromconfig")
    public String formCfg(SysDictBean sysDictBeanBean,Model model){
        if(StringUtil.isBlank(sysDictBeanBean.getDictEnglishName())){
            /**
             * 添加
             */

        }else{
            /**
             * 修改
             */
            List<SysDictBean> sysDictBeanList = sysDictBeanBeanService.findAll(sysDictBeanBean);
            model.addAttribute("key_value_list",sysDictBeanList);
        }
        model.addAttribute("sysDictBean",sysDictBeanBean);
        return "modules/sys/sysDictBean/sysDictBean_form";
    }

    /**
     * 删除某记录
     * @param dictEnglishName
     * @return
     */
    @RequestMapping("remove")
    public String remove(String dictEnglishName){
        sysDictBeanBeanService.deleteByDictName(dictEnglishName);
        return "redirect:list";
    }

    /**
     * 验证英文名唯一
     * @param sysDictBean
     * @param dictEnglishName2
     * @param out
     */
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
