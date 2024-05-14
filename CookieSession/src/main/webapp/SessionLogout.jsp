<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-10
  Time: 오후 3:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    session.setAttribute("id", null);
    session.setMaxInactiveInterval(0);

    response.sendRedirect("SessionMain.jsp");
%>
</body>
</html>
