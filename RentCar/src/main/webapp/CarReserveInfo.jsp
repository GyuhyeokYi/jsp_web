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
    String[] categoryNames = {"소형", "중형", "대형"};
    int no = Integer.parseInt(request.getParameter("no"));
    RentcarDAO rdao = new RentcarDAO();
    CarListBean car = rdao.getOneCar(no);
%>
<div class="container text-center">
    <form action="RentcarMain.jsp?center=CarOptionSelect.jsp" method="post">
        <table class="table table-borderless align-middle">
            <colgroup>
                <col style="width: 50%;">
                <col style="width: 25%;">
                <col style="width: 25%;">
            </colgroup>
            <tr>
                <td colspan="3"><div style="color: gray; font-size: 2rem;"><%= car.getName()%> 차량 선택</div></td>
            </tr>
            <tr>
                <td rowspan="6">
                    <img alt="차량이미지" class="carImg" src="img/<%= car.getImg() %>">
                </td>
                <td style="text-align: center">차량이름</td>
                <td><%= car.getName() %></td>
            </tr>
            <tr>
                <td>차량수량</td>
                <td>
                    <select style="width: auto;" class="form-select" name="qty">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>차량분류</td>
                <td><%= categoryNames[Integer.parseInt(car.getCategory()) - 1]%></td>
            </tr>
            <tr>
                <td>대여가격</td>
                <td><%= car.getPrice() %></td>
            </tr>
            <tr>
                <td>제조회사</td>
                <td><%= car.getCompany() %></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="hidden" name="no" value="<%= car.getNo() %>">
                    <input type="hidden" name="img" value="<%= car.getImg() %>">
                    <button type="submit" class="btn btn-dark no-radius" >옵션선택 후, 렌트하기</button>
                </td>
            </tr>
        </table>
    </form>
    <div class="container text-center">
        <div style="color: gray; font-size: 1.5rem;">차량 정보보기</div>
        <p><%= car.getInfo() %></p>
    </div>
</div>
</body>
</html>
