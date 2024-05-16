<%@ page import="model.BoardDAO" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-14
  Time: 오후 5:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글상세</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<%
    BoardDAO dao = new BoardDAO();
    dao.addReadCount(request.getParameter("num"));
%>
<div class="container text-center">
    <h2>게시글 상세 화면</h2>
    <table class="table table-striped align-middle">
        <tr>
            <td>글번호</td>
            <td><%= request.getParameter("num") %></td>
        </tr>
    </table>
</div>
</body>
</html>
