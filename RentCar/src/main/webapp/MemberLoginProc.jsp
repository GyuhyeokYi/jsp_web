<%@ page import="db.RentcarDAO" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-29
  Time: 오후 3:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    String id = request.getParameter("id");
    String pass1 = request.getParameter("pass1");

    RentcarDAO rdao = new RentcarDAO();

    int result = rdao.getMember(id, pass1);

    if (result == 0) {
%>
<script>
    alert("회원 아이디 또는 패스워드가 틀립니다.")
    location.href = 'RentcarMain.jsp?center=Login.jsp'
</script>
<%
    } else {
        session.setAttribute("id", id);

        StringBuilder pageName = new StringBuilder("RentcarMain.jsp");
        String lastPage = (String) session.getAttribute("lastPage");

        if (lastPage != null) {
            pageName.append("?center=").append(lastPage);
        }
        response.sendRedirect(pageName.toString());
    }
%>
</body>
</html>
