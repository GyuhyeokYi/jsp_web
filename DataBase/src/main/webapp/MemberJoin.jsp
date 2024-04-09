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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <h2 class="text-center">회원가입</h2>
    <form action="MemberJoinProc.jsp" method="post">
        <table class="table table-striped">
            <tr>
                <td class="text-center">아이디</td>
                <td class="value pad-10"><input type="text" name="id" class="form-control" placeholder="id넣으세요"></td>
            </tr>
            <tr>
                <td class="text-center">패스워드</td>
                <td class="value pad-10"><input type="password" name="pass1" class="form-control" placeholder="영문과숫자만 넣어주세요."></td>
            </tr>
            <tr>
                <td class="text-center">패스워드확인</td>
                <td class="value pad-10"><input type="password" name="pass2" class="form-control"></td>
            </tr>
            <tr>
                <td class="text-center">이메일</td>
                <td class="value pad-10"><input type="email" name="email" class="form-control"></td>
            </tr>
            <tr>
                <td class="text-center">전화번호</td>
                <td class="value pad-10"><input type="tel" name="tel" class="form-control"></td>
            </tr>
            <tr>
                <td class="text-center">당신의 관심분야</td>
                <td class="value center">
                    <input type="checkbox" class="form-check-input mt-0" name="hobby" value="캠핑">캠핑 &nbsp;&nbsp;
                    <input type="checkbox" class="form-check-input mt-0" name="hobby" value="등산">등산 &nbsp;&nbsp;
                    <input type="checkbox" class="form-check-input mt-0" name="hobby" value="영화">영화 &nbsp;&nbsp;
                    <input type="checkbox" class="form-check-input mt-0" name="hobby" value="독서">독서 &nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="text-center">당신의 직업은</td>
                <td class="value center">
                    <select class="form-select" name="job">
                        <option selected>선택...</option>
                        <option value="교사">교사</option>
                        <option value="변호사">변호사</option>
                        <option value="의사">의사</option>
                        <option value="기술사">기술사</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="text-center">당신의 연령은</td>
                <td class="value center">
                    <input type="radio" class="form-check-input mt-0" name="age" value="10">10대 &nbsp;&nbsp;
                    <input type="radio" class="form-check-input mt-0" name="age" value="20">20대 &nbsp;&nbsp;
                    <input type="radio" class="form-check-input mt-0" name="age" value="30">30대 &nbsp;&nbsp;
                    <input type="radio" class="form-check-input mt-0" name="age" value="40">40대 &nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="text-center">하고 싶은 말</td>
                <td class="value center">
                    <div class="form-floating">
                        <textarea class="form-control" placeholder="Leave a comment here" style="height: 200px" name="info"></textarea>
                        <label for="floatingTextarea">Comments</label>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="text-center" colspan="2">
                    <input type="submit" class="btn btn-primary" value="회원가입">
                    <input type="reset" class="btn btn-primary" value="취소">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
