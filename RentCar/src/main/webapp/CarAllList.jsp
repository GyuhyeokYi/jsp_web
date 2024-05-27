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
            <col style="width: calc(100% / 3);">
            <col style="width: calc(100% / 3);">
            <col style="width: calc(100% / 3);">
        </colgroup>
        <tr>
            <td colspan="3">
                <div style="color: gray; font-size: 2rem;">전체 렌트가 보기</div>
            </td>
        </tr>
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
            }
        %>
    </table>
    <div class="container text-center">
        <button type="button" class="btn btn-dark no-radius" onclick="window.history.back()">이전으로</button>
    </div>
</div>
</body>
</html>
