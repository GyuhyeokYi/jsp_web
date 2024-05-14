<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-08
  Time: 오전 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <title>로그인처리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<%
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");

    session.setAttribute("id", id);
    session.setAttribute("pass", pass);

    // 세션의 유지시간 설정
    session.setMaxInactiveInterval(60 * 2);

    response.sendRedirect("SessionMain.jsp");
%>
<div class="container text-center">
    <h2>세션 로그인 처리 1</h2>
    <h2>당신의 아이디는 <%= id %> 입니다. 패스워드는 <%= pass %></h2>
    <a href="SessionLoginProc2.jsp">다음페이지로 이동</a>
</div>
</body>
</html>
