<%@ page import="model.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-04-09
  Time: 오후 4:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>

<jsp:useBean id="mbean" class="model.MemberBean">
    <jsp:setProperty name="mbean" property="*" /> <!-- 데이터 매핑 -->
</jsp:useBean>
<%
    MemberDAO memberDAO = new MemberDAO();
    int result = memberDAO.updateMember(mbean);
%>
</body>
<div class="container text-center">
    <%
        if (result > 0) {
    %>
    <h2>회원수정 성공</h2>
    <script>
        setTimeout(() => {
            location.href = 'MemberList.jsp'
        }, 2000)
    </script>
    <%
    } else {
    %>
    <h2>회원수정 실패</h2>
    <script>
        setTimeout(() => {
            window.history.back()
        }, 2000)
    </script>
    <%
    }
    //    response.sendRedirect("MemberList.jsp");
    %>
</div>
</html>
