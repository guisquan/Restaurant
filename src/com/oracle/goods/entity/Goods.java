package com.oracle.goods.entity;

import java.io.Serializable;

public class Goods implements Serializable {
    private int gid;
    private int sid;
    private String gName;
    private double gPrice;
    private String gImage;
    private int gStyle;
    /**
     * 厨师ID、或其他
     */
    private int cid;
    private int gState;

    public Goods() {
    }

    public Goods(int gid, int sid, String gName, double gPrice, String gImage, int gStyle, int cid, int gState) {
        this.gid = gid;
        this.sid = sid;
        this.gName = gName;
        this.gPrice = gPrice;
        this.gImage = gImage;
        this.gStyle = gStyle;
        /**
         *  厨师ID
         */
        this.cid = cid;
        this.gState = gState;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "gid=" + gid +
                ", sid=" + sid +
                ", gName='" + gName + '\'' +
                ", gPrice=" + gPrice +
                ", gImage='" + gImage + '\'' +
                ", gStyle=" + gStyle +
                ", cid=" + cid +
                ", gState=" + gState +
                '}';
    }

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getgName() {
        return gName;
    }

    public void setgName(String gName) {
        this.gName = gName;
    }

    public double getgPrice() {
        return gPrice;
    }

    public void setgPrice(double gPrice) {
        this.gPrice = gPrice;
    }

    public String getgImage() {
        return gImage;
    }

    public void setgImage(String gImage) {
        this.gImage = gImage;
    }

    public int getgStyle() {
        return gStyle;
    }

    public void setgStyle(int gStyle) {
        this.gStyle = gStyle;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getgState() {
        return gState;
    }

    public void setgState(int gState) {
        this.gState = gState;
    }
}
