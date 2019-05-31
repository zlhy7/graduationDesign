package com.renyong.modules.role.model;

import com.renyong.base.model.BaseEntity;

import java.util.List;

/**
 * @Auther: 任勇勇
 * @Date: 2019/5/7 14:29
 * @Description: 角色
 */
public class RoleBean extends BaseEntity<RoleBean> {
    private String roleName;//角色名
    private List<RoleBean> permissionsList;//权限

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public List<RoleBean> getPermissionsList() {
        return permissionsList;
    }

    public void setPermissionsList(List<RoleBean> permissionsList) {
        this.permissionsList = permissionsList;
    }
}
