<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-08
  Time: 오전 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<body>
<div class="container text-center">
    <h2>세션 로그인</h2>
    <form action="SessionLoginProc.jsp" method="post">
        <table class="table table-striped align-middle">
            <tr>
                <td>아이디</td>
                <td><input class="form-control" type="text" name="id" required placeholder="아이디를 입력하세요."></td>
            </tr>
            <tr>
                <td>패스워드</td>
                <td><input class="form-control" type="password" name="pass" required placeholder="비밀번호를 입력하세요."></td>
            </tr>
        </table>
        <div class="container">
            <button class="btn btn-primary" type="submit">로그인</button>
            <button class="btn btn-primary" type="button" onclick="window.history.back()">뒤로가기</button>
        </div>
    </form>
</div>
</body>
</html>
