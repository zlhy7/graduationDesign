package com.renyong.modules.sys.dao;

import com.renyong.base.annotation.MybatisDao;
import com.renyong.base.dao.BaseDao;
import com.renyong.modules.sys.model.DomainBean;

import java.util.List;
import java.util.Map;

/**
 * @Auther: 任勇勇
 * @Date: 2019/6/1 19:53:08
 * @Description: 表域数据访问层
 */
@MybatisDao
public interface DomainBeanDao extends BaseDao<DomainBean> {
    /**
     * 返回要的表数据
     * @return
     */
    public List<Map> getDomainByName(DomainBean domainBean);

    /**
     * 查询表是否存在
     * @param domainBean
     * @return
     */
    public String isTableExist(DomainBean domainBean);

    /**
     * 查询字段是否存在
     * @param domainBean
     * @return
     */
    public String isColumnExist(DomainBean domainBean);

}
