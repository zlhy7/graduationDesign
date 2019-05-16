package com.renyong.base.model;

import java.util.List;

/**
 * @Auther: 任勇勇
 * @Date: 2019/5/16 14:31
 * @Description: 分页类
 */
public class Page<T> {
    private int pageNo=1;//当前页码
    private int pageSize=10;//每页记录行数
    private long count;//总记录行数
    private int totalPageNum;//总页数
    private int first=1;//第一页页码
    private int last;//最后一页页码
    private int prev;//上一页页码
    private int next;//下一页页码
    private boolean firstPage;//当前是否是第一页
    private boolean lastPage;//当前是否是最后一页
    private List<T> list;//待分页集合

}
