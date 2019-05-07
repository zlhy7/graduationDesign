package com.renyong.modules.user.model;

import com.renyong.base.model.BaseEntity;
import com.renyong.modules.car.model.Car;
import com.renyong.modules.role.model.RoleBean;

import java.util.List;

/**
 * @Auther: 任勇勇
 * @Date: 2019/5/7 14:29
 * @Description: 用户
 */
public class UserBean extends BaseEntity<UserBean> {
    private String userCd;//用户编码
    private String loginName;//登录名
    private String password;//密码
    //基本信息
    private String realName;//真实姓名
    private String sex;//性别
    private String phone;//电话
    private String headPortrait;//头像

    private List<Car> carList;//名下车辆
    private List<RoleBean> roleBeanList;//拥有角色

    public UserBean() {
    }

    public UserBean(String userCd, String loginName, String password, String realName, String sex, String phone, String headPortrait) {
        this.userCd = userCd;
        this.loginName = loginName;
        this.password = password;
        this.realName = realName;
        this.sex = sex;
        this.phone = phone;
        this.headPortrait = headPortrait;
    }

    public String getUserCd() {
        return userCd;
    }

    public void setUserCd(String userCd) {
        this.userCd = userCd;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getHeadPortrait() {
        return headPortrait;
    }

    public void setHeadPortrait(String headPortrait) {
        this.headPortrait = headPortrait;
    }

    public List<Car> getCarList() {
        return carList;
    }

    public void setCarList(List<Car> carList) {
        this.carList = carList;
    }

    public List<RoleBean> getRoleBeanList() {
        return roleBeanList;
    }

    public void setRoleBeanList(List<RoleBean> roleBeanList) {
        this.roleBeanList = roleBeanList;
    }
}
