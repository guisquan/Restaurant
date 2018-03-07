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
</head>
<body>
<form action="${pageContext.request.contextPath}/DeskServlet">
    <input type="hidden" name="method" value="bindDesk">
    <h4>选择桌子</h4>
    <select name="deskId" id="deskId">
        <c:forEach items="${sessionScope.deskList}" var="desk">
            <option value="${desk.did}">${desk.dName}--${desk.seatNum}人桌</option>
        </c:forEach>
    </select>
    <input type="submit" value="确定">
</form>
</body>
</html>
