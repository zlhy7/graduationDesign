package com.renyong.base.permissions;

import org.apache.shiro.web.tags.PermissionTag;

/**
 * @Auther: 任勇勇
 * @Date: 2019/5/24 17:46
 * @Description: 权限相关内容类
 */
public class Permissions  extends PermissionTag {

    public Permissions() {
    }

    protected boolean showTagBody(String p) {
        return this.isPermitted(p);
    }
}
