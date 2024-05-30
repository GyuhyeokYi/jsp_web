<%@ page import="db.RentcarDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.CarReserveBean" %>
<%@ page import="java.text.NumberFormat" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-30
  Time: 오후 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    String id = (String) session.getAttribute("id");
    if (id == null) {
        session.setAttribute("lastPage", "CarReserveConfirm.jsp");
%>
<script>
    alert("로그인후 예약확인 가능합니다.")
    window.location.href = "RentcarMain.jsp?center=Login.jsp"
</script>
<%
    }
    session.setAttribute("lastPage", null);
    RentcarDAO rdao = new RentcarDAO();
    ArrayList<CarReserveBean> list = rdao.getCarReserveList(id);
%>
<div class="container text-center">
    <table class="table text-center align-middle ">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">예약번호</th>
            <th scope="col">차량</th>
            <th scope="col">일자</th>
            <th scope="col">기간</th>
            <th scope="col">대수</th>
            <th scope="col">금액</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (CarReserveBean reserve : list) {
        %>
        <tr>
            <th scope="row"><%= list.indexOf(reserve) + 1 %></th>
            <td><a href="RentcarMain.jsp?center=CarReserveDetail.jsp&reserveNo=<%= reserve.getReserveNo() %>"><%= reserve.getReserveNo() %></a></td>
            <td><%= reserve.getCar().getName() %></td>
            <td><%= reserve.getRentalDate() %></td>
            <td><%= reserve.getRentalPeriod() %></td>
            <td><%= reserve.getQty() %></td>
            <td class="text-end"><%= NumberFormat.getInstance().format(reserve.calculateRentalPrice(reserve.getCar().getPrice())) %>원</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
