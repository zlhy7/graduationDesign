package com.renyong.modules.user.service;

import com.renyong.base.service.BaseService;
import com.renyong.base.util.StringUtil;
import com.renyong.modules.user.dao.UserBeanDao;
import com.renyong.modules.user.model.UserBean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Auther: 任勇勇
 * @Date: 2019/5/15 19:57:10
 * @Description: 用户业务层
 */
@Service
public class UserBeanService extends BaseService<UserBeanDao,UserBean>{
    @Transactional(readOnly = false)
    public void insert(UserBean userBean) {
        if(StringUtil.isBlank(userBean.getPassword())){
            userBean.setPassword("654321");//默认密码
        }
        super.insert(userBean);
    }

}
