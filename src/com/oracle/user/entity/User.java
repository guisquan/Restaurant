package com.oracle.user.entity;

import java.io.Serializable;

public class User implements Serializable {
    private int uid;
    private String userName;
    private String userPwd;
    private String userImage;
    private int userType;
    private int userState;

    public User() {
    }

    public User(int uid, String userName, String userPwd, String userImage, int userType, int userState) {
        this.uid = uid;
        this.userName = userName;
        this.userPwd = userPwd;
        this.userImage = userImage;
        this.userType = userType;
        this.userState = userState;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", userName='" + userName + '\'' +
                ", userPwd='" + userPwd + '\'' +
                ", userImage='" + userImage + '\'' +
                ", userType=" + userType +
                ", userState=" + userState +
                '}';
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getUserImage() {
        return userImage;
    }

    public void setUserImage(String userImage) {
        this.userImage = userImage;
    }

    public int getUserType() {
        return userType;
    }

    public void setUserType(int userType) {
        this.userType = userType;
    }

    public int getUserState() {
        return userState;
    }

    public void setUserState(int userState) {
        this.userState = userState;
    }
}
