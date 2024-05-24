<%@ page import="db.RentcarDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.CarListBean" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-24
  Time: 오후 4:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    int category = Integer.parseInt(request.getParameter("category"));

    RentcarDAO rdao = new RentcarDAO();
    ArrayList<CarListBean> list = rdao.getCategoryCar(category);
%>
<div class="container text-center">
    <table class="table text-center table-borderless">
        <colgroup>
            <col style="width: 33%;">
            <col style="width: 33%;">
            <col style="width: 33%;">
        </colgroup>
        <%
            int col = 3;
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
