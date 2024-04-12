<%@ page import="model.MemberDAO" %>
<%@ page import="model.MemberBean" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-04-08
  Time: 오전 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원 상세 정보</title>
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
        <h2>회원 정보 보기</h2>
    </div>
    <table class="table table-striped">
        <tr>
            <td>아이디</td>
            <td><%= memberBean.getId() %></td>
        </tr>
        <tr>
            <td>이메일</td>
            <td><%= memberBean.getEmail() %></td>
        </tr>
        <tr>
            <td>전화</td>
            <td><%= memberBean.getTel() %></td>
        </tr>
        <tr>
            <td>취미</td>
            <td><%= memberBean.getHobby() %></td>
        </tr>
        <tr>
            <td>직업</td>
            <td><%= memberBean.getJob() %></td>
        </tr>
        <tr>
            <td>나이</td>
            <td><%= memberBean.getAge() %></td>
        </tr>
        <tr>
            <td>정보</td>
            <td><%= memberBean.getInfo() %></td>
        </tr>
    </table>
</div>
<div class="container text-center">
    <button type="button" class="btn btn-primary" onclick="location.href='MemberUpdateForm.jsp?id=<%=memberBean.getId()%>'">회원수정</button>
    <button type="button" class="btn btn-primary" onclick="location.href='MemberDeleteForm.jsp?id=<%=memberBean.getId()%>'">회원삭제</button>
    <button type="button" class="btn btn-primary" onclick="location.href='MemberList.jsp'">목록보기</button>
    <button type="button" class="btn btn-primary" onclick="location.href='MemberJoin.jsp'">회원가입</button>
</div>
</body>
</html>
