<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-06-27
  Time: 오전 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="text-align: left">
    <c:set var="row" value="30"/>
    <div>★</div>
    <c:forEach var="i" begin="1" end="${row}">
        <div>
            <c:forEach begin="${i}" end="${row}">
                &nbsp;
            </c:forEach>
            <c:forEach begin="1" end="${2 * i - 1}">
                *
            </c:forEach>
        </div>
    </c:forEach>
</div>
</body>
</html>
