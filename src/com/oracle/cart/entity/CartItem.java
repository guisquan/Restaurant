package com.oracle.cart.entity;

import com.oracle.goods.entity.Goods;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 购物车条目类
 *
 * @author 刘庆东 jspbook com.oracle.cart.entity 下午1:52:03
 */
public class CartItem implements Serializable {

    private Goods goods;// 图书
    private int count;// 数量

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


    /**
     * 小计 我们需要处理小数点后面的位数的问题
     *
     * @return 小计
     */
    public double getSubtotal() {//我能自动拿到数据值
        // 不可变的、任意精度的有符号十进制数
        BigDecimal d1 = new BigDecimal(goods.getgPrice() + "");
        BigDecimal d2 = new BigDecimal(count + "");
        // 处理精度的问题
        return d1.multiply(d2).doubleValue();
    }


}
