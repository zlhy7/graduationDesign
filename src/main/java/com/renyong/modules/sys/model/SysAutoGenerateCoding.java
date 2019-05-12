package com.renyong.modules.sys.model;

import com.renyong.base.model.BaseEntity;

/**
 * @Auther: 任勇勇
 * @Date: 2019/5/11 21:11
 * @Description:
 */
public class SysAutoGenerateCoding extends BaseEntity<SysAutoGenerateCoding>{
    private static final long serialVersionUID = 1L;

    /**
     * 表id
     */
    private String autoGenerateCodingId;

    /**
     * 英文名
     */
    private String cdEnglishName;

    /**
     * 中文描述
     */
    private String cdChineseDesc;

    /**
     * 前缀
     */
    private String cdPrefix;

    /**
     * 当前数字
     */
    private String cdCurrentNum;

    /**
     * 长度
     */
    private Integer cdLength;

    /**
     * 时间格式
     */
    private String cdTimeFormat;

    /**
     * 从0还是1开始
     */
    private Integer cdStartNum;

    private String code;//用于存储最终生成的cd

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getAutoGenerateCodingId() {
        return autoGenerateCodingId;
    }

    public void setAutoGenerateCodingId(String autoGenerateCodingId) {
        this.autoGenerateCodingId = autoGenerateCodingId;
    }

    public String getCdEnglishName() {
        return cdEnglishName;
    }

    public void setCdEnglishName(String cdEnglishName) {
        this.cdEnglishName = cdEnglishName;
    }

    public String getCdChineseDesc() {
        return cdChineseDesc;
    }

    public void setCdChineseDesc(String cdChineseDesc) {
        this.cdChineseDesc = cdChineseDesc;
    }

    public String getCdPrefix() {
        return cdPrefix;
    }

    public void setCdPrefix(String cdPrefix) {
        this.cdPrefix = cdPrefix;
    }

    public String getCdCurrentNum() {
        return cdCurrentNum;
    }

    public void setCdCurrentNum(String cdCurrentNum) {
        this.cdCurrentNum = cdCurrentNum;
    }

    public Integer getCdLength() {
        return cdLength;
    }

    public void setCdLength(Integer cdLength) {
        this.cdLength = cdLength;
    }

    public String getCdTimeFormat() {
        return cdTimeFormat;
    }

    public void setCdTimeFormat(String cdTimeFormat) {
        this.cdTimeFormat = cdTimeFormat;
    }

    public Integer getCdStartNum() {
        return cdStartNum;
    }

    public void setCdStartNum(Integer cdStartNum) {
        this.cdStartNum = cdStartNum;
    }
}
