package com.renyong.modules.sys.service;

import com.github.pagehelper.PageInfo;
import com.renyong.base.service.BaseService;
import com.renyong.modules.sys.dao.SysDictBeanDao;
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
    //返回字典
    public List<SysDictBean> getDict(String dictName) {
        return dao.getDict(dictName);
    }
    //返回字典值
    public String getDictValByKey(String dictName, String key){
        String value = dao.getDictValByKey(dictName,key);
        if(value == null){
            value = "";
        }
        return value;
    }
    //返回分页
    @Override
    public PageInfo<SysDictBean> findPage(SysDictBean sysDictBean){
        List<SysDictBean> sysDictBeanList = dao.getForPageUse(sysDictBean);
        return super.findPage(sysDictBean,sysDictBeanList);
    }
    //页面删除方法
    @Transactional(readOnly = false)
    public void deleteByDictName(String dictEnglishName){
        dao.deleteByDictName(dictEnglishName);
    }
}
