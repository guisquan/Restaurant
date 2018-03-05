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
        function deleteCartItem(gid) {
            $.ajaxSetup({
                async: false
            });
            var flag = true;
            $.get("${pageContext.request.contextPath}/CartServlet?method=delete",
                {gid: gid},
                function (data) {
                    if (data.indexOf('true') === -1) {
                        flag = false;
                        // 提醒删除失败;
                    } else {
                        //刷新页面或者用js修改
                        $("#main").load("cartList.jsp");
                    }

                });
        }

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
                    <th>图片</th>
                    <th>菜名</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>小计</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${sessionScope.cart.cartItems}" var="cartItem" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>
                            <div><img src="<c:url value='/${cartItem.goods.gImage }'/>"/></div>
                        </td>
                        <td>${cartItem.goods.gName }</td>
                        <td>${cartItem.goods.gPrice }元</td>
                        <td>${cartItem.count }</td>
                        <td>${cartItem.subtotal }元</td>
                            <%--改用Ajax--%>
                        <td><a href="javascript:void(0);" onclick="deleteCartItem(${cartItem.goods.gid})">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <em>总价：${sessionScope.cart.total}元</em>
            <em class="label label-warning" style="float:right;" id="placeTheOrder">下单</em>
        </div>
    </div>
</div>

</body>
</html>
