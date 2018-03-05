package com.oracle.desk.controller;

import cn.liushao.servlet.BaseServlet;
import com.oracle.desk.biz.DeskBizImpl;
import com.oracle.desk.entity.Desk;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeskServlet", urlPatterns = "/DeskServlet")
public class DeskServlet extends BaseServlet {
    public String findAllDesk(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DeskBizImpl deskBiz = new DeskBizImpl();
        List<Desk> deskList = deskBiz.findAllDesk();
        request.setAttribute("deskList", deskList);
        return "f:/app/bindDesk.jsp";
    }
}
