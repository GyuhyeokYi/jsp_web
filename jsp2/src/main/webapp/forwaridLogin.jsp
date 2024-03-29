<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-03-18
  Time: 오후 4:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="center">
    <form action="ResponseProc.jsp" method="post">
        <table style="width: 400px">
            <tr style="height: 50px">
                <td style="width: 150px; text-align: center">아이디</td>
                <td style="width: 250px"><input type="text" name="id"></td>
            </tr>
            <tr style="height: 50px">
                <td style="width: 150px; text-align: center">패스워드</td>
                <td style="width: 250px"><input type="password" name="pass"></td>
            </tr>
            <tr style="height: 50px">
                <td style="text-align: center" colspan="2">
                    <input type="submit" value="로그인">&nbsp;&nbsp;
                    <input type="reset" value="취소">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
