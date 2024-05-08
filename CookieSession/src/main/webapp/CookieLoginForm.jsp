<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-04-18
  Time: 오전 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인화면</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<%!
    String id = "";
%>
<%
    Cookie[] cookies = request.getCookies();
    for (Cookie cookie : cookies) {
        if ("id".equals(cookie.getName())) {
            id = cookie.getValue();
            break;
        }
    }
%>
<div class="container text-center w-50">
    <h2>쿠키 로그인</h2>
    <form action="CookieLoginProc.jsp" method="post">
        <table class="table table-striped align-middle">
            <tr>
                <td>아이디</td>
                <td><input class="form-control" type="text" name="id" required placeholder="아이디를 입력하세요." value="<%= id %>"></td>
            </tr>
            <tr>
                <td>패스워드</td>
                <td><input class="form-control" type="password" name="password" required placeholder="비밀번호를 입력하세요."></td>
            </tr>
            <tr class="text-center">
                <td colspan="2"><input class="form-check-input" type="checkbox" name="save" checked value="Y"> 아이디 저장</td>
            </tr>
            <tr class="text-center">
                <td colspan="2"><button class="btn btn-primary" type="submit">로그인</button></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
