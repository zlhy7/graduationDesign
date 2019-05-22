package com.renyong.base.model;

/**
 * @Auther: 任勇勇
 * @Date: 2019/5/22 09:40
 * @Description: 简单bean
 */
public class SimpleBean extends BaseEntity<SimpleBean>{
    private String text;//展示文本，或值存放区

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
