<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-03-19
  Time: 오전 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <style>
        table {
            width: 500px;
            border: 1px solid black;
        }
        td {
            border: 1px solid black;
        }
        tr {
            height: 50px;
        }
        .center {
            text-align: center;
        }
        .key {
            width: 150px;
        }
        .value {
            width: 350px;
        }
        .pad-10 {
            padding: 0 10%;
        }
        .w-100 {
            width: 100%;
        }
        .container {
            display: flex;
            align-items: center;
            height: 100%;
            flex-direction: column;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="center">회원가입</h2>
    <form action="MemberJoinProc.jsp" method="post">
        <table>
            <tr>
                <td class="key center">아이디</td>
                <td class="value pad-10"><input type="text" name="id" class="w-100" placeholder="id 넣으세요"/></td>
            </tr>
            <tr>
                <td class="key center">패스워드</td>
                <td class="value pad-10"><input type="password" name="pass1" class="w-100" placeholder="영문과 숫자만 넣어주세요."/></td>
            </tr>
            <tr>
                <td class="key center">이메일</td>
                <td class="value pad-10"><input type="email" name="email" class="w-100"/></td>
            </tr>
            <tr>
                <td class="key center">전화번호</td>
                <td class="value pad-10"><input type="tel" name="tel" class="w-100"/></td>
            </tr>
            <tr>
                <td class="key center">주소</td>
                <td class="value pad-10">
                    <input type="text" name="address" class="w-100"/></td>
            </tr>
            <tr>
                <td colspan="2" class="center" ><input type="submit" value="회원가입"/></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
