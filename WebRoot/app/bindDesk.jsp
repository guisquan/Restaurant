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
    <link rel="stylesheet" href="../css/core.css"/>
    <link rel="stylesheet" href="../css/menu.css"/>
    <link rel="stylesheet" href="../css/amazeui.css"/>
    <link rel="stylesheet" href="../css/component.css"/>
    <link rel="stylesheet" href="../css/page/form.css"/>
</head>
<body>
<div class="panel-body">
    <form action="" class="am-form">
        <h4>选择桌子</h4>
        <input type="hidden" name="method" value="">
        <select name="deskId" id="deskId">
            <c:forEach items="${requestScope.deskList}" var="desk">
                <option value="${desk.did}">${desk.dName}--${desk.seatNum}人桌</option>
            </c:forEach>
        </select>
        <input type="submit" value="确定" class="waves-light">
    </form>
</div>
</body>
</html>
