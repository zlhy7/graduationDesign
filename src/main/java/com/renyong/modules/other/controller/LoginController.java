package com.renyong.modules.other.controller;

import com.renyong.base.util.CookieUtil;
import com.renyong.base.util.StringUtil;
import com.renyong.base.util.UserUtil;
import com.renyong.base.web.BaseController;
import com.renyong.modules.user.model.UserBean;
import com.renyong.modules.user.service.UserBeanService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

/**
 * @Auther: 任勇勇
 * @Date: 2019/5/9 21:57
 * @Description: 登录注销相关的控制器
 */
@Controller
@RequestMapping("/loginController/")
public class LoginController extends BaseController<UserBeanService>{
    /**
     * 访问登录界面
     * @param userBean 用户信息
     * @param response
     * @param request
     * @param model
     * @param message 提示信息
     * @return
     */
    @RequestMapping("toLogin")
    public String toLoginPage(UserBean userBean,HttpServletResponse response, HttpServletRequest request,Model model,String message){//去登陆页面
        //登录名
        String loginName = CookieUtil.getCookie(request,response,"loginName",false);
        /**
         * 如果本地cookie有密码记录则读取
         */
        if(StringUtil.isNotBlank(loginName)){
            userBean.setLoginName(loginName);
            String password = CookieUtil.getCookie(request,response,loginName,false);
            userBean.setPassword(password);
        }
        if(StringUtil.isNotBlank(message)){
            /**
             * 如果有提示信息就提示
             */
            model.addAttribute("message",message);
        }
        model.addAttribute("userBean",userBean);
        return "modules/login/login";
    }

    /**
     * 去往主菜单的请求
     * @return
     */
    @RequestMapping("toMainMenu")
    public String toMainMenu(){
        return "welcome/mainMenu";
    }
    /**
     * 处理登录
     * @param userBean 用户信息
     * @param session session会话
     * @return
     */
    @RequestMapping("dealwithLogin")
    public String dealwithLogin(UserBean userBean, @RequestParam(required = false) String keepPwd, HttpSession session, HttpServletResponse response, HttpServletRequest request, Model model,RedirectAttributes redirectAttributes){
        List<UserBean> userBeanList = service.findAll(userBean);
        /**
         * 查询用户
         */
        if (userBeanList!=null && !userBeanList.isEmpty()){
            session.setAttribute("userBean",userBeanList.get(0));
            /**
             * 提示信息清空
             */
            message="";
            if(keepPwd!=null){
                /**
                 * 保存用户信息到本地
                 */
                /**
                 * 7天有效
                 */
                CookieUtil.setCookie(response,"loginName",userBeanList.get(0).getLoginName(),60*60*24*7);
                CookieUtil.setCookie(response,userBeanList.get(0).getLoginName(),userBeanList.get(0).getPassword(),60*60*24*7);
            }else{
                //移除本地用户信息
                CookieUtil.getCookie(request,response,"loginName",true);
                CookieUtil.getCookie(request,response,userBeanList.get(0).getLoginName(),true);
            }
            /**
             * 登录标识
             */
            return "redirect:iframeSrc?modulesName=loginPage&loginFlag=success";
        } else {
            message="密码错误";
        }
        addMessage(redirectAttributes,message);
        return "redirect:iframeSrc?modulesName=loginPage";
    }

    /**
     * 注销的方法
     * @param session
     * @return
     */
    @RequestMapping("loginOut")
    public String loginOut(HttpSession session){
        if (session!=null){
            /**
             * 重置session
             */
            session.invalidate();
            /**
             * 清空UserUtil里的当前用户
             */
            UserUtil.setCurrentUserBean(null);
        }
        return "redirect:toLogin";
    }

    /**
     * 检测是否存在该用户
     * @param userBean
     * @param out
     */
    @RequestMapping("isExistsUser")
    public void isExistsUser(UserBean userBean, PrintWriter out){
        List<UserBean> userBeanList = service.findAll(userBean);
        boolean flag = !userBeanList.isEmpty();
        out.print(flag);
        out.flush();
        out.close();
    }

    /**
     * 供页面iframe使用的请求处理
     * @param modulesName
     * @return
     */
    @RequestMapping("iframeSrc")
    public String iframeChildrenModules(@RequestParam(required = false) String modulesName,@RequestParam(required = false) String loginFlag,Model model){
        if(StringUtil.isBlank(modulesName)){
            modulesName = "loginPage";
        }
        if(StringUtil.isNotBlank(loginFlag)){
            model.addAttribute("loginFlag",loginFlag);
        }
        return "modules/login/"+modulesName;
    }
}
