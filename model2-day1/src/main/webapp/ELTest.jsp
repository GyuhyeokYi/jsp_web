<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-06-03
  Time: 오후 6:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    int i = 3;
    out.println("i = " + i);
    request.setAttribute("ia", 3);
%>
<p>
    i = <%= i > 4 %>
</p>
i = ${ia.toString() + "4"}
</body>
</html>
