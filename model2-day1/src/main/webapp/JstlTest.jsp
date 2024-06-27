<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-06-25
  Time: 오전 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>JSTL 테스트</title>
</head>
<body>
<!-- 변수 -->
<c:set var="i" value="100"/>
<c:if test="${ i > 3 }">
    <div>출력 = ${i}</div>
</c:if>
<%
    String data = request.getParameter("data");
    try {
        request.setAttribute("data", data == null ? 0: Integer.parseInt(data) );
    } catch (NumberFormatException e) {
        request.setAttribute("data", data != null && data.length() > 1 ? (int) data.getBytes()[0]: 0);
    }
%>
<c:choose>
    <c:when test="${data > 3}">
        <div>출력 = ${data}는 3보다 크다.</div>
    </c:when>
    <c:otherwise>
        <div>출력 = ${data}는 3보다 작다.</div>
    </c:otherwise>
</c:choose>

<!-- 반복문 for -->
<c:set var="sum" value="0" />
<c:forEach var="i" begin="1" end="10" step="1">
    <div>점심시간 입니다. ${i}</div>
    <c:set var="sum" value="${sum = sum + i}" />
</c:forEach>
${sum}
</body>
</html>
