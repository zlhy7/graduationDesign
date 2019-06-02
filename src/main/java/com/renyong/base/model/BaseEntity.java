package com.renyong.base.model;

import com.alibaba.fastjson.annotation.JSONField;
import com.renyong.base.util.GenerateUtil;
import com.renyong.base.util.UserUtil;
import com.renyong.modules.user.model.UserBean;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Date;

/**
 * @Auther: 任勇勇
 * @Date: 2019/4/14 16:02
 * @Description: 基础的bean，其他的继承这个类
 */
public abstract class BaseEntity<T> implements Serializable{
    private static final long serialVersionUID = 1L;
    private String CD_NAME = "";
    /**
     * 主键
     */
    protected String id;
    /**
     * 备注
     */
    protected String remarks;
    /**
     * 创建人
     */
    protected UserBean createUser;
    /**
     * 创建时间
     */
    @JSONField(format="yyyy-MM-dd HH:mm:ss")
    protected Date createDate;
    /**
     * 更新人
     */
    protected UserBean lastUpdateUser;
    /**
     * 最后更新时间
     */
    @JSONField(format="yyyy-MM-dd HH:mm:ss")
    protected Date lastUpdateDate;
    /**
     * 删除标记
     */
    protected String delFlag = "0";
    /**
     * 当前页码
     */
    protected int pageNum = 1;
    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public String getCD_NAME() {
        return CD_NAME;
    }

    public void setCD_NAME(String CD_NAME) {
        this.CD_NAME = CD_NAME;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getLastUpdateDate() {
        return lastUpdateDate;
    }

    public void setLastUpdateDate(Date lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public UserBean getCreateUser() {
        return createUser;
    }

    public void setCreateUser(UserBean createUser) {
        this.createUser = createUser;
    }

    public UserBean getLastUpdateUser() {
        return lastUpdateUser;
    }

    public void setLastUpdateUser(UserBean lastUpdateUser) {
        this.lastUpdateUser = lastUpdateUser;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }
    public void preInsert(){
        /**
         * 保存id
         */
        this.id = GenerateUtil.uuid();
        if(!"".equals(this.getCD_NAME())){
            /**
             * 如果没传cd则自己生成
             */
            Class class1 = this.getClass();
            String cdName = this.getCD_NAME();
            String code = GenerateUtil.getAutoCd(cdName.split(",")[0]);
            try {
                Method method = class1.getDeclaredMethod(cdName.split(",")[1],String.class);
                method.invoke(this,code);
            }catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            }catch (InvocationTargetException e) {
                e.printStackTrace();
            }
        }
        /**
         * 当前登录用户
         */
        this.createUser = UserUtil.getCurrentUserBean();
        /**
         * 最后更新时间
         */
        this.lastUpdateDate = new Date();
        this.createDate = this.lastUpdateDate;
        this.delFlag = "0";
    }
    public void preUpdate(){
        /**
         * 最后更新时间
         */
        this.lastUpdateDate = new Date();
        /**
         * 最后更新人
         */
        this.lastUpdateUser = UserUtil.getCurrentUserBean();
    }
}
