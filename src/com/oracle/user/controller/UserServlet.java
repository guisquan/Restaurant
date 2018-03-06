package com.oracle.user.controller;

import cn.liushao.commons.CommonUtils;
import cn.liushao.servlet.BaseServlet;
import com.oracle.user.biz.UserBizImpl;
import com.oracle.user.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserServlet", urlPatterns = "/UserServlet")
public class UserServlet extends BaseServlet {
    UserBizImpl userBiz = new UserBizImpl();

    public String login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        User form = CommonUtils.toBean(request.getParameterMap(), User.class);
        User user = userBiz.login(form);
        if (user == null) {
            //登录失败
            response.getWriter().print("false");
        }
        //登录成功
        //将用户存到session
        request.getSession().setAttribute("session_user", user);
        //服务员登录成功后创建Order
        //创建cart
        //绑定desk
        response.getWriter().print("true");
        return "";
    }

    /**
     * 退出功能
     *
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String quit(HttpServletRequest request, HttpServletResponse
            response)
            throws ServletException, IOException {
        //销毁session
        request.getSession().invalidate();
        return "r:/app/index.jsp";
    }

}
