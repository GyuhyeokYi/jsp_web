<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-23
  Time: 오전 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<form action="LoginProc.jsp" method="post">
    <div class="container">
        <div class="d-flex justify-content-center">
            <table class="table table-striped text-center align-middle w-50">
                <tr>
                    <td>아이디</td>
                    <td><input type="text" class="form-control" name="id" required></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" class="form-control" name="pass1" required></td>
                </tr>
            </table>
        </div>
        <div class="container text-center">
            <button type="submit" class="btn btn-dark">로그인</button>
        </div>
    </div>
</form>
</body>
</html>
