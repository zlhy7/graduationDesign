package com.renyong.modules.sys.model;

import com.renyong.base.model.BaseEntity;
import lombok.Getter;
import lombok.Setter;

/**
 * @Auther: 任勇勇
 * @Date: 2019/6/1 19:27
 * @Description: 表域类
 */
@Getter
@Setter
public class DomainBean extends BaseEntity<DomainBean>{
    /**
     * 反射解析字段
     */
    private String CD_NAME = "DOMAIN_CD,setDomainCd";
    /**
     * 表域cd
     */
    private String domainCd;
    /**
     * 表域名
     */
    private String domainName;
    /**
     * 表域描述
     */
    private String domainDesc;
    /**
     * 对应表名
     */
    private String tableName;
    /**
     * 表头
     */
    private String theadThs;
    /**
     * 展示的表字段
     */
    private String columnShowNames;
    /**
     * 输出字段
     */
    private String columnOutputNames;
    /**
     * bean 属性
     */
    private String beanProperty;
    /**
     * 条件
     */
    private String conditions;
    /**
     * 主键
     */
    private String primaryKey;

}
