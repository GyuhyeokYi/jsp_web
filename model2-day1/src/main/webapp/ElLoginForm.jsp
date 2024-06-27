<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-06-03
  Time: 오후 6:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<div class="container text-center">
    <h2>로그인</h2>
    <form action="ElLoginProc.jsp" method="post">
        <table class="table align-middle text-center">
            <tr>
                <td>아이디</td>
                <td><input class="form-control" type="text" name="id"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input class="form-control" type="password" name="password"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="submit" class="btn btn-primary">로그인</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
