<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-16
  Time: 오후 4:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>댓글작성</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<%
    int num = Integer.parseInt(request.getParameter("num"));
    int ref = Integer.parseInt(request.getParameter("ref"));
    int re_step = Integer.parseInt(request.getParameter("re_step"));
    int re_level = Integer.parseInt(request.getParameter("re_level"));
%>
<div class="container text-center">
    <h2>답변글 입력하기</h2>
    <form action="BoardReWriteProc.jsp" method="post">
        <table class="table table-striped align-middle">
            <tr>
                <td>작성자</td>
                <td><input type="text" name="writer" class="form-control" required></td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input type="text" name="subject" class="form-control" value="[답변] " required></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input type="email" name="email" class="form-control" required></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="password" class="form-control" required></td>
            </tr>
            <tr>
                <td>글내용</td>
                <td><textarea rows="10" cols="50" name="content" class="form-control" required></textarea></td>
            </tr>
        </table>
        <div class="container">
            <input type="hidden" name="ref" value="<%= ref %>">
            <input type="hidden" name="re_step" value="<%= re_step %>">
            <input type="hidden" name="re_level" value="<%= re_level %>">
            <button type="submit" class="btn btn-primary">답글쓰기완료</button>
            <button type="reset" class="btn btn-primary">취소</button>
            <button type="button" class="btn btn-primary" onclick="location.href='BoardList.jsp'">전체 게시글보기</button>
        </div>
    </form>
</div>
</body>
</html>
