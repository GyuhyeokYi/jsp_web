<%@ page import="db.RentcarDAO" %>
<%@ page import="db.CarListBean" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-24
  Time: 오후 5:44
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
    RentcarDAO rdao = new RentcarDAO();
    CarListBean car = rdao.getCar(no);
%>
<div class="container text-center">
    <table class="table table-borderless">
        <colgroup>
            <col style="width: 30%;">
            <col style="width: 70%;">
        </colgroup>
        <tr>
            <td>차량명</td>
            <td><%= car.getName() %></td>
        </tr>
        <tr>
            <td>타입</td>
            <td><%= car.getCategory() %></td>
        </tr>
        <tr>
            <td>가격</td>
            <td><%= car.getPrice() %>원</td>
        </tr>
        <tr>
            <td>탑승인원</td>
            <td><%= car.getUsePeople() %></td>
        </tr>
        <tr>
            <td>사진</td>
            <td><img class="carImg" alt="" src="img/<%= car.getImg() %>"></td>
        </tr>
        <tr>
            <td>설명</td>
            <td><%= car.getInfo() %></td>
        </tr>
    </table>
</div>
</body>
</html>
