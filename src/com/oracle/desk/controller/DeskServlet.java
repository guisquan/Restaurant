package com.oracle.desk.controller;

import cn.liushao.servlet.BaseServlet;
import com.oracle.desk.biz.DeskBizImpl;
import com.oracle.desk.entity.Desk;
import com.oracle.user.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeskServlet", urlPatterns = "/DeskServlet")
public class DeskServlet extends BaseServlet {
    private DeskBizImpl deskBiz = new DeskBizImpl();

    public String findAllDesk(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Desk> deskList = deskBiz.findAllDesk();
        request.setAttribute("deskList", deskList);
        return "f:/app/bindDesk.jsp";
    }


    public String bindDesk(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        int did = Integer.valueOf(request.getParameter("deskId"));
        User water = (User) request.getSession().getAttribute("session_user");
        if (deskBiz.bindDesk(did, water)) {
            request.getSession().setAttribute("desk", deskBiz.findDeskById(did));
            response.getWriter().print("true");
            return "r:/app/index.jsp";
        }
        response.getWriter().print("false");
        return "";
    }
}
