<%@ page import="model.MemberDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.MemberBean" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-04-02
  Time: 오전 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<!--
1.데이터 베이스에서 모든 회원의 정보를 가져옴.
2. table 태그를 이용하여 화면에 회원들의 정보를 출력.
-->
<%
    MemberDAO memberDAO = new MemberDAO();
    ArrayList<MemberBean> members = memberDAO.allSelectMember();
%>
<div class="container text-center">
    <h2>모든 회원 보기, 회원 수(<%= members.size() %>)</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th class="text-center" scope="col">#</th>
            <th scope="col">아이디</th>
            <th scope="col">이메일</th>
            <th scope="col">전화번호</th>
            <th scope="col">취미</th>
            <th scope="col">가입일</th>
        </tr>
        </thead>
        <tbody>
        <%
            for(MemberBean member: members) {
        %>
        <tr>
            <th class="text-center" scope="row"><%= members.indexOf(member) + 1 %></th>
            <td><a href="MemberInfo.jsp?id=<%= member.getId() %>"><%= member.getId() %></a></td>
            <td><%= member.getEmail() %></td>
            <td><%= member.getTel() %></td>
            <td><%= member.getHobby() %></td>
            <td><%= member.getInstDtm() %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <button type="button" class="btn btn-primary" onclick="location.href='MemberJoin.jsp'">회원가입</button>
</div>
</body>
</html>
