<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-03-07
  Time: 오전 11:02
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
    </style>
</head>
<body>
<div>
    <h2 class="center">회원가입</h2>
    <form action="MemberJoinProc.jsp" method="post">
        <table class="center">
            <tr>
                <td class="key center">아이디</td>
                <td class="value pad-10"><input type="text" name="id" class="w-100" placeholder="id넣으세요"></td>
            </tr>
            <tr>
                <td class="key center">패스워드</td>
                <td class="value pad-10"><input type="password" name="pass1" class="w-100" placeholder="영문과숫자만 넣어주세요."></td>
            </tr>
            <tr>
                <td class="key center">패스워드확인</td>
                <td class="value pad-10"><input type="password" name="pass2" class="w-100"></td>
            </tr>
            <tr>
                <td class="key center">이메일</td>
                <td class="value pad-10"><input type="email" name="email" class="w-100"></td>
            </tr>
            <tr>
                <td class="key center">전화번호</td>
                <td class="value pad-10"><input type="tel" name="tel" class="w-100"></td>
            </tr>
            <tr>
                <td class="key center">당신의 관심분야</td>
                <td class="value center">
                    <input type="checkbox" name="hobby" value="캠핑">캠핑 &nbsp;&nbsp;
                    <input type="checkbox" name="hobby" value="등산">등산 &nbsp;&nbsp;
                    <input type="checkbox" name="hobby" value="영화">영화 &nbsp;&nbsp;
                    <input type="checkbox" name="hobby" value="독서">독서 &nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="key center">당신의 직업은</td>
                <td class="value center">
                    <select name="job">
                        <option value="교사">교사</option>
                        <option value="변호사">변호사</option>
                        <option value="의사">의사</option>
                        <option value="기술사">기술사</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="key center">당신의 연령은</td>
                <td class="value center">
                    <input type="radio" name="age" value="10">10대 &nbsp;&nbsp;
                    <input type="radio" name="age" value="20">20대 &nbsp;&nbsp;
                    <input type="radio" name="age" value="30">30대 &nbsp;&nbsp;
                    <input type="radio" name="age" value="40">40대 &nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="key center">하고 싶은 말</td>
                <td class="value center">
                    <label>
                        <textarea rows="5" cols="40" name="info"></textarea>
                    </label>
                </td>
            </tr>
            <tr>
                <td class="key center" colspan="2">
                    <input type="submit" value="회원가입">
                    <input type="reset" value="취소">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
