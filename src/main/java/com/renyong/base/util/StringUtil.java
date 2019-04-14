package com.renyong.base.util;

/**
 * @Auther: 任勇勇
 * @Date: 2019/4/14 16:34
 * @Description: 字符串相关工具
 */
public class StringUtil {
    /**
     *
     * @param //被判断字段
     * @return 返回布尔值
     */
    //字符串是否是不空的
    public static boolean isNotBlank(String str){
        if(str!=null && str.trim().length()>0){
            return true;
        }
        return false;
    }
    /**
     *
     * @param //被判断字段
     * @return 返回布尔值
     */
    //字符串是否是空的
    public static boolean isBlank(String str){
        return !isNotBlank(str);
    }

}
