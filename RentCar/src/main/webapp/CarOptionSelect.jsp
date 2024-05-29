<%@ page import="db.RentcarDAO" %>
<%@ page import="db.CarListBean" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-27
  Time: 오후 3:51
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
    int no = Integer.parseInt(request.getParameter("no"));
    int qty = Integer.parseInt(request.getParameter("qty"));
    String img = request.getParameter("img");
%>
<div class="container text-center">
    <form action="RentcarMain.jsp?center=CarReserveResult.jsp" method="post">
        <table class="table table-borderless align-middle">
            <colgroup>
                <col style="width: 50%;">
                <col style="width: 25%;">
                <col style="width: 25%;">
            </colgroup>
            <tr>
                <td colspan="3"><div style="color: gray; font-size: 2rem;">옵션 선택</div></td>
            </tr>
            <tr>
                <td rowspan="7">
                    <img alt="차량이미지" class="carImg" src="img/<%= img %>">
                </td>
                <td style="text-align: center">대여기간</td>
                <td>
                    <select style="width: auto;" class="form-select" name="rentalPeriod">
                        <% for (int i = 0; i < 7; i++) { %>
                        <option value="<%= i + 1%>"><%= i+ 1%>일</option>
                        <% } %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>대여일</td>
                <td><input type="date" class="form-control" name="rentalDate" style="width: auto;" required></td>
            </tr>
            <tr>
                <td>보험적용</td>
                <td>
                    <select style="width: auto;" class="form-select" name="useInsurance">
                        <option value="1">적용 (1일 1만원)</option>
                        <option value="2">비적용</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Wifi 적용</td>
                <td>
                    <select style="width: auto;" class="form-select" name="useWifi">
                        <option value="1">적용 (1일 1만원)</option>
                        <option value="2">비적용</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>네비게이션 적용</td>
                <td>
                    <select style="width: auto;" class="form-select" name="useNavi">
                        <option value="1">적용 (무료)</option>
                        <option value="2">비적용</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>베이비시트 적용</td>
                <td>
                    <select style="width: auto;" class="form-select" name="useSeat">
                        <option value="1">적용 (1일 1만원)</option>
                        <option value="2">비적용</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="hidden" name="no" value="<%= no %>">
                    <input type="hidden" name="qty" value="<%= qty %>">
                    <button type="submit" class="btn btn-dark no-radius">차량예악하기</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
