<%@ page import="model.BoardDAO" %>
<%@ page import="model.BoardBean" %><%--
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
    int num = Integer.parseInt(request.getParameter("num").trim());

    BoardDAO dao = new BoardDAO();
    // 게시글 정보 가져옴, Read Count 같이 처리
    BoardBean board = dao.getOneBoard(num);
%>
<div class="container text-center">
    <h2>게시글 상세 화면</h2>
    <table class="table table-striped align-middle">
        <colgroup>
            <col style="width: 15%;">
            <col style="width: 35%;">
            <col style="width: 15%;">
            <col style="width: 35%;">
        </colgroup>
        <tr>
            <td>글번호</td>
            <td><%= board.getNum() %></td>
            <td>조회수</td>
            <td><%= board.getReadcount() %></td>
        </tr>
        <tr>
            <td>작성자</td>
            <td><%= board.getWriter() %></td>
            <td>이메일</td>
            <td><%= board.getEmail() %></td>
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
            <td>글내용</td>
            <td colspan="3"><%= board.getContent().replaceAll("\r\n", "<br>") %></td>
<%--            <td colspan="3"><textarea rows="10" cols="50" name="content" class="form-control" readonly><%= board.getContent() %></textarea></td>--%>
        </tr>
    </table>
    <div class="container">
        <button type="button" class="btn btn-primary"
                onclick="location.href='BoardReWriteForm.jsp?num=<%= board.getNum() %>&ref=<%= board.getRef() %>&re_step=<%= board.getRe_step() %>&re_level=<%= board.getRe_level() %>'">댓글작성</button>
        <button type="button" class="btn btn-primary"
                onclick="location.href='BoardUpdateForm.jsp?num=<%= board.getNum() %>'">수정하기</button>
        <button type="button" class="btn btn-primary"
                onclick="location.href='BoardDeleteForm.jsp?num=<%= board.getNum() %>'">삭제하기</button>
        <button type="button" class="btn btn-primary" onclick="location.href='BoardList.jsp'">전체 게시글보기</button>
    </div>
</div>
</body>
</html>
