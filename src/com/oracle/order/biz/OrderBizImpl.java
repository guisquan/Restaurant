package com.oracle.order.biz;

import cn.liushao.jdbc.JdbcUtils;
import com.oracle.order.dao.OrderDaoImpl;
import com.oracle.order.entity.Order;

import java.sql.SQLException;
import java.util.List;

public class OrderBizImpl {
    private OrderDaoImpl orderDao = new OrderDaoImpl();

    /**
     * 添加订单的时候添加订单条目
     *
     * @param order
     */
    public void add(Order order) {

        try {
            //开启事物
            JdbcUtils.beginTransaction();
            //插入订单
            orderDao.addOrder(order);
            //插入所有的订单条目
            orderDao.addOrderItemList(order.getOrderItemList());
            //提交事物
            JdbcUtils.commitTransaction();
        } catch (SQLException e) {
            //  有异常的时候提交失败
            try {
                //回滚取消所有的操作
                JdbcUtils.rollbackTransaction();
            } catch (SQLException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
            e.printStackTrace();
        }
    }

    /**
     * 得到桌子订单
     *
     * @param did
     * @return
     * @throws SQLException
     */
    public List<Order> myOrders(int did) throws SQLException {
        // TODO Auto-generated method stub
        return orderDao.findByDid(did);
    }

    /**
     * 付款成功之后改变订单的状态
     *
     * @param r6_Order
     * @throws SQLException
     */
    public void updateOrderState(String r6_Order) throws SQLException {
        orderDao.updateOrderState(r6_Order);
    }

}
