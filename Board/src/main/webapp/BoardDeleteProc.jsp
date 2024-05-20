<%@ page import="model.BoardDAO" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-20
  Time: 오전 10:05
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

    String pass = dao.getPass(board.getNum());

    int code;
    String message;
    if (pass.equals(board.getPassword())) {
        if (dao.deleteBoard(board)) {
            code = 200;
            message = "게시글을 삭제하였습니다.";
        } else {
            code = 500;
            message = "게시글 삭제에 오류가 발생하였습니다. 잠시 후 다시 이용해주시기 바랍니다.";
        }
    } else {
        code = 501;
        message = "패스워드가 틀려서 삭제 할 수 없습니다. 패스워드를 확인 해주세요.";
    }
%>
<script>
    alert('<%= message %>')
    if (200 === <%= code %>) {
        window.location.href = 'BoardList.jsp'
    } else {
        window.history.back()
    }
</script>
</body>
</html>
