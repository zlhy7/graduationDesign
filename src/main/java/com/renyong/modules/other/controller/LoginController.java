package com.renyong.modules.other.controller;

import com.renyong.base.web.BaseController;
import com.renyong.modules.user.model.UserBean;
import com.renyong.modules.user.service.UserBeanService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Auther: 任勇勇
 * @Date: 2019/5/9 21:57
 * @Description:
 */
@Controller
public class LoginController extends BaseController<UserBeanService>{
    @RequestMapping("/toLogin")
    public String toLoginPage(){//去登陆页面
        return "modules/login/login";
    }
    @RequestMapping("/dealwithLogin")
    public String dealwithLogin(UserBean userBean, HttpSession session){//处理登录
        List<UserBean> userBeanList = service.findAll(userBean);//查询用户
        if(userBeanList!=null && !userBeanList.isEmpty()){
            session.setAttribute("userBean",userBeanList.get(0));
            return "welcome/mainMenu";
        }
        return "modules/login/login";
    }
}
