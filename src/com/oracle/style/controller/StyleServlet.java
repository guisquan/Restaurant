package com.oracle.style.controller;

import cn.liushao.commons.CommonUtils;
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
    private StyleBizImpl styleBiz = new StyleBizImpl();

    /**
     * 获得所有类型
     *
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String getAllStyle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        List<Style> styleList = styleBiz.findAllStyle();

        request.getSession().setAttribute("styleList", styleList);
//        System.out.println("--------getAllStyle-------");
//        System.out.println(styleList);
//        response.getWriter().print(JSONArray.fromObject(styleList).toString());
        response.getWriter().print("true");
        return "";
    }

    /**
     * 判断要添加的类型是否已经存在
     *
     * @param request
     * @param response
     * @return 存在：true；不存在：false
     * @throws ServletException
     * @throws IOException
     */
    public String hasStyle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String sName = request.getParameter("sName");
        boolean result = styleBiz.hasStyle(sName);
        response.getWriter().print(String.valueOf(result));
        return "";
    }

    /**
     * 添加类型
     *
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String addStyle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String sName = request.getParameter("sName");
        int spid = Integer.valueOf(request.getParameter("spid"));

        Style form = new Style();
        form.setsName(sName);
        form.setSpid(spid);
        //sPath暂时不写，数据库要加触发器
        //Style style = styleBiz.findStyleById(spid);
        form.setsPath("");
        response.getWriter().print(String.valueOf(styleBiz.addStyle(form)));
        return "";
    }

    /**
     * 修改类型
     *
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String modifyStyle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        //int sid = Integer.valueOf(request.getParameter("sid"));
        //String sName = request.getParameter("sName");
        //int spid = Integer.valueOf(request.getParameter("spid"));
        //String sPath = request.getParameter("sPath");
        Style form = CommonUtils.toBean(request.getParameterMap(), Style.class);
        response.getWriter().print(String.valueOf(styleBiz.modifyStyle(form)));
        return "";
    }

    public String allStyle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        List<Style> allStyle = styleBiz.allStyle();
        if (allStyle != null) {
            request.getSession().setAttribute("allStyle", allStyle);
            response.getWriter().print("true");
        }
        response.getWriter().print("false");
        return "";
    }

}
