package com.oracle.order.dao;

import cn.liushao.commons.CommonUtils;
import cn.liushao.jdbc.TxQueryRunner;
import com.oracle.goods.entity.Goods;
import com.oracle.order.entity.Order;
import com.oracle.order.entity.OrderItem;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class OrderDaoImpl {
    //数据库封装对象
    private QueryRunner qr = new TxQueryRunner();

    public boolean addOrder(Order order) throws SQLException {
        //操作数据库任务
        String sql = "INSERT INTO `order`(oid, oDate, totalPrice, oState, uid, did) VALUES(?, ?, ?, ?, ?, ?)";
        //处理时间的问题
        Timestamp timedtamp = new Timestamp(order.getoDate().getTime());
        //给sql语句中的问号赋值
        Object[] params = {order.getOid(),
                timedtamp,
                order.getTotalPrice(),
                //order.getoState(),
                2,//订单状态，下单未结账
                order.getUser().getUid(),
                order.getDesk().getDid()};
        //执行添加操作
        return qr.update(sql, params) > 0;
    }

    /**
     * 增加订单条目
     *
     * @throws SQLException
     */
    public void addOrderItemList(List<OrderItem> orderItemList) throws SQLException {
        String sql = "insert into orderItem(oiid, gid, count, subtotal, oid) VALUES(?,?,?,?,?)";
        //不规则的二维数组
        Object[][] params = new Object[orderItemList.size()][];
        //遍历orderItemList 使用每一个orderItem对象为params赋值
        for (int i = 0; i < orderItemList.size(); i++) {
            //获取订单条目对象
            OrderItem item = orderItemList.get(i);

            params[i] = new Object[]{item.getOiid(),
                    item.getGoods().getGid(),
                    item.getCount(),
                    item.getSubtotal(),
                    item.getOrder().getOid()};
        }
        qr.batch(sql, params);
    }

    /**
     * 通过用户编号得到订单列表
     *
     * @param uid 服务员Id
     * @return
     * @throws SQLException
     */
    public List<Order> findByUids(String uid) throws SQLException {
        /*
         * 1.使用uid查询处当前所有List<Order>
         * 2.再遍历每个order
         */
        String sql = "select * from order where uid=?";
        List<Order> orderList = qr.query(sql, new BeanListHandler<Order>(Order.class), uid);
        //遍历每一个order为其添加所有的对应的订单条目
        for (Order order : orderList) {
            //使用下面的方法实现功能
            loadOrderItem(order);
        }
        //返回订单列表
        return orderList;
    }

    /**
     * 使用桌子ID查询未结账订单
     *
     * @param did 桌子ID
     * @return
     * @throws SQLException
     */
    public List<Order> findByDid(int did) throws SQLException {
        /*
         * 1.使用uid查询处当前所有List<Order>
         * 2.再遍历每个order
         */
        String sql = "select * from order where oState=2 did=?";
        List<Order> orderList = qr.query(sql, new BeanListHandler<Order>(Order.class), did);
        //遍历每一个order为其添加所有的对应的订单条目
        for (Order order : orderList) {
            //使用下面的方法实现功能
            loadOrderItem(order);
        }
        //返回订单列表
        return orderList;
    }

    //把map 转成orderItem对象
    private OrderItem toOrderItem(Map<String, Object> map) {
        //得到订单条目对象
        OrderItem ordersItem = CommonUtils.toBean(map, OrderItem.class);
        //这个map中还有商品对象
        Goods goods = CommonUtils.toBean(map, Goods.class);
        //商品和订单条目的关联
        ordersItem.setGoods(goods);
        return ordersItem;

    }

    //我们把每个mapList转成两个对象，并建立关系
    private List<OrderItem> toOrderItemList(List<Map<String, Object>> mapList) {
        //创建返回对象
        List<OrderItem> orderItemList = new ArrayList<OrderItem>();
        //对参数进行遍历
        for (Map<String, Object> map : mapList) {
            //调用上面的方法进行转换即可
            OrderItem item = toOrderItem(map);
            //添加到集合中
            orderItemList.add(item);
        }
        return orderItemList;

    }

    //加载指定的订单下面的所有订单条目
    private void loadOrderItem(Order order) throws SQLException {
        /**
         * 查询orderItem和goods
         */
        String sql = "select * from orderItem i,goods b where i.gid=b.gid and oid=?";
        //因为一行对应的不再是一个javabean对象，所以不能使用beanListHandler 需要使用MapListHander
        List<Map<String, Object>> mapList = qr.query(sql, new MapListHandler(), order.getOid());
        //mapList是多个map,每个map对应一行结果
        //循环遍历map,使用map生成两个对象，然后建立关系
        List<OrderItem> orderItemList = toOrderItemList(mapList);
        //将对象设置给order
        order.setOrderItemList(orderItemList);

    }

    /**
     * @param r6_Order
     * @throws SQLException
     */
    public void updateOrderState(String r6_Order) throws SQLException {
        String sql = "update order set oState=? where oid=?";
        //1代表已经完成订单  2-代表的是下单未结账 3-人跑了，未结账
        qr.update(sql, 1, r6_Order);
    }
}