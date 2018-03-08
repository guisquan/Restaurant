<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>前台模板</title>
    <link rel="stylesheet" href="../css/amazeui.css"/>
    <link rel="stylesheet" href="../css/core.css"/>
    <link rel="stylesheet" href="../css/menu.css"/>
    <link rel="stylesheet" href="../css/index.css"/>
    <link rel="stylesheet" href="../css/admin.css"/>
    <link rel="stylesheet" href="../css/page/typography.css"/>
    <link rel="stylesheet" href="../css/page/form.css"/>
    <link rel="stylesheet" href="../css/component.css"/>
    <style type="text/css">
        /*.gw_num {
                    border: 1px solid #dbdbdb;
                    width: 110px;
                    !*width: 220px;*!
                    line-height: 26px;
                    overflow: hidden;
                }

                .gw_num em {
                    display: block;
                    height: 26px;
                    width: 26px;
                    float: left;
                    color: #7A7979;
                    border-right: 1px solid #dbdbdb;
                    text-align: center;
                    cursor: pointer;
                }

                .gw_num .num {
                    display: block;
                    float: left;
                    text-align: center;
                    width: 52px;
                    font-style: normal;
                    font-size: 14px;
                    line-height: 24px;
                    border: 0;
                }

                .gw_num em.add {
                    float: right;
                    border-right: 0;
                    border-left: 1px solid #dbdbdb;
                }
            */
    </style>
    <script type="text/javascript" src="../js/jquery-2.1.0.js"></script>
    <script type="text/javascript">

        /*//加减按钮
        $(function () {
            //加的效果
            $(".add").click(function () {
                var n = $(this).prev().val();
                var num = parseInt(n) + 1;
                if (num == 0) {
                    return;
                }
                $(this).prev().val(num);
            });
            //减的效果
            $(".jian").click(function () {
                var n = $(this).next().val();
                var num = parseInt(n) - 1;
                if (num == 0) {
                    return
                }
                $(this).next().val(num);
            });
        });*/


        /**
         * 关闭Ajax异步
         */
        $.ajaxSetup({
            async: false
        });

        /**
         * 初始化，加载菜单栏
         */
        //放在bindDesk中了
        /*$(function () {
            $.ajaxSetup({
                async: false
            });
            var flag = true;
            $.get("${pageContext.request.contextPath}/StyleServlet?method=getAllStyle",
                {},
                function (data) {
                    if (data.indexOf('true') === -1) {
                        flag = false;
                        // return true;
                    } else {
                        //do something while true;
                    }
                }
            );
        });*/

        function loadStylesById(styleId) {
            var goodsList = new Array();
            $.get("${pageContext.request.contextPath}/GoodsServlet?method=getAllGoodsByStyle",
                {styleId: styleId},
                function (data) {
                    if (data === null || "" === data) {
                        // 显示没有数据;
                    } else {
                        var jsondatas = eval("(" + data + ")");
                        loadCards(jsondatas);
                    }
                }
            );
        }

        function loadCards(goodsList) {

            var txt = "";
            for (var i = 0; i < goodsList.length; i++) {
                var $parentDiv = $('<div>');
                $parentDiv.addClass('am-u-md-3');

                txt = txt + "<div class='am-u-md-3' style='float:left;'>" +
                    "<div class='card-box'>" +
                    "<h4 class='header-title m-t-0 m-b-30'>" + goodsList[i].gName + "</h4>" +
                    "<div class='widget-chart-1 am-cf'>" +
                    "<div id='widget-chart-box-1' style='height: 110px;width: 110px;float: left;'></div>" +
                    "<div class='widget-detail-1' style='float: right;'>" +
                    "<h2 class='p-t-10 m-b-0'>￥" + goodsList[i].gPrice + " </h2>" +
                    "<p class='text-muted'>" +
                    // "<div class='gw_num'>" +
                    // "<em class='jian'>-</em><input type='text' class='num' value='1'>" +
                    // "<em class='add'>+</em></div>" +
                    "<a href='javascript:void(0);' onclick='addGoods(" + goodsList[i].gid + ")' style='float: left' class='label label-danger'>加入购物车</a></p>" +
                    "</div></div></div></div>";
            }
            $("#rowCard").html(txt);
        }

        function addGoods(gid) {
            $.get("${pageContext.request.contextPath}/CartServlet?method=add",
                {gid: gid, count: 1},
                function (data) {
                    if (data.indexOf('true') === -1) {
                        // flag = false;
                        // return true;
                        alert("faild");
                    } else {
                        // alert("add a goods");
                        //do something while true;
                    }
                }
            );
        }

        function cartList() {
            $("#rowCard").load("cartList.jsp");
        }

        function loadRecommend() {
            $("#rowCard").load("recommend.jsp");
        }

        function loadGame() {
            <%--$("#rowCard").load("${pageContext.request.contextPath}/app/games/index.html");--%>
        }
    </script>
