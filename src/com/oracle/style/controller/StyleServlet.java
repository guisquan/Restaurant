package com.oracle.style.controller;

import cn.liushao.servlet.BaseServlet;
import com.oracle.cart.entity.Cart;
import com.oracle.style.biz.StyleBizImpl;
import com.oracle.style.entity.Style;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StyleServlet", urlPatterns = "/StyleServlet")
public class StyleServlet extends BaseServlet {

    public String getAllStyle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        StyleBizImpl styleBiz = new StyleBizImpl();
        List<Style> styleList = styleBiz.findAllStyle();

        request.getSession().setAttribute("styleList", styleList);
        System.out.println("--------getAllStyle-------");
        System.out.println(styleList);

//        response.getWriter().print(JSONArray.fromObject(styleList).toString());
        response.getWriter().print("true");
        return "";
    }
}
