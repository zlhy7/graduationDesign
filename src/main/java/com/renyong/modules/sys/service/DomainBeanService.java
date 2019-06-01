package com.renyong.modules.sys.service;

import com.renyong.base.service.BaseService;
import com.renyong.base.util.StringUtil;
import com.renyong.modules.sys.dao.DomainBeanDao;
import com.renyong.modules.sys.model.DomainBean;
import org.springframework.stereotype.Service;

import java.util.HashMap;
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
    public Map getMapObj(DomainBean domainBean){
        Map<String,Object> map = new HashMap<String,Object>();

        return map;
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
}