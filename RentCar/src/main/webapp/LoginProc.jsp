<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-22
  Time: 오후 5:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    String id = request.getParameter("id");
    if (id != null) {
        session.setAttribute("id", id);
    }
    response.sendRedirect("RentcarMain.jsp");
%>
</body>
</html>
