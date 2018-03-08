<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gui
  Date: 18-3-8
  Time: 上午9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        /**
         * do something ...
         * modify style page
         */
        function modifyStyle() {

        }
    </script>
</head>
<body>
<div class="col-sm-5">
    <div class="widget-box transparent">
        <div class="widget-header widget-header-flat">
            <h4 class="lighter">
                <i class="icon-star orange"></i>
                热门域名
            </h4>

            <div class="widget-toolbar">
                <a href="#" data-action="collapse">
                    <i class="icon-chevron-up"></i>
                </a>
            </div>
        </div>

        <div class="widget-body">
            <div class="widget-main no-padding">
                <table class="table table-bordered table-striped">
                    <thead class="thin-border-bottom">
                    <tr>
                        <th>
                            <i class="icon-caret-right blue"></i>
                            ID
                        </th>
                        <th>
                            <i class="icon-caret-right blue"></i>
                            名称
                        </th>

                        <th>
                            <i class="icon-caret-right blue"></i>
                            上一级
                        </th>

                        <th class="hidden-480">
                            <i class="icon-caret-right blue"></i>
                            状态
                        </th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${sessionScope.allStyle}" var="style" varStatus="status">
                        <tr>
                            <td>${style.sid}</td>
                            <td>
                                <b class="green">${style.sName}</b>
                            </td>
                            <td>
                                <b class="green">${style.spid}</b>
                            </td>
                            <td class="hidden-480">
                                <span class="label label-warning arrowed arrowed-right">
                                    <a href="javascript:void(0);" onclick="modifyStyle(${style.sid})">修改</a>
                                </span>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div><!-- /widget-main -->
        </div><!-- /widget-body -->
    </div><!-- /widget-box -->

</body>
</html>
