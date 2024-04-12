<%@ page import="model.MemberDAO" %>
<%@ page import="model.MemberBean" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-04-12
  Time: 오전 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원 삭제</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <div class="text-center">
        <h2>회원 삭제</h2>
    </div>
    <form action="MemberDeleteProc.jsp" method="post">
        <table class="table table-striped align-middle">
            <tr>
                <td>아이디</td>
                <td><%= request.getParameter("id") %></td>
            </tr>
            <tr>
                <td>패스워드</td>
                <td><input type="password" class="form-control" name="pass1" required></td>
            </tr>
            <tr>
                <td colspan="2" class="text-center">
                    <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
                    <input type="submit" class="btn btn-primary" value="회원 삭제하기">
                    <button type="button" class="btn btn-primary" onclick="location.href='MemberList.jsp'">회원 전체보기</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
