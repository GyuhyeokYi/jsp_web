<%@ page import="db.RentcarDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.CarListBean" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-23
  Time: 오후 3:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    RentcarDAO rdao = new RentcarDAO();
    ArrayList<CarListBean> list = rdao.getSelectCar();
%>
<div class="center text-center">
    <table class="table text-center table-borderless">
        <tr>
            <%
                for (CarListBean car : list) {
            %>
            <td>
                <a href="RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%= car.getNo() %>"><img class="carImg" alt="" src="img/<%= car.getImg() %>"></a>
                <p class="text-center">차량명 : <%= car.getName() %></p>
            </td>
            <%
                }
            %>
        </tr>
    </table>
    <p>
        <strong>차량 검색 하기</strong>
    </p>
    <form action="RentcarMain.jsp?center=CarCategoryList.jsp" method="post">
        <div class="d-flex justify-content-center" style="grid-column-gap: 10px;">
            <select name="category" class="form-select" style="width: auto;">
                <option value="1">소형</option>
                <option value="2">중형</option>
                <option value="3">대형</option>
            </select>
            <button type="submit" class="btn btn-dark no-radius">검색</button>
            <button type="button" class="btn btn-dark no-radius" onclick="window.location.href='RentcarMain.jsp?center=CarAllList.jsp'">전체 검색</button>
        </div>
    </form>
</div>
</body>
</html>
