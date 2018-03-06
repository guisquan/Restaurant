<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gui
  Date: 18-3-4
  Time: 下午7:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/amazeui.css"/>
    <link rel="stylesheet" href="../css/core.css"/>
    <link rel="stylesheet" href="../css/menu.css"/>
    <link rel="stylesheet" href="../css/index.css"/>
    <link rel="stylesheet" href="../css/admin.css"/>
    <link rel="stylesheet" href="../css/page/typography.css"/>
    <link rel="stylesheet" href="../css/page/form.css"/>
    <link rel="stylesheet" href="../css/component.css"/>
    <script type="text/javascript" src="../js/jquery-2.1.0.js"></script>
    <script type="text/javascript">
    </script>
</head>
<body>
<div class="am-u-md-8" id="foods">
    <div class="card-box">
        <h4 class="header-title m-t-0 m-b-30">购物车</h4>
        <div class="am-scrollable-horizontal am-text-ms" style="font-family: '微软雅黑';">
            <table class="am-table   am-text-nowrap">
                <thead>
                <tr>
                    <th>#</th>
                    <th>菜名</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>小计</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${sessionScope.order.orderItemList}" var="orderItem" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>${orderItem.goods.gName }</td>
                        <td>${orderItem.goods.gPrice }元</td>
                        <td>${orderItem.count }</td>
                        <td>${orderItem.subtotal }元</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <em>总价：${sessionScope.order.totalPrice}元</em>
            <form method="post" action="<c:url value='/PayServlet' />" id="form" target="_parent">
                <input type="hidden" name="method" value="confirmOrder"/>
                <input type="hidden" name="oid" value="${sessionScope.order.oid }"/>
                选择银行：<br/>
                <input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked"/>工商银行
                <img src="${pageContext.request.contextPath }/bank_img/icbc.bmp" align="middle"/>
                <input type="radio" name="pd_FrpId" value="BOC-NET-B2C"/>中国银行
                <img src="${pageContext.request.contextPath }/bank_img/bc(1).bmp" align="middle"/><br/><br/>
                <input type="radio" name="pd_FrpId" value="ABC-NET-B2C"/>农业银行
                <img src="${pageContext.request.contextPath }/bank_img/abc.bmp" align="middle"/>
                <input type="radio" name="pd_FrpId" value="CCB-NET-B2C"/>建设银行
                <img src="${pageContext.request.contextPath }/bank_img/ccb.bmp" align="middle"/><br/><br/>
                <input type="radio" name="pd_FrpId" value="BOCO-NET-B2C"/>交通银行
                <img src="${pageContext.request.contextPath }/bank_img/bcc.bmp" align="middle"/><br/>
            </form>
            <em class="label label-warning" ><a id="pay" href="javascript:document.getElementById('form').submit();">结账</a>
            </em><%--<em class="label label-warning" style="float:right;" id="placeTheOrder">结账</em>--%>
        </div>
    </div>
</div>

</body>
</html>
