package com.renyong.base.model;
import com.renyong.base.annotation.TableNote;
import com.renyong.base.util.GenerateUtil;
import com.renyong.modules.user.model.UserBean;

import java.io.Serializable;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
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
    protected String id;//主键
    protected String remarks;//备注
    protected UserBean createUser;//创建人
    protected Date createDate;//创建时间
    protected UserBean lastUpdateUser;//更新人
    protected Date lastUpdateDate;//最后更新时间
    protected String delFlag = "0";//删除标记
    protected int pageNum = 1;//当前页码
    private T t;//便于泛型解析
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
        this.id = GenerateUtil.uuid();//保存id
       /* Class class1 = this.getClass();
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
        }*/
        this.lastUpdateDate = new Date();//最后更新时间
        this.createDate = this.lastUpdateDate;
        this.delFlag = "0";
    }
    public void preUpdate(){
        this.lastUpdateDate = new Date();//最后更新时间
    }
}
