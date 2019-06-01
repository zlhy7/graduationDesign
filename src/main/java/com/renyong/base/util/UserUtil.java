package com.renyong.base.util;

import com.renyong.modules.user.model.UserBean;

/**
 * @Auther: 任勇勇
 * @Date: 2019/6/1 22:54
 * @Description: 用户工具类
 */
public class UserUtil {
    /**
     * 当前用户
     */
    private static UserBean currentUserBean;

    public static UserBean getCurrentUserBean() {
        return currentUserBean;
    }

    public static void setCurrentUserBean(UserBean currentUserBean) {
        UserUtil.currentUserBean = currentUserBean;
    }
}
