<%@ page import="model.BoardDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.BoardBean" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-14
  Time: 오후 5:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<%
    BoardDAO dao = new BoardDAO();
    ArrayList<BoardBean> list = dao.allSelectBorad();
%>
<div class="container text-center">
    <h2>게시판</h2>
    <table class="table table-striped align-middle">
        <thead>
        <tr>
            <th class="text-center" scope="col">#</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">이메일</th>
            <th scope="col">작성일</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (BoardBean board : list) {
        %>
        <tr>
            <th class="text-center" scope="row"><%= list.indexOf(board) + 1 %></th>
            <td>
                <a href="BoradDetail.jsp?num=<%= board.getNum() %>"><%= board.getSubject() %></a>
                    <%
                        if ("Y".equals(board.getNewYn())) {
                    %>
                    &nbsp;<span class="badge bg-danger">N</span>
                    <%
                        }
                    %>
            </td>
            <td><%= board.getWriter() %></td>
            <td><%= board.getEmail() %></td>
            <td><%= board.getReg_date() %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <div class="container">
        <button type="button" class="btn btn-primary" onclick="location.href='BoardWriteForm.jsp'">게시글작성</button>
    </div>
</div>
</body>
</html>
