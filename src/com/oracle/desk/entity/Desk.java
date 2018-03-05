package com.oracle.desk.entity;

import com.oracle.user.entity.User;

import java.io.Serializable;

public class Desk implements Serializable {
    private int did;
    private String dName;
    private int seatNum;
    //private User user;
    private int uid;
    private int dState;

    public Desk() {
    }

    public Desk(int did, String dName, int seatNum, int uid, int dState) {
        this.did = did;
        this.dName = dName;
        this.seatNum = seatNum;
        this.uid = uid;
        this.dState = dState;
    }

    @Override
    public String toString() {
        return "Desk{" +
                "did=" + did +
                ", dName='" + dName + '\'' +
                ", seatNum=" + seatNum +
                ", uid=" + uid +
                ", dState=" + dState +
                '}';
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public String getdName() {
        return dName;
    }

    public void setdName(String dName) {
        this.dName = dName;
    }

    public int getSeatNum() {
        return seatNum;
    }

    public void setSeatNum(int seatNum) {
        this.seatNum = seatNum;
    }


    public int getdState() {
        return dState;
    }

    public void setdState(int dState) {
        this.dState = dState;
    }
}
