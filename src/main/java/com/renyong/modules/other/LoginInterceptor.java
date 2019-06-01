package com.renyong.modules.other;

import com.renyong.base.util.UserUtil;
import com.renyong.modules.user.model.UserBean;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

/**
 * @Auther: 任勇勇
 * @Date: 2019/4/12 16:58
 * @Description: 登录拦截器
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        boolean flag = true;
        /**
         * 在拦截点执行前拦截，如果返回true则不执行拦截点后的操作（拦截成功）
         * 返回false则不执行拦截
         */
        HttpSession session = request.getSession();
        /**
         *  获取登录的uri，这个是不进行拦截的
         */
        String uri = request.getRequestURI();
        /**
         *  不拦截去登录页面，处理登录，或是注销登录的请求
         */
        if (session.getAttribute("userBean")==null) {
            /**
             * 拦截后进入登录页面
             * 顶级对象返回登录页
             */
            PrintWriter out = response.getWriter();
            out.print("<script type='text/javascript' charset='UTF-8'>" +
                    "top.window.location.href = \"/loginController/toLogin?message=noLogined\";" +
                    "</script>");
            flag = false;
        } else {
            /**
             * session中保存了当前用户
             */
            UserBean userBean = (UserBean) session.getAttribute("userBean");
            UserUtil.setCurrentUserBean(userBean);
        }
        return flag;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
