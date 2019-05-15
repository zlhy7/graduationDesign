package com.renyong.modules.user.web;
import com.renyong.base.util.StringUtil;
import com.renyong.modules.user.model.UserBean;
import com.renyong.modules.user.service.UserBeanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;
/**
 * @Auther: 任勇勇
 * @Date: 2019/4/12 12:28
 * @Description: 用户管理控制器
 */
@Controller
@RequestMapping("/user/")
public class UserBeanController {
    @Autowired
    private UserBeanService userBeanService;//汽车业务层
    //查询一个
    @ModelAttribute("userBean")
    public UserBean get(String id){
        if(StringUtil.isBlank(id)){//新建
            return new UserBean();
        }
        return userBeanService.get(id);
    }
    //去往列表页面
    @RequestMapping("list")
    public String list(UserBean userBean,Model model){
        List<UserBean> userBeanList = userBeanService.findAll(userBean);
        model.addAttribute("userBean",userBean);//条件
        model.addAttribute("userBeanList",userBeanList);//记录行
        return "modules/user/user_list";
    }
    //增加或修改记录行
    @RequestMapping("save")
    public String save(UserBean userBean){
        if(StringUtil.isBlank(userBean.getId())){//添加
            userBeanService.insert(userBean);
        }else{//修改
            userBeanService.update(userBean);
        }
        return "index";
    }
    //去往表单页面
    @RequestMapping("fromconfig")
    public String formCfg(UserBean userBean,Model model){
        List<UserBean> userBeanList = userBeanService.findAll();
        return "index";
    }
    //删除某记录
    @RequestMapping("remove")
    public String remove(UserBean userBean){

        return "index";
    }

}
