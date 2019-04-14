package com.renyong.base.util;

import java.util.UUID;

/**
 * @Auther: 任勇勇
 * @Date: 2019/4/14 16:30
 * @Description:  生成编码工具类
 */
public class generateUtil {
    public static String uuid() {//生成uuid
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
}
