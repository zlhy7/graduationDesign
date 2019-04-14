package com.renyong.base.dao;

import java.util.List;

/**
 * @Auther: 任勇勇
 * @Date: 2019/4/14 16:16
 * @Description:
 */
public interface BaseDao<T>{
    public T get(String id);//查询一个
    public T get(T var1);//查询一个
    public List<T> findAll();//查询所有
    public List<T> findAll(T var1);//按条件查询
    public void insert(T var1);//添加操作
    public void update(T var1);//修改操作
    public void deleteById(String id);//物理删除
    public void delete(T var1);//逻辑删除
}
