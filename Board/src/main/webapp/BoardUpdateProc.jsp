<%@ page import="model.BoardDAO" %>
<%@ page import="model.BoardBean" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-17
  Time: 오후 5:44
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
        if(dao.updateBoard(board)) {
            code = 200;
            message = "게시글을 수정하였습니다.";
        } else {
            code = 500;
            message = "게시글 수정에 오류가 발생하였습니다. 잠시 후 다시 이용해주시기 바랍니다.";
        }
    } else {
        code = 500;
        message = "비밀번호가 일치 하지 않습니다. 다시 확인 후 수정해주세요.";
    }
%>
<script>
    alert('<%= message %>');
    if (200 === <%= code %>) {
        window.location.href = 'BoardList.jsp'
    } else {
        window.history.back();
    }
</script>
</body>
</html>
