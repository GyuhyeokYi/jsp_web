<%@ page import="model.MemberDAO" %>
<%@ page import="model.MemberBean" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-04-09
  Time: 오후 3:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<%
    MemberDAO memberDAO = new MemberDAO();
    MemberBean memberBean = memberDAO.oneSelectMember(request.getParameter("id"));
%>
<div class="container">
    <div class="text-center">
        <h2>회원 정보 수정하기</h2>
    </div>
    <form action="MemberUpdateProc.jsp" method="post">
        <table class="table table-striped">
            <tr>
                <td>아이디</td>
                <td><input readonly type="text" class="form-control" name="id" value="<%= memberBean.getId() %>"></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input type="email" class="form-control" name="email" value="<%= memberBean.getEmail() %>"></td>
            </tr>
            <tr>
                <td>전화</td>
                <td><input type="tel" class="form-control" name="tel" value="<%= memberBean.getTel() %>"></td>
            </tr>
            <tr>
                <td>패스워드</td>
                <td><input type="password" class="form-control" name="pass1"></td>
            </tr>
            <tr>
                <td colspan="2" class="text-center">
                    <input type="submit" class="btn btn-primary" value="회원 수정하기">
                    <button type="button" class="btn btn-primary" onclick="location.href='MemberList.jsp'">회원 전체 보기</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
