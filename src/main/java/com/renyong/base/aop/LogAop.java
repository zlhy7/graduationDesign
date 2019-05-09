package com.renyong.base.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * @Auther: 任勇勇
 * @Date: 2019/5/9 22:53
 * @Description:  日志切面类 用于记录增删改查操作
 */
@Aspect
@Service
public class LogAop {
    private String methodName;//方法名
    private String tableNote;//表备注 例如：汽车
    private String methodType;//方法类型；insert,delete,update,select
    private static Map<String,String> chineseDesc;
    static {
        chineseDesc = new HashMap<String,String>();
        chineseDesc.put("insert","新增了");
        chineseDesc.put("delete","删除了");
        chineseDesc.put("update","修改了");
        chineseDesc.put("select","查看了");
    }
    /**
     * 申明切点，同时配置将要被aop过滤的业务类
     */
    @Pointcut("execution (* com.renyong.modules.*.service.*(..))")
    public void joinPointcut() {
    }
    //前置通知
    @Before("joinPointcut()")
    public void doBefore(JoinPoint joinPoint) {//形参代表当前方法
        /*System.out.println("目标方法名为:" + joinPoint.getSignature().getName());
        System.out.println("目标方法所属类的简单类名:" +  joinPoint.getSignature().getDeclaringType().getSimpleName());
        System.out.println("目标方法所属类的类名:" + joinPoint.getSignature().getDeclaringTypeName());
        System.out.println("目标方法声明类型:" + Modifier.toString(joinPoint.getSignature().getModifiers()));
        //获取传入目标方法的参数
        Object[] args = joinPoint.getArgs();
        for (int i = 0; i < args.length; i++) {
            System.out.println("第" + (i+1) + "个参数为:" + args[i]);
        }
        System.out.println("被代理的对象:" + joinPoint.getTarget());
        System.out.println("代理对象自己:" + joinPoint.getThis());*/
        //获取方法名
        methodName = joinPoint.getSignature().getName();
        if(methodName.matches("^(find|get).*")){//查询方法
            methodType = "select";
        }else if(methodName.matches("^insert")){//插入方法
            methodType = "insert";
        }else if(methodName.matches("^update")){//修改方法
            methodType = "update";
        }else if(methodName.matches("^delete")){//删除方法
            methodType = "delete";
        }
        //获取所在类
//        System.out.println("被代理的对象:" + joinPoint.getTarget().getClass().getSuperclass());
//        System.out.println("代理对象自己:" + joinPoint.getThis());
    }
    //返回通知
    @AfterReturning(pointcut = "joinPointcut()",returning = "obj")
    public void doAfterReturning(Object obj,JoinPoint joinPoint) {

    }

    @After("joinPointcut()")
    public void doAfter(JoinPoint joinPoint) {
        System.out.println("doAfter advice");
    }
    //异常通知
    @AfterThrowing(pointcut = "joinPointcut()",throwing = "ex")
    public void doAfterThrowing(Exception ex,JoinPoint joinPoint) {
        System.out.println("doAfterThrowing advice");
    }
}
