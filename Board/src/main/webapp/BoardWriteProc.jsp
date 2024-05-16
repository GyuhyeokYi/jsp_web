<%@ page import="model.BoardDAO" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-14
  Time: 오후 5:16
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
    String message;
    int code;
    if(dao.insertBoard(board)) {
        message = "글 작성에 성공하였습니다.";
        code = 200;
    } else {
        message = "글 작성에 실패하였습니다.";
        code = 500;
    }
%>
<script>
    alert('<%= message %>')
    if (200 === <%= code %>) {
        window.location.href="BoardList.jsp"
    } else {
        window.history.back()
    }
</script>
</body>
</html>
