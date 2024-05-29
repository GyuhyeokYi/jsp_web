<%@ page import="db.CarReserveBean" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-28
  Time: 오후 3:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<jsp:useBean id="rbean" class="db.CarReserveBean">
    <jsp:setProperty name="rbean" property="*" />
</jsp:useBean>
<%
    String id = (String) session.getAttribute("id");

    if (id == null) {
        session.setAttribute("lastPage", "CarReserveResult.jsp");
        session.setAttribute("carReserveBean", rbean);
%>
<script>
    alert("로그인후 예약이 가능합니다.")
    window.location.href = "RentcarMain.jsp?center=Login.jsp"
</script>
<%
    } else {
        session.setAttribute("lastPage", null);
        if (rbean.getRentalDate() == null) {
            rbean = (CarReserveBean) session.getAttribute("carReserveBean");
        }
    }
%>
<%= rbean.getRentalDate() %>
</body>
</html>
