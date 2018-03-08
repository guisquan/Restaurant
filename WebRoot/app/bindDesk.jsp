<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gui
  Date: 18-3-5
  Time: 下午4:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        /**
         * 确认后调用styleServlet加载到session中
         */
        $(function () {
            $("#button1").click(function () {
                $.get("${pageContext.request.contextPath}/StyleServlet?method=getAllStyle",
                    {},
                    function (data) {
                        if (data.indexOf('true') === -1) {
                            //do nothing
                        } else {
                            //do nothing
                            $("#bindDeskForm").submit();
                        }
                    }
                );
            });
        });
    </script>
</head>
<body>
<form action="${pageContext.request.contextPath}/DeskServlet" id="bindDeskForm">
    <input type="hidden" name="method" value="bindDesk">
    <h4>选择桌子</h4>
    <select name="deskId" id="deskId">
        <c:forEach items="${sessionScope.deskList}" var="desk">
            <option value="${desk.did}">${desk.dName}--${desk.seatNum}人桌</option>
        </c:forEach>
    </select>
    <input type="button" value="确定" id="button1">
</form>
</body>
</html>
