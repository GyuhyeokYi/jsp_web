<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-27
  Time: 오후 3:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    int no = Integer.parseInt(request.getParameter("no"));
    int qty = Integer.parseInt(request.getParameter("qty"));
%>
<%= no %>, <%= qty %>
</body>
</html>
