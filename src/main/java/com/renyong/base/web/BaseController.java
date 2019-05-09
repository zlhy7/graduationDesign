package com.renyong.base.web;

import org.springframework.beans.factory.annotation.Autowired;

/**
 * @Auther: 任勇勇
 * @Date: 2019/5/9 23:38
 * @Description: 基础控制器
 */
public class BaseController<S>{
    @Autowired
    private S service;//业务层bean

}
