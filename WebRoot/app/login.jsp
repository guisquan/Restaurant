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
    <script type="text/javascript" src="../js/jquery-2.1.0.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#login").click(function () {
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
                            $(window).attr('location',"${pageContext.request.contextPath}/DeskServlet?method=findAllDesk");
                        }
                    }
                );
            });
        });
    </script>
</head>
<body>
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

            </div>
        </div>
    </div>
</div>
</body>
</html>
