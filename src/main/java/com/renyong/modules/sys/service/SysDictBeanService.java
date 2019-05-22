package com.renyong.modules.sys.service;

import com.github.pagehelper.PageInfo;
import com.renyong.base.service.BaseService;
import com.renyong.base.util.StringUtil;
import com.renyong.modules.sys.dao.SysDictBeanDao;
import com.renyong.modules.sys.model.SysAutoGenerateCoding;
import com.renyong.modules.sys.model.SysDictBean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Auther: 任勇勇
 * @Date: 2019/5/11 21:42:03
 * @Description: 字典业务层
 */
@Service
public class SysDictBeanService extends BaseService<SysDictBeanDao,SysDictBean>{
    public List<SysDictBean> getDict(String dictName) {//返回字典
        return dao.getDict(dictName);
    }

    public String getDictValByKey(String dictName, String key){//返回字典值
        String value = dao.getDictValByKey(dictName,key);
        if(value == null){
            value = "";
        }
        return value;
    }
    public PageInfo<SysDictBean> findPage(SysDictBean sysDictBean){//返回分页
        List<SysDictBean> sysDictBeanList = dao.getForPageUse(sysDictBean);
        return super.findPage(sysDictBean,sysDictBeanList);
    }
}
