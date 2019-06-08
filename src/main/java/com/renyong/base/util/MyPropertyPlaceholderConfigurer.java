package com.renyong.base.util;

import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

/**
 * @Auther: 任勇勇
 * @Date: 2019/6/8 22:08
 * @Description: 继承属性加解密类，用于解析加密的jdbc配置文件
 */
public class MyPropertyPlaceholderConfigurer extends PropertyPlaceholderConfigurer {
    @Override
    protected String convertProperty(String propertyName, String propertyValue) {
        System.out.println("=================="+propertyName+":"+propertyValue);
        /**
         * 解析url，user，password
         */
        if("jdbc.jdbcUrl".equals(propertyName)||"jdbc.user".equals(propertyName)||"jdbc.password".equals(propertyName)){
            propertyValue = EnDecryptUtil.decodeBASE64(propertyValue);
        }
        return propertyValue;
    }
}
