package com.renyong.modules.other.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Auther: 任勇勇
 * @Date: 2019/5/9 21:57
 * @Description:
 */
@Controller
public class LoginController{
    @RequestMapping("/toLogin")
    public String toLoginPage(){//去登陆页面
        return "login";
    }
}
