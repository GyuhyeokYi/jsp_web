<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-22
  Time: 오후 5:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    session.setAttribute("id", null);
    response.sendRedirect("RentcarMain.jsp");
%>

</body>
</html>
