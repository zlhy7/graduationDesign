package com.renyong.modules.sys.service;

import com.renyong.base.service.BaseService;
import com.renyong.modules.sys.dao.SysAutoGenerateCodingDao;
import com.renyong.modules.sys.model.SysAutoGenerateCoding;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Auther: 任勇勇
 * @Date: 2019/5/11 21:42:03
 * @Description: 自动生成编码
 */
@Service
public class SysAutoGenerateCodingService extends BaseService<SysAutoGenerateCodingDao,SysAutoGenerateCoding>{
    @Transactional(readOnly = false)
    public String getAutoCd(String cdEnglishName){
        SysAutoGenerateCoding sysAutoGenerateCoding = dao.getCdByEnName(cdEnglishName);
        String code = sysAutoGenerateCoding.getCode();//生成好的编码
        sysAutoGenerateCoding.preUpdate();
        dao.updateCurrentNumById(sysAutoGenerateCoding);
        return code;
    }
}
