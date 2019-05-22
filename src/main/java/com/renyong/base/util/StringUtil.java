package com.renyong.base.util;

import java.lang.reflect.Field;

/**
 * @Auther: 任勇勇
 * @Date: 2019/4/14 16:34
 * @Description: 字符串相关工具
 */
public class StringUtil<T> {
    private static StringBuffer sb = new StringBuffer();
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
    //没测试好呢
    //简单对象转json对象,mapping例子
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

}
