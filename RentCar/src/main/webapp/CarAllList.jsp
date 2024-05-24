<%@ page import="db.RentcarDAO" %>
<%@ page import="db.CarListBean" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-24
  Time: 오후 5:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    RentcarDAO rdao = new RentcarDAO();
    ArrayList<CarListBean> list = rdao.getAllCar();
%>
<div class="container text-center">
    <table class="table text-center table-borderless">
        <colgroup>
            <col style="width: 25%;">
            <col style="width: 25%;">
            <col style="width: 25%;">
            <col style="width: 25%;">
        </colgroup>
        <%
            int col = 4;
            for (CarListBean car: list) {
                if (list.indexOf(car) % col == 0) {
        %>
        <tr>
            <%
                }
            %>
            <td>
                <a href="RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%= car.getNo() %>"><img class="carImg" alt="" src="img/<%= car.getImg() %>"></a>
                <p class="text-center">차량명 : <%= car.getName() %></p>
            </td>
            <%
                if (list.indexOf(car) % col == col - 1) {
            %>
        </tr>
        <%
                }
            }
        %>
    </table>
</div>
</body>
</html>