</head>

<body>
<!-- Begin page -->
<header class="am-topbar am-topbar-fixed-top">
    <div class="am-topbar-left am-hide-sm-only">
        <a href="index.jsp" class="logo">
            <span>${sessionScope.desk.dName}<span>${sessionScope.desk.seatNum}</span></span>
            <i class="zmdi zmdi-layers"></i></a>
    </div>

    <div class="contain">
        <ul class="am-nav am-navbar-nav am-navbar-left">
            <li><h4 class="page-title">${sessionScope.session_user.userName}为您服务</h4></li>
        </ul>

        <ul class="am-nav am-navbar-nav am-navbar-right">
            <li class="inform"><i class="am-icon-bell-o" aria-hidden="true"></i></li>
            <li class="hidden-xs am-hide-sm-only">
                <form role="search" class="app-search">
                    <input type="text" placeholder="Search..." class="form-control">
                    <a href=""><img src="../images/search.png"></a>
                </form>
            </li>
        </ul>
    </div>
</header>
<!-- end page -->


<div class="admin">
    <!--<div class="am-g">-->
    <!-- ========== Left Sidebar Start ========== -->
    <!--<div class="left side-menu am-hide-sm-only am-u-md-1 am-padding-0">
        <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 548px;">
            <div class="sidebar-inner slimscrollleft" style="overflow: hidden; width: auto; height: 548px;">-->
    <!-- sidebar start -->
    <div class="admin-sidebar am-offcanvas  am-padding-0" id="admin-offcanvas">
        <div class="am-offcanvas-bar admin-offcanvas-bar">
            <!-- User -->
            <div class="user-box am-hide-sm-only">
                <div class="user-img">
                    <img src="../images/cart.jpg" alt="user-img" title="购物车"
                         class="img-circle img-thumbnail img-responsive" onclick="cartList()">
                    <%--<div class="user-status offline"><i class="am-icon-dot-circle-o" aria-hidden="true"></i></div>--%>
                </div>
            </div>
            <!-- End User -->

            <ul class="am-list admin-sidebar-list">
                <li><a href="index.jsp"><span class="am-icon-home"></span> 首页</a></li>
                <%--<c:if test="${empty sessionScope.styleList}">
                    <script type="text/javascript">
                        alert("styleList is NULL");
                    </script>
                </c:if>--%>

                <c:forEach items="${sessionScope.styleList}" var="style" varStatus="status">
                    <li class="admin-parent">
                        <a class="am-cf" data-am-collapse="{target: '#collapse-nav${status.count}'}">
                            <span class="am-icon-table"></span>
                                ${style.sName}
                            <span class="am-icon-angle-right am-fr am-margin-right"></span>
                        </a>
                        <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav${status.count}">
                            <c:forEach items="${style.childStyle}" var="children">
                                <li>
                                    <a href="javascript:void(0);"
                                       onclick="loadStylesById(${children.sid});"
                                       class="am-cf">
                                        <span>${children.sName}</span></a>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>
                </c:forEach>
                <li><a href="javascript:void(0);" onclick="loadRecommend()"><span class="am-icon-area-chart"></span> 留言</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/app/games/index.html"><span
                        class="am-icon-android"></span>
                    休闲游戏</a>
                </li>
            </ul>
        </div>
    </div>
    <!-- sidebar end -->

    <!--</div>
</div>
</div>-->
    <!-- ========== Left Sidebar end ========== -->


    <!--	<div class="am-g">-->
    <!-- ============================================================== -->
    <!-- Start right Content here -->
    <div class="content-page">
        <!-- Start content -->
        <div class="content" id="main">
            <div class="am-g" id="rowCard">
            </div>
        </div>
    </div>
    <!-- end right Content here -->
    <!--</div>-->
</div>

<!-- navbar -->
<a href="admin-offcanvas" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
   data-am-offcanvas="{target: '#admin-offcanvas'}"><!--<i class="fa fa-bars" aria-hidden="true"></i>--></a>

<script type="text/javascript" src="../js/jquery-2.1.0.js"></script>
<script type="text/javascript" src="../js/amazeui.min.js"></script>
<script type="text/javascript" src="../js/app.js"></script>
<script type="text/javascript" src="../js/blockUI.js"></script>
<script type="text/javascript" src="../js/charts/echarts.min.js"></script>
<script type="text/javascript" src="../js/charts/indexChart.js"></script>

</body>

</html>
