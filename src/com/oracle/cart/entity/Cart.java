package com.oracle.cart.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 * 购物车
 *
 * @author gui
 */
public class Cart implements Serializable {
    //存好多的条目
    private Map<Integer, CartItem> map = new HashMap<Integer, CartItem>();

    /**
     * 求总和
     *
     * @return
     */
    public double getTotal() {
        //合计=所有的小计之和
        BigDecimal total = new BigDecimal("0");
        //遍历值  值中是 购物条目
        for (CartItem cartItem : map.values()) {
            //得到每一个小计
            BigDecimal subtotal = new BigDecimal("" + cartItem.getSubtotal());
            //求总计
            total = total.add(subtotal);
        }
        //获取最终的数据
        return total.doubleValue();
    }

    /**
     * 添加到购物车
     */
    public void add(CartItem cartItem) {
        if (map.containsKey(cartItem.getGoods().getGid())) {
            //取出原来的条目
            CartItem _cartItem = map.get(cartItem.getGoods().getGid());
            //获取原来的数量【_cartItem.getCount()】+新的数量【cartItem.getCount()】
            _cartItem.setCount(_cartItem.getCount() + cartItem.getCount());
            //将我这个本书也扔到购物车中
            map.put(cartItem.getGoods().getGid(), _cartItem);

        } else {
            //新的商品原来车中木有
            map.put(cartItem.getGoods().getGid(), cartItem);
        }

    }

    //删除所有的条目
    public void clear() {
        map.clear();//清理集合
    }

    //删除指定的条目
    public void delete(String gid) {
        map.remove(Integer.valueOf(gid));//删除指定的条目

    }

    /**
     * 获取所有的购物条目
     *
     * @return
     */
    public Collection<CartItem> getCartItems() {
        return map.values();
    }

}
