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
<form action="MemberLoginProc.jsp" method="post">
    <div class="container">
        <div class="d-flex justify-content-center">
            <table class="table table-borderless text-center align-middle w-50">
                <tr>
                    <td colspan="2"><div style="color: gray; font-size: 2rem;">로그인</div></td>
                </tr>
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
            <button type="submit" class="btn btn-dark no-radius">로그인</button>
            <button type="button" class="btn btn-dark no-radius" onclick="window.location='RentcarMain.jsp?center=MemberJoin.jsp'">회원가입</button>
        </div>
    </div>
</form>
</body>
</html>
