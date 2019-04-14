package com.renyong.modules.car.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Auther: 任勇勇
 * @Date: 2019/4/12 12:28
 * @Description:
 */
@Controller
@RequestMapping("/car/")
public class CarController {
    @RequestMapping("list")
    public String list(){
        return "index";
    }
    @RequestMapping("toLoginPage")
    public String loginPage(){
        return "login";
    }
    @RequestMapping("ss")
    public String ss(){
        return "ss";
    }
}
