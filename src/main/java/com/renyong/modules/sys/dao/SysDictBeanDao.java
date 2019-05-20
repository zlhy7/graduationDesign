package com.renyong.modules.sys.dao;

import com.renyong.base.annotation.MybatisDao;
import com.renyong.base.dao.BaseDao;
import com.renyong.modules.sys.model.SysDictBean;

/**
 * @Auther: 任勇勇
 * @Date: 2019/5/11 21:13
 * @Description:
 */
@MybatisDao
public interface SysDictBeanDao extends BaseDao<SysDictBean> {
    public String getDictValByKey(String dictName,String key);
}
