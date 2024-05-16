<%@ page import="model.BoardDAO" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-16
  Time: 오후 5:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<jsp:useBean id="board" class="model.BoardBean">
    <jsp:setProperty name="board" property="*" />
</jsp:useBean>
<%
    BoardDAO dao = new BoardDAO();
    dao.reWriteBoard(board);

    response.sendRedirect("BoardList.jsp");
%>
</body>
</html>