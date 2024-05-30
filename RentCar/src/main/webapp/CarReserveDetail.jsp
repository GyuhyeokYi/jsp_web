<%@ page import="db.RentcarDAO" %>
<%@ page import="db.CarReserveBean" %>
<%@ page import="java.text.NumberFormat" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-30
  Time: 오후 2:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    .carImg {
        height: 100% !important;
    }
    tr td:nth-child(1) {
        text-align: center;
    }
</style>
<body>
<%
    int reserveNo = Integer.parseInt(request.getParameter("reserveNo"));
    RentcarDAO rdao = new RentcarDAO();
    CarReserveBean rbean = rdao.getCarReserveOne(reserveNo);
%>
<div class="container text-center">
    <form action="CarReserveCancel.jsp" method="post">
        <table class="table table-borderless align-middle">
            <colgroup>
                <col style="width: 50%;">
                <col style="width: 25%;">
                <col style="width: 25%;">
            </colgroup>
            <tr>
                <td colspan="3"><div style="color: gray; font-size: 2rem;">차량 예약 정보</div></td>
            </tr>
            <tr>
                <td rowspan="9">
                    <img alt="차량이미지" class="carImg" src="img/<%= rbean.getCar().getImg() %>">
                </td>
                <td style="text-align: center">차량이름</td>
                <td><%= rbean.getCar().getName() %></td>
            </tr>
            <tr>
                <td>대여기간</td>
                <td><%= rbean.getRentalPeriod() %></td>
            </tr>
            <tr>
                <td>대여일</td>
                <td><%= rbean.getRentalDate() %></td>
            </tr>
            <tr>
                <td>보험</td>
                <td><%= rbean.getUseInsurance() == 1 ? "적용 (1일 1만원)": "비적용" %></td>
            </tr>
            <tr>
                <td>Wifi 사용</td>
                <td><%= rbean.getUseWifi() == 1 ? "적용 (1일 1만원)": "비적용" %></td>
            </tr>
            <tr>
                <td>네비게이션</td>
                <td><%= rbean.getUseNavi() == 1 ? "적용 (무료)": "비적용" %></td>
            </tr>
            <tr>
                <td>베이비시트 적용</td>
                <td><%= rbean.getUseSeat() == 1 ? "적용 (1일 1만원)": "비적용" %></td>
            </tr>
            <tr>
                <td>대여 금액</td>
                <td><%= NumberFormat.getInstance().format(rbean.calculateRentalPrice(rbean.getCar().getPrice())) %>원</td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="hidden" name="reserveNo" value="<%= reserveNo %>">
                    <button type="button" class="btn btn-dark no-radius" onclick="window.history.back()">예약목록</button>
                    <button type="submit" class="btn btn-dark no-radius">예약취소</button>
                </td>
            </tr>
        </table>
    </form>

</div>
</body>
</html>
