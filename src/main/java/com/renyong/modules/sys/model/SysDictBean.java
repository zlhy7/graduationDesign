package com.renyong.modules.sys.model;

import com.renyong.base.model.BaseEntity;

/**
 * @Auther: 任勇勇
 * @Date: 2019/5/20 19:15
 * @Description: 系统字典
 */
public class SysDictBean extends BaseEntity<SysDictBean>{
    private static final long serialVersionUID = 1L;
    private String CD_NAME = "DICT_CD,setSysDictBeanCd";
    private String sysDictBeanCd;//字典编码
    private String dictChineseDesc;//字典中文描述
    private String dictEnglishName;//字典英文名
    private String dictKey;//字典键
    private String dictValue;//字典键

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    @Override
    public String getCD_NAME() {
        return CD_NAME;
    }

    @Override
    public void setCD_NAME(String CD_NAME) {
        this.CD_NAME = CD_NAME;
    }

    public String getSysDictBeanCd() {
        return sysDictBeanCd;
    }

    public void setSysDictBeanCd(String sysDictBeanCd) {
        this.sysDictBeanCd = sysDictBeanCd;
    }

    public String getDictChineseDesc() {
        return dictChineseDesc;
    }

    public void setDictChineseDesc(String dictChineseDesc) {
        this.dictChineseDesc = dictChineseDesc;
    }

    public String getDictEnglishName() {
        return dictEnglishName;
    }

    public void setDictEnglishName(String dictEnglishName) {
        this.dictEnglishName = dictEnglishName;
    }

    public String getDictKey() {
        return dictKey;
    }

    public void setDictKey(String dictKey) {
        this.dictKey = dictKey;
    }

    public String getDictValue() {
        return dictValue;
    }

    public void setDictValue(String dictValue) {
        this.dictValue = dictValue;
    }
}
