<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="../css/core.css"/>
    <link rel="stylesheet" href="../css/menu.css"/>
    <link rel="stylesheet" href="../css/amazeui.css"/>
    <link rel="stylesheet" href="../css/component.css"/>
    <link rel="stylesheet" href="../css/page/form.css"/>
    <style type="text/css">
        .mask {
            position: absolute;
            top: 0px;
            filter: alpha(opacity=60);
            background-color: #777;
            z-index: 1002;
            left: 0px;
            opacity: 0.5;
            -moz-opacity: 0.5;
        }

        .model {
            position: absolute;
            z-index: 1003;
            width: 320px;
            height: 320px;
            text-align: center;
            background-color: #e5fffd;
            display: none;
        }
    </style>
    <script type="text/javascript" src="../js/jquery-2.1.0.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#login").click(function () {

                /**
                 * 关闭Ajax异步
                 */
                $.ajaxSetup({
                    async: false
                });

                //检查数据，提交
                // $("form").submit();
                var userName = $("[name='userName']").val();
                var userPwd = $("[name='userPwd']").val();
                var flag = true;
                $.post("${pageContext.request.contextPath}/UserServlet?method=login",
                    {userName: userName, userPwd: userPwd},
                    function (data) {
                        if (data.indexOf('true') === -1) {
                            flag = false;
                            // 失败;
                            alert("你是不是傻？用户名或密码错了！");
                        } else {
                            //do something while true;
                            loadBindDesk();
                            $("#model").load("bindDesk.jsp");
                            showAll('#model');
                            <%--$(window).attr('location', "${pageContext.request.contextPath}/DeskServlet?method=findAllDesk");--%>
                        }
                    }
                );
            });
        });

        function loadBindDesk() {
            $.post("${pageContext.request.contextPath}/DeskServlet?method=findAllDesk",
                {},
                function (data) {
                    if (data.indexOf('true') === -1) {
                        // 失败;
                        return false;
                    } else {
                        //do something while true;
                        return true;
                    }
                }
            );
        }

        /**
         * 显示保护罩
         */
        function showMask() {
            $("#mask").css("height", $(document).height());
            $("#mask").css("width", $(document).width());
            $("#mask").show();
        }

        //让指定的DIV始终显示在屏幕正中间
        function letDivCenter(divName) {
            var top = ($(window).height() - $(divName).height()) / 5;
            var left = ($(window).width() - $(divName).width()) / 5;
            var scrollTop = $(document).scrollTop();
            var scrollLeft = $(document).scrollLeft();
            $(divName).css({
                position: 'absolute',
                'top': top + scrollTop,
                left: left + scrollLeft
            }).show();
        }

        function showAll(divName) {
            showMask();
            letDivCenter(divName);
        }
    </script>
</head>
<body>
<div id="mask" class="mask"></div>
<div class="account-pages">
    <div class="wrapper-page">
        <div class="text-center">
            <a href="index.jsp" class="logo"><span>Admin<span>to</span></span></a>
        </div>

        <div class="m-t-40 card-box">
            <div class="text-center">
                <h4 class="text-uppercase font-bold m-b-0">Sign In</h4>
            </div>
            <div class="panel-body">
                <form action="javascript:void(0);" class="am-form" method="post">
                    <%--<input type="hidden" name="method" value="login">--%>
                    <div class="am-g">
                        <div class="am-form-group">
                            <input name="userName" type="text" class="am-radius" placeholder="Username">
                        </div>

                        <div class="am-form-group form-horizontal m-t-20">
                            <input name="userPwd" type="password" class="am-radius" placeholder="Password">
                        </div>

                        <div class="am-form-group ">
                            <label style="font-weight: normal;color: #999;">
                                <input type="checkbox" class="remeber"> Remember me
                            </label>
                        </div>

                        <div class="am-form-group " id="login">
                            <button type="button" class="am-btn am-btn-primary am-radius"
                                    style="width: 100%;height: 35px;">Log In
                            </button>
                        </div>

                        <div class="am-form-group ">
                            <a href="page-recoverpw.jsp" class="text-muted"><i class="fa fa-lock m-r-5"></i> Forgot
                                your password?</a>
                        </div>
                    </div>

                </form>
                <%--弹出框--%>
                <div id="model" class="model">
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
