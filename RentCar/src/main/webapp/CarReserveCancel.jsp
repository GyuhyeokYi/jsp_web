<%@ page import="db.RentcarDAO" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-30
  Time: 오후 3:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<script>
    const isCancel = confirm('자동차 대여를 취소 하기겠습까?')
    if (isCancel) {
        <%
        String reserveNo = request.getParameter("reserveNo");
        RentcarDAO rdao = new RentcarDAO();
        rdao.deleteCarReserve(reserveNo);
        %>
        window.location.href = 'RentcarMain.jsp?center=CarReserveConfirm.jsp'
    } else {
        window.history.back()
    }
</script>
</body>
</html>
