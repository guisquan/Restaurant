package com.oracle.order.controller;

import cn.liushao.commons.CommonUtils;
import cn.liushao.servlet.BaseServlet;
import com.oracle.desk.entity.Desk;
import com.oracle.cart.entity.Cart;
import com.oracle.cart.entity.CartItem;
import com.oracle.order.biz.OrderBizImpl;
import com.oracle.order.entity.Order;
import com.oracle.order.entity.OrderItem;
import com.oracle.user.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "OrderServlet", urlPatterns = "/OrderServlet")
public class OrderServlet extends BaseServlet {
    private OrderBizImpl orderBiz = new OrderBizImpl();

    public String placeTheOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*
         * 1.从session中获取cart
         * 2.使用cart生成order
         * 3.使用biz添加订单，清空购物车
         * 4.保存到request中
         */
        //从session 中获取cart
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        //把cart转成order
        Order order = new Order();
        //设置订单编号
        order.setOid(CommonUtils.uuid());
        //下单时间
        order.setoDate(new Date());
        //订单状态1 2 3 4
        order.setoState(2);
        //订单所有者 Disk
        Desk desk = (Desk) request.getSession().getAttribute("desk");
        User water = (User) request.getSession().getAttribute("session_user");
        order.setUser(water);
        order.setDesk(desk);
        //这是订单的合计
        order.setTotalPrice(cart.getTotal());
        //创建订单的条目的集合
        List<OrderItem> orderItemList = new ArrayList<OrderItem>();
        //从cart里拿出来数据到这个集合中
        for (CartItem cartItem : cart.getCartItems()) {
            OrderItem oi = new OrderItem();//创建条目对象
            oi.setOiid(CommonUtils.uuid());//订单条目编号
            oi.setCount(cartItem.getCount());//数量
            oi.setGoods(cartItem.getGoods());//得到商品
            oi.setSubtotal(cartItem.getSubtotal());//小计
            //设置所属的订单
            oi.setOrder(order);

            //将条目添加到集合中
            orderItemList.add(oi);

        }
        //将所有的订单条目添加到订单中
        order.setOrderItemList(orderItemList);
        //清空购物车
        cart.clear();
        //下面就跟数据库握手
        orderBiz.add(order);
        //保存order到request范围
        request.getSession().setAttribute("order", order);
        response.getWriter().print("true");
//        return "r:/app/index.jsp#main";
        return "";
    }
}
