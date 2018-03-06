package com.oracle.pay.servlet;

import java.io.IOException;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.pay.utils.PaymentUtil;
import cn.liushao.servlet.BaseServlet;

@WebServlet(name = "PayServlet", urlPatterns = "/PayServlet")
public class PayServlet extends BaseServlet {

    //确认订单---更新收获人信息+在线支付
    public void confirmOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //1、更新收货人信息
//        Map<String, String[]> properties = request.getParameterMap();
//        Object orderObj = request.getSession().getAttribute("order");
//        Order order = null;
//        if (orderObj != null) {
//            order = (Order) orderObj;
//        } else {
//            order = new Order();
//            request.getSession().setAttribute("order", order);
//        }
        /*try {
            BeanUtils.populate(order, properties);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }*/

//        OrderBizImpl service = new OrderBizImpl();
        /*try {
            service.updateOrderAdrr(order);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }*/


        //只接入一个接口，这个接口已经集成所有的银行接口了  ，这个接口是第三方支付平台提供的
        //接入的是易宝支付
        // 获得 支付必须基本数据
        String orderid = request.getParameter("oid");
        //String money = order.getTotal()+"";//支付金额
        String money = "0.01";//支付金额
        // 银行
        String pd_FrpId = request.getParameter("pd_FrpId");
        // 发给支付公司需要哪些数据
        String p0_Cmd = "Buy";
        String p1_MerId = ResourceBundle.getBundle("merchantInfo").getString("p1_MerId");
        String p2_Order = orderid;
        String p3_Amt = money;
        String p4_Cur = "CNY";
        String p5_Pid = "";
        String p6_Pcat = "";
        String p7_Pdesc = "";
        // 支付成功回调地址 ---- 第三方支付公司会访问、用户访问
        // 第三方支付可以访问网址
        String p8_Url = ResourceBundle.getBundle("merchantInfo").getString("callback");
        String p9_SAF = "";
        String pa_MP = "";
        String pr_NeedResponse = "1";
        // 加密hmac 需要密钥
        String keyValue = ResourceBundle.getBundle("merchantInfo").getString(
                "keyValue");
        String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt,
                p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,
                pd_FrpId, pr_NeedResponse, keyValue);
        String url = "https://www.yeepay.com/app-merchant-proxy/node?pd_FrpId=" + pd_FrpId +
                "&p0_Cmd=" + p0_Cmd +
                "&p1_MerId=" + p1_MerId +
                "&p2_Order=" + p2_Order +
                "&p3_Amt=" + p3_Amt +
                "&p4_Cur=" + p4_Cur +
                "&p5_Pid=" + p5_Pid +
                "&p6_Pcat=" + p6_Pcat +
                "&p7_Pdesc=" + p7_Pdesc +
                "&p8_Url=" + p8_Url +
                "&p9_SAF=" + p9_SAF +
                "&pa_MP=" + pa_MP +
                "&pr_NeedResponse=" + pr_NeedResponse +
                "&hmac=" + hmac;
        //重定向到第三方支付平台
        response.sendRedirect(url);
    }
}
