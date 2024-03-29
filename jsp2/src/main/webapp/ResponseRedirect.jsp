<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-03-18
  Time: 오후 4:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    .txt {
        color: red;
        font-weight: 900;
        font-size: 30px;
    }
    .txt.id {
        color: blue;
    }
</style>
<body>
<h2>
    ResponseRedirect.jsp 페이지입니다.
</h2>
<%
    String id = request.getParameter("id");
    String phone = request.getParameter("phone");
%>
<h3>아이디 <span class="txt id"><%= id %></span> 입니다.</h3>
<h3>전화번호 <span class="txt"><%= phone %></span> 입니다.</h3>
</body>
</html>
