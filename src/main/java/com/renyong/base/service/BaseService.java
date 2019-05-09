package com.renyong.base.service;

import com.renyong.base.dao.BaseDao;
import com.renyong.base.model.BaseEntity;
import com.renyong.base.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

/**
 * @Auther: 任勇勇
 * @Date: 2019/4/14 16:20
 * @Description: 公共service
 */
@Transactional(readOnly = true)
public class BaseService<D extends BaseDao<T>, T extends BaseEntity<T>>{
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
//            entity.preInsert();
            this.dao.insert(entity);
        } else {
//            entity.preUpdate();
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
//        entity.preUpdate();
        this.dao.update(entity);
    }

    public List<T> findAll() {
        return this.dao.findAll();
    }

    public List<T> findAll(T entity) {
        return this.dao.findAll(entity);
    }
}
