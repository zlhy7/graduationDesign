package com.renyong.base.util;

import java.lang.reflect.Field;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @Auther: 任勇勇
 * @Date: 2019/4/14 16:34
 * @Description: 字符串相关工具
 */
public class StringUtil<T> {
    private static StringBuffer sb = new StringBuffer();
    private static Pattern linePattern = Pattern.compile("_(\\w)");
    /**
     * 字符串是否是不空的
     * @param //被判断字段
     * @return 返回布尔值
     */
    public static boolean isNotBlank(String str){
        if(str!=null && str.trim().length()>0){
            return true;
        }
        return false;
    }
    /**
     * 字符串是否是空的
     * @param //被判断字段
     * @return 返回布尔值
     */
    public static boolean isBlank(String str){
        return !isNotBlank(str);
    }
    /*
    java 属性:json key    单个
    java 属性1:json key1,java 属性2:json key2,java 属性3:json key3
    例如：userName:name,password：pwd
     */
    public static<T> String javaObjToJsonStr(T t,String mapping){
        sb.setLength(0);//清空sb
        sb.append("{");
        Class<T> classT = (Class<T>) t.getClass();
        String[] maps = mapping.split(",");//映射集
        for(int i=0;i<maps.length;i++){
            try {
                Field field = classT.getDeclaredField(maps[i].split(":")[0]);
                sb.append(maps[i].split(":")[1]+":"+(String)field.get(t)+",");
            } catch (NoSuchFieldException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
        sb.deleteCharAt(sb.length()-1);
        sb.append("}");
        return sb.toString();
    }

    /**
     * 下划线命名转驼峰命名 多个
     * @param lineStr 待转化对的变量名。可传多个，例如"table_name,line_id",多个之间逗号隔开
     * @return
     */
    public String linesToHumps(String lineStr){
        sb.setLength(0);
        /**
         * 待转化的变量名
         */
        String[] names = lineStr.split(",");
        for(int i=0;i < names.length;i++){
            sb.append(lineToHump(names[i].toLowerCase())+",");
        }
        sb.deleteCharAt(sb.length()-1);
        return sb.toString();
    }

    /**
     * 下划线转驼峰 单个
     * @param str
     * @return
     */
    public static String lineToHump(String str) {
        str = str.toLowerCase();
        Matcher matcher = linePattern.matcher(str);
        StringBuffer sb = new StringBuffer();
        while (matcher.find()) {
            matcher.appendReplacement(sb, matcher.group(1).toUpperCase());
        }
        matcher.appendTail(sb);
        return sb.toString();
    }
}
