package com.renyong.modules.sys.service;

import com.renyong.base.service.BaseService;
import com.renyong.base.util.StringUtil;
import com.renyong.modules.sys.dao.DomainBeanDao;
import com.renyong.modules.sys.model.DomainBean;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Auther: 任勇勇
 * @Date: 2019/6/1 20:33:03
 * @Description: 表域业务层
 */
@Service
public class DomainBeanService extends BaseService<DomainBeanDao,DomainBean>{
    /**
     * 查询分页信息以及map
     * @param domainBean 条件
     * @return
     */
    public List<Map> getMapObj(DomainBean domainBean){
        List<Map> mapList = dao.getDomainByName(domainBean);
        return mapList;
    }

    /**
     * 查询表是否存在
     * @param domainBean
     * @return
     */
    public boolean isTableExist(DomainBean domainBean){
        boolean flag = true;
        if(StringUtil.isBlank(dao.isTableExist(domainBean))){
            flag = false;
        }
        return flag;
    }

    /**
     * 查询字段是否存在
     * @param domainBean
     * @return
     */
    public boolean isColumnExist(DomainBean domainBean){
        String result = dao.isColumnExist(domainBean);
        boolean flag = "1".equals(result);
        return flag;
    }
}