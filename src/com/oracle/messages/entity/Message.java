package com.oracle.messages.entity;

import java.io.Serializable;
import java.sql.Date;

/**
 * 留言消息实体类
 *
 * @author gui
 */
public class Message implements Serializable {
    private String mId;
    private String uName;
    private String mEmail;
    private String message;
    private String mSubject;
    private Date mDate;
    private int mState;

    public Message() {
    }

    public Message(String mId, String uName, String mEmail, String message, String mSubject, Date mDate, int mState) {
        this.mId = mId;
        this.uName = uName;
        this.mEmail = mEmail;
        this.message = message;
        this.mSubject = mSubject;
        this.mDate = mDate;
        this.mState = mState;
    }

    @Override
    public String toString() {
        return "Message{" +
                "mId='" + mId + '\'' +
                ", uName='" + uName + '\'' +
                ", mEmail='" + mEmail + '\'' +
                ", message='" + message + '\'' +
                ", mSubject='" + mSubject + '\'' +
                ", mDate=" + mDate +
                ", mState=" + mState +
                '}';
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public Date getmDate() {
        return mDate;
    }

    public void setmDate(Date mDate) {
        this.mDate = mDate;
    }

    public String getmId() {
        return mId;
    }

    public void setmId(String mId) {
        this.mId = mId;
    }

    public String getmEmail() {
        return mEmail;
    }

    public void setmEmail(String mEmail) {
        this.mEmail = mEmail;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getmSubject() {
        return mSubject;
    }

    public void setmSubject(String mSubject) {
        this.mSubject = mSubject;
    }

    public int getmState() {
        return mState;
    }

    public void setmState(int mState) {
        this.mState = mState;
    }
}
