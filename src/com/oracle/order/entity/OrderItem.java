package com.oracle.order.entity;

import com.oracle.goods.entity.Goods;

import java.io.Serializable;

public class OrderItem implements Serializable{
    private String oiid;
    private Goods goods;
    private int count;
    private double subtotal;
    private Order order;

    public OrderItem() {
    }

    public OrderItem(String oiid, Goods goods, int count, double subtotal, Order order) {
        this.oiid = oiid;
        this.goods = goods;
        this.count = count;
        this.subtotal = subtotal;
        this.order = order;
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "oiid='" + oiid + '\'' +
                ", goods=" + goods +
                ", count=" + count +
                ", subtotal=" + subtotal +
                ", order=" + order +
                '}';
    }

    public String getOiid() {
        return oiid;
    }

    public void setOiid(String oiid) {
        this.oiid = oiid;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
}
