package com.renyong.modules.permissions.model;

import com.renyong.base.model.BaseEntity;

import java.util.List;

/**
 * @Auther: 任勇勇
 * @Date: 2019/5/7 14:29
 * @Description: 权限
 */
public class Permissions extends BaseEntity<Permissions> {
    private String permissionsName;//权限名

    public String getPermissionsName() {
        return permissionsName;
    }

    public void setPermissionsName(String permissionsName) {
        this.permissionsName = permissionsName;
    }
}
