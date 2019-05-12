package com.renyong.modules.sys.dao;

import com.renyong.base.annotation.MybatisDao;
import com.renyong.base.dao.BaseDao;
import com.renyong.modules.sys.model.SysAutoGenerateCoding;

/**
 * @Auther: 任勇勇
 * @Date: 2019/5/11 21:13
 * @Description:
 */
@MybatisDao
public interface SysAutoGenerateCodingDao extends BaseDao<SysAutoGenerateCoding> {
    public SysAutoGenerateCoding getCdByEnName(String cdEnglishName);
}
