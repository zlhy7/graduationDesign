package com.renyong.modules.sys.dao;

import com.renyong.base.annotation.MybatisDao;
import com.renyong.base.dao.BaseDao;
import com.renyong.modules.sys.model.SysDictBean;

import java.util.List;

/**
 * @Auther: 任勇勇
 * @Date: 2019/5/11 21:13
 * @Description:
 */
@MybatisDao
public interface SysDictBeanDao extends BaseDao<SysDictBean> {
    public String getDictValByKey(String dictName,String key);//返回字典key代表值
    public List<SysDictBean> getDict(String dictName);//返回字典
    public List<SysDictBean> getForPageUse(SysDictBean sysDictBean);//供页面查询使用的查询
}
