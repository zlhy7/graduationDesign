package com.renyong.base.annotation;

import org.springframework.stereotype.Component;

import java.lang.annotation.*;

/**
 * @Auther: 任勇勇
 * @Date: 2019/5/10 11:03
 * @Description: 自动注册dao
 */
@Retention(RetentionPolicy.RUNTIME)
@Component
@Target(ElementType.TYPE)
@Documented
@Inherited//改注解可被继承
public @interface MybatisDao {
    String value() default "";
}
