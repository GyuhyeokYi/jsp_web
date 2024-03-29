<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-03-18
  Time: 오후 4:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<h2>
    이 페이지는 로그인 정보가 넘어오는 페이지입니다.
</h2>
<%
    String id = request.getParameter("id");

//    response.sendRedirect("ResponseRedirect.jsp"); //흐름제어
%>
<jsp:forward page="ResponseRedirect.jsp">
    <jsp:param name="phone" value="010-5592-7662"/>
</jsp:forward>
<!-- 흐름제어 -->
<h3>아이디 = <%= id %></h3>
</body>
</html>
