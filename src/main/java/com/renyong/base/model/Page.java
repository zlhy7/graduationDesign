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
    private int count;//总记录行数
    private int totalPageNum;//总页数
    private int first=1;//第一页页码
    private int last;//最后一页页码
    private int prev;//上一页页码
    private int next;//下一页页码
    private boolean firstPage;//当前是否是第一页
    private boolean lastPage;//当前是否是最后一页
    private List<T> list;//待分页集合
    public Page(){}
    public int getPageNo() {
        return pageNo;
    }
    //设置当前页码
    public void setPageNo(int pageNo) {
        //防止页码超出
        if(pageNo>last){
            pageNo = last;
        }else if(pageNo<first){
            pageNo = first;
        }
        this.pageNo = pageNo;
        this.setPrev((pageNo==1?1:pageNo-1));//设置上一页页码
        this.setNext((pageNo==last?last:pageNo+1));//设置下一页页码
        this.setFirstPage(pageNo==1);
        this.setLastPage(pageNo==last);
    }

    public int getPageSize() {
        return pageSize;
    }
    //设置页大小
    public void setPageSize(int pageSize) {
        //防止一页显示的记录行数大于总记录行数
        if(pageSize>count){
            pageSize = count;
        }
        this.pageSize = pageSize;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getTotalPageNum() {
        return totalPageNum;
    }
    //设置总页数
    public void setTotalPageNum(int totalPageNum) {
        this.totalPageNum = totalPageNum;
    }

    public int getFirst() {
        return first;
    }

    public void setFirst(int first) {
        this.first = first;
    }

    public int getLast() {
        return last;
    }

    public void setLast(int last) {
        this.last = last;
    }

    public int getPrev() {
        return prev;
    }

    public void setPrev(int prev) {
        this.prev = prev;
    }

    public int getNext() {
        return next;
    }

    public void setNext(int next) {
        this.next = next;
    }

    public boolean isFirstPage() {
        return firstPage;
    }

    public void setFirstPage(boolean firstPage) {
        this.firstPage = firstPage;
    }

    public boolean isLastPage() {
        return lastPage;
    }

    public void setLastPage(boolean lastPage) {
        this.lastPage = lastPage;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
    public void initialize() {

    }
}
