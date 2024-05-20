<%@ page import="model.BoardDAO" %>
<%@ page import="model.BoardBean" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-20
  Time: 오전 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글삭제</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<%
    int num = Integer.parseInt(request.getParameter("num"));

    BoardDAO dao = new BoardDAO();
    BoardBean board = dao.getOneUpdateBoard(num);
%>
<div class="container text-center">
    <h2>게시글 수정</h2>
    <form action="BoardDeleteProc.jsp" method="post">
        <table class="table table-striped align-middle">
            <colgroup>
                <col style="width: 15%;">
                <col style="width: 35%;">
                <col style="width: 15%;">
                <col style="width: 35%;">
            </colgroup>
            <tr>
                <td>작성자</td>
                <td colspan="3"><%= board.getWriter() %></td>
            </tr>
            <tr>
                <td>작성일</td>
                <td><%= board.getReg_date() %></td>
                <td>수정일</td>
                <td><%= board.getModi_date() %></td>
            </tr>
            <tr>
                <td>제목</td>
                <td colspan="3"><%= board.getSubject() %></td>
            </tr>
            <tr>
                <td>패스워드</td>
                <td colspan="3"><input type="password" name="password" class="form-control" required></td>
            </tr>
            <tr>
                <td>글내용</td>
                <td colspan="3"><%= board.getContent().replaceAll("\r\n", "<br>") %></td>
            </tr>
        </table>
        <div class="container">
            <input type="hidden" name="num" value="<%= board.getNum() %>">
            <button type="submit" class="btn btn-primary">글삭제</button>
            <button type="button" class="btn btn-primary" onclick="location.href='BoardList.jsp'">전체 게시글보기</button>
        </div>
    </form>
</div>
</body>
</html>
