package com.oracle.cart.controller;

import cn.liushao.servlet.BaseServlet;
import com.oracle.cart.entity.Cart;
import com.oracle.cart.entity.CartItem;
import com.oracle.goods.biz.GoodsBizImpl;
import com.oracle.goods.entity.Goods;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "CartServlet", urlPatterns = "/CartServlet")
public class CartServlet extends BaseServlet {

    GoodsBizImpl goodsBiz = new GoodsBizImpl();

    public String add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**
         * 1.得到车 2.得到条目（得到商品和数量） 3.把条目添加到车中
         */
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }
        String gid = request.getParameter("gid");
        Goods goods = goodsBiz.findGoodsDesc(Integer.valueOf(gid));
        int count = Integer.parseInt(request.getParameter("count"));
        //购物条目对象
        CartItem cartItem = new CartItem();
        //将图书和数量设置给购物条目
        cartItem.setGoods(goods);
        cartItem.setCount(count);
        //把条目添加到车中
        cart.add(cartItem);
        //request.getSession().setAttribute("cart", cart);
        response.getWriter().print("true");
        return "";
    }

    /**
     * 删除指定商品
     *
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if (cart == null) {
            return "";
        }
        String gid = request.getParameter("gid");
        cart.delete(gid);
        response.getWriter().print("true");
        return "";
    }

}
