package com.renyong.base.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renyong.base.dao.BaseDao;
import com.renyong.base.model.BaseEntity;
import com.renyong.base.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: 任勇勇
 * @Date: 2019/4/14 16:20
 * @Description: 公共service
 */
@Transactional(readOnly = true)
public class BaseService<D extends BaseDao<T>, T extends BaseEntity<T>> implements Serializable{
    @Autowired
    protected D dao;
    public T get(String id) {
        return dao.get(id);
    }
    public T get(T entity) {
        return dao.get(entity);
    }
    @Transactional(readOnly = false)
    public void insert(T entity) {
        if (StringUtil.isBlank(entity.getId())) {
            entity.preInsert();
            this.dao.insert(entity);
        } else {
            entity.preUpdate();
            this.dao.update(entity);
        }
    }

    @Transactional(readOnly = false)
    public void delete(T entity) {
        this.dao.delete(entity);
    }
    @Transactional(readOnly = false)
    public void deleteById(String id) {
        this.dao.deleteById(id);
    }

    @Transactional(readOnly = false)
    public void update(T entity) {
        entity.preUpdate();
        this.dao.update(entity);
    }

    public List<T> findAll() {
        return this.dao.findAll();
    }

    public List<T> findAll(T entity) {
        return this.dao.findAll(entity);
    }
    public PageInfo findPage(T entity){
        PageHelper.startPage(entity.getPageNum(),10);
        PageInfo<T> pageInfo1=new PageInfo<T>(this.findAll(entity),6);//设置页码链长度
        return pageInfo1;
    }
    public PageInfo findPage(T entity,List<T> list){
        PageHelper.startPage(entity.getPageNum(),10);
        PageInfo<T> pageInfo1=new PageInfo<T>(list,6);//设置页码链长度
        return pageInfo1;
    }
    public List<String> getProperty(List<T> list,String getMethodName){
        List<String> list1 = new ArrayList<String>();
        Class class1 = list.get(0).getClass();
        Method method1 = null;
        try {
            method1 = class1.getDeclaredMethod(getMethodName);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }
        for (T entity:list){
            try {
                list1.add((String)method1.invoke(entity));
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }
        }
        return list1;
    }
}
