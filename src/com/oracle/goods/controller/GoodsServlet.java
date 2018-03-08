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
    private GoodsBizImpl goodsBiz = new GoodsBizImpl();

    public String getAllGoodsByStyle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        int styleId = Integer.valueOf(request.getParameter("styleId"));
        List<Goods> goodsList = goodsBiz.findGoodsByStyle(styleId);
        response.getWriter().print(JSONArray.fromObject(goodsList).toString());
        return "";
    }

    public String getRecommendGoods(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        List<Goods> recommendGoods = goodsBiz.getRecommendGoods();
        if (recommendGoods != null) {
            request.getSession().setAttribute("recommendGoods", recommendGoods);
            response.getWriter().print("true");
        }
        response.getWriter().print("false");
        return "";
    }
}
