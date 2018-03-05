package com.oracle.order.entity;

import com.oracle.desk.entity.Desk;
import com.oracle.user.entity.User;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Order implements Serializable {
    private String oid;
    private Date oDate;
    private double totalPrice;
    private int oState;
    private User user;
    private Desk desk;
    private List<OrderItem> orderItemList;

    public Order() {
    }

    public Order(String oid, Date oDate, double totalPrice, int oState, User user, Desk desk, List<OrderItem> orderItemList) {
        this.oid = oid;
        this.oDate = oDate;
        this.totalPrice = totalPrice;
        this.oState = oState;
        this.user = user;
        this.desk = desk;
        this.orderItemList = orderItemList;
    }

    @Override
    public String toString() {
        return "Order{" +
                "oid='" + oid + '\'' +
                ", oDate=" + oDate +
                ", totalPrice=" + totalPrice +
                ", oState=" + oState +
                ", user=" + user +
                ", desk=" + desk +
                ", orderItemList=" + orderItemList +
                '}';
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public Date getoDate() {
        return oDate;
    }

    public void setoDate(Date oDate) {
        this.oDate = oDate;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getoState() {
        return oState;
    }

    public void setoState(int oState) {
        this.oState = oState;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Desk getDesk() {
        return desk;
    }

    public void setDesk(Desk desk) {
        this.desk = desk;
    }

    public List<OrderItem> getOrderItemList() {
        return orderItemList;
    }

    public void setOrderItemList(List<OrderItem> orderItemList) {
        this.orderItemList = orderItemList;
    }
}
