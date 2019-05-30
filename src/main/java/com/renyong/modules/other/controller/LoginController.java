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
    /**
     * 访问登录界面
     * @return
     */
    @RequestMapping("/toLogin")
    public String toLoginPage(){//去登陆页面
        return "modules/login/login";
    }

    /**
     * 处理登录
     * @param userBean 用户信息
     * @param session session会话
     * @return
     */
    @RequestMapping("/dealwithLogin")
    public String dealwithLogin(UserBean userBean, HttpSession session){
        List<UserBean> userBeanList = service.findAll(userBean);//查询用户
        if(userBeanList!=null && !userBeanList.isEmpty()){
            session.setAttribute("userBean",userBeanList.get(0));
            return "welcome/mainMenu";
        }
        return "modules/login/login";
    }

    /**
     * 注销的方法
     * @param session
     * @return
     */
    @RequestMapping("/loginOut")
    public String loginOut(HttpSession session){
        if (session!=null){
            session.invalidate();//重置session
        }
        return "redirect:/toLogin";
    }
}
