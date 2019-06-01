package com.renyong.modules.user.web;

import com.github.pagehelper.PageInfo;
import com.renyong.base.util.GenerateUtil;
import com.renyong.base.util.StringUtil;
import com.renyong.base.web.BaseController;
import com.renyong.modules.sys.service.DomainBeanService;
import com.renyong.modules.user.model.UserBean;
import com.renyong.modules.user.service.UserBeanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.PrintWriter;
import java.util.List;

/**
 * @Auther: 任勇勇
 * @Date: 2019/4/12 12:28
 * @Description: 用户管理控制器
 */
@Controller
@RequestMapping("/user/")
public class UserBeanController extends BaseController<UserBeanService>{
    @Autowired
    private DomainBeanService domainBeanService;

    /**
     * 查询一个
     * @param id
     * @return
     */
    @ModelAttribute("userBean")
    public UserBean get(String id){
        if(StringUtil.isBlank(id)){
            /**
             * 新建
             */
            return new UserBean();
        }
        return service.get(id);
    }

    /**
     * 去往列表页面
     * @param userBean
     * @param model
     * @return
     */
    @RequestMapping("list")
    public String list(UserBean userBean,Model model){
        PageInfo<UserBean> page = service.findPage(userBean);
        /**
         * 条件
         */
        model.addAttribute("userBean",userBean);
        /**
         * 记录行
         */
        model.addAttribute("page",page);
        /**
         * 分页栏
         */
        model.addAttribute("pagingBar",getPagingBar(page));
        /**
         * 自动完成框数据源
         */
        model.addAttribute("autocompleteData",getUserRealName(page.getList()));
        return "modules/user/user_list";
    }

    /**
     * 增加或修改记录行
     * @param userBean
     * @return
     */
    @RequestMapping("save")
    public String save(UserBean userBean){
        if(StringUtil.isBlank(userBean.getId())){
            /**
             * 添加
             */
            service.insert(userBean);
        }else{
            /**
             * 修改
             */
            service.update(userBean);
        }
        return "redirect:list";
    }

    /**
     * 去往表单页面
     * @param userBean
     * @param model
     * @return
     */
    @RequestMapping("fromconfig")
    public String formCfg(UserBean userBean,Model model){
        if(StringUtil.isBlank(userBean.getId())){
            String code = GenerateUtil.getAutoCd("USER_CD");
            userBean.setUserCd(code);
        }
        model.addAttribute("userBean",userBean);
        return "modules/user/user_form";
    }

    /**
     * 删除某记录
     * @param userBean
     * @return
     */
    @RequestMapping("remove")
    public String remove(UserBean userBean){
        service.delete(userBean);
        return "redirect:list";
    }

    /**
     * 验证用户名唯一
     * @param userBean
     * @param loginName2
     * @param out
     */
    @RequestMapping("checkLoginName")
    public void checkDictEnglishName(UserBean userBean, String loginName2, PrintWriter out){
        List<UserBean> userBeanList = service.findAll(userBean);
        boolean flag = userBeanList.size()==0;
        if(userBean.getLoginName().equals(loginName2)){
            flag = true;
        }
        out.print(flag);
        out.flush();
        out.close();
    }

    /**
     * 获取全部名称供页面自动完成框使用
     * @param userBeanList
     * @return
     */
    public String getUserRealName(List<UserBean> userBeanList){
        StringBuffer sb = new StringBuffer("[");
        for (UserBean userBean:userBeanList){
            if(sb.indexOf(userBean.getRealName())==-1){
                /**
                 * 已存在
                 */
                sb.append("'"+userBean.getRealName()+"',");
            }
        }
        if(sb.length()>1){
            sb.deleteCharAt(sb.length()-1);
        }
        sb.append("]");
        return sb.toString();
    }
}
