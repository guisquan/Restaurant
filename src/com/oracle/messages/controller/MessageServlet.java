package com.oracle.messages.controller;

import cn.liushao.commons.CommonUtils;
import cn.liushao.servlet.BaseServlet;
import com.oracle.messages.biz.MessageBizImpl;
import com.oracle.messages.entity.Message;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "MessageServlet", urlPatterns = "/messageServlet.do")
public class MessageServlet extends BaseServlet {
    protected String addMsg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Message form = CommonUtils.toBean(request.getParameterMap(), Message.class);
        form.setmId(CommonUtils.uuid());
        form.setmDate(new Date(System.currentTimeMillis()));
        //0-未查看
        form.setmState(0);
        MessageBizImpl messageBiz = new MessageBizImpl();
        String result = "false";
        if (!messageBiz.addMsg(form)) {
            //添加失败就不反应假装留言成功
            result = "true";
        }
        response.getWriter().print(result);
        //调到谢谢留言界面
        return "";
    }

}