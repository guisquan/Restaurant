package com.oracle.style.entity;

import java.io.Serializable;
import java.util.List;

/**
 * 目录（样式：菜、主食、餐具）实体类
 */
public class Style implements Serializable {
    private int sid;
    private String sName;
    /**
     * 上一级的sid
     */
    private int spid;
    /**
     * 所在路径
     */
    private String sPath;

    /**
     * 存放子目录
     */
    private List<Style> childStyle;


    public Style() {
    }

    public Style(int sid, String sName, int spid, String sPath, List<Style> childStyle) {
        this.sid = sid;
        this.sName = sName;
        this.spid = spid;
        this.sPath = sPath;
        this.childStyle = childStyle;
    }

    public List<Style> getChildStyle() {
        return childStyle;
    }

    public void setChildStyle(List<Style> childStyle) {
        this.childStyle = childStyle;
    }

    @Override
    public String toString() {
        return "Style{" +
                "sid=" + sid +
                ", sName='" + sName + '\'' +
                ", spid=" + spid +
                ", sPath='" + sPath + '\'' +
                ", childStyle=" + childStyle +
                '}';
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName;
    }

    public int getSpid() {
        return spid;
    }

    public void setSpid(int spid) {
        this.spid = spid;
    }

    public String getsPath() {
        return sPath;
    }

    public void setsPath(String sPath) {
        this.sPath = sPath;
    }
}
