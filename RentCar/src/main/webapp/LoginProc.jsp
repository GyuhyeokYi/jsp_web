<%@ page import="db.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-22
  Time: 오후 5:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<jsp:useBean id="mbean" class="db.MemberBean">
    <jsp:setProperty name="mbean" property="*" />
</jsp:useBean>
<%
    MemberDAO memberDAO = new MemberDAO();
    String pass = memberDAO.getPass(mbean.getId());

    if (mbean.getPass1().equals(pass)) {
        session.setAttribute("id", mbean.getId());
        response.sendRedirect("RentcarMain.jsp");
    } else {
%>
<script>
    alert('로그인에 실패하였습니다.')
    window.history.back()
</script>
<%
    }
%>
</body>
</html>
