package com.oracle.goods.controller;

import cn.liushao.servlet.BaseServlet;
import com.oracle.goods.biz.GoodsBizImpl;
import com.oracle.goods.entity.Goods;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GoodsServlet", urlPatterns = "/GoodsServlet")
public class GoodsServlet extends BaseServlet {

    public String getAllGoodsByStyle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        int styleId = Integer.valueOf(request.getParameter("styleId"));
        GoodsBizImpl goodsBiz = new GoodsBizImpl();
        List<Goods> goodsList = goodsBiz.findGoodsByStyle(styleId);
        response.getWriter().print(JSONArray.fromObject(goodsList).toString());
        return "";
    }
}
