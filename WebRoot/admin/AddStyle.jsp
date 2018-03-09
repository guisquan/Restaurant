<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gui
  Date: 18-3-7
  Time: 上午11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加类型</title>
    <script src="../js/jquery-2.1.0.js" type="text/javascript"></script>
    <script type="text/javascript">
        /**
         * 判断要添加的类型名称是否存在;
         * 存在：true；
         * 不存在：false；（可添加）
         */
        function hasStyle() {
            var sName = $("#sName").val();
            $.get("${pageContext.request.contextPath}/StyleServlet?method=hasStyle",
                {sName: sName},
                function (data) {
                    if (data.indexOf('true') === -1) {
                        // 不存在，可以添加。
                        // $("#span_style").val("")
                        // alert("failed");
                        $("#span_style").text("");
                        return false;
                    }

                    else {
                        //存在不可以添加
                        $("#span_style").text("类型名称存在不能添加！").css({"color": "red"});
                        // alert("类型名称存在不能添加！");
                        return true;
                    }
                }
            );
        }

        $(function () {
            $("#addStyleBtn").click(function () {
                var result = hasStyle();
                if (!result) {//可以添加
                    $.post("${pageContext.request.contextPath}/StyleServlet?method=addStyle",
                        {
                            sName: $("[name='sName']").val(),
                            spid: $("[name='spid']").val()
                        },
                        function (data) {
                            if (data.indexOf('true') === -1) {
                                // 添加失败
                                // return false;
                            }
                            else {
                                //添加成功
                                alert("添加了一个类型!");
                                // return true;
                            }
                        }
                    );
                }
            });
        });
    </script>

</head>
<body>
<div>
    <em>添加分类</em>
    <form action="" method="post" id="addStyleForm">
        <%--<input type="hidden" name="method" value="addStyle">--%>
        上一级：
        <select name="spid">
            <c:forEach items="${sessionScope.allStyle}" var="style">
                <option value="${style.sid}">${style.sName}</option>
            </c:forEach>
        </select>
        <label>
            分类名称：<input type="text" name="sName" id="sName" onblur="hasStyle()">
        </label>
        <span id="span_style"></span>
    </form>
    <input type="button" value="添加分类" id="addStyleBtn">
</div>
</body>
</html>
