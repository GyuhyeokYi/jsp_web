<%@ page import="db.RentcarDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="db.CarReserveBean" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="db.Pagination" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-30
  Time: 오후 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    .page p a {
        text-decoration: none;
    }
    .carImg {
        width: 100%;
        height: 100%;
    }
</style>
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

    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }

    // 현재 보고자하는 페이지 숫자를 저장
    int currentPage = Integer.parseInt(pageNum);

    RentcarDAO rdao = new RentcarDAO();

    int count = rdao.getAllCount(id);
    int paeSize = 5;
    int pageBlock = 7;
    Pagination pagi = new Pagination(count, currentPage, paeSize, pageBlock);
    ArrayList<CarReserveBean> list = rdao.getCarReserveList(id, pagi.getStartRow(), pagi.getEndRow());
%>
<div class="container text-center">
    <table class="table text-center align-middle ">
        <colgroup>
            <col style="width: auto">
            <col style="width: 10%">
            <col style="width: auto">
        </colgroup>
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">차량이미지</th>
            <th scope="col">예약번호</th>
            <% if ("admin".equals(id)) { %>
            <th scope="col">예약자</th>
            <% } %>
            <th scope="col">예약일</th>
            <th scope="col">차량명</th>
            <th scope="col">일자</th>
            <th scope="col">기간</th>
            <th scope="col">대수</th>
            <th scope="col">금액</th>
            <th scope="col">삭제</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (CarReserveBean reserve : list) {
        %>
        <tr>
            <th scope="row"><%= pagi.getNumber() - list.indexOf(reserve) %></th>
            <td><img alt="차량이미지" class="carImg" src="img/<%= reserve.getCar().getImg() %>"></td>
            <td><a href="RentcarMain.jsp?center=CarReserveDetail.jsp&reserveNo=<%= reserve.getReserveNo() %>"><%= reserve.getReserveNo() %></a></td>
            <% if ("admin".equals(id)) { %>
            <td><%= reserve.getId() %></td>
            <% } %>
            <td><%= reserve.getInstDtm() %></td>
            <td><%= reserve.getCar().getName() %></td>
            <td><%= reserve.getRentalDate() %></td>
            <td><%= reserve.getRentalPeriod() %></td>
            <td><%= reserve.getQty() %></td>
            <td class="text-end"><%= NumberFormat.getInstance().format(reserve.calculateRentalPrice(reserve.getCar().getPrice())) %>원</td>
            <td><button type="button" class="btn btn-dark no-radius" onclick="window.location.href='CarReserveCancel.jsp?reserveNo=<%= reserve.getReserveNo() %>'">삭제</button></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <div class="container page">
        <p>
            <%
                if (pagi.getCount() > 0) {
                    // 이전이라는 링크를 만들건지 파악
                    if (pagi.getPreviousPage() > 0) {
            %>
            <a href="RentcarMain.jsp?center=CarReserveConfirm.jsp&pageNum=<%= pagi.getPreviousPage() %>"> [이전] </a>
            <%
                }
                for (int i = pagi.getStartPage(); i <= pagi.getEndPage(); i++) {
                    if ( i == pagi.getCurrentPage()) {
            %>
            <a href="RentcarMain.jsp?center=CarReserveConfirm.jsp?pageNum=<%= i %>"> <strong>[<%= i %>]</strong> </a>
            <%
            } else {
            %>
            <a href="RentcarMain.jsp?center=CarReserveConfirm.jsp?pageNum=<%= i %>"> [<%= i %>] </a>
            <%
                    }
                }
                // 다음이라는 링크를 만들건지 파악
                if (pagi.getNextPage() > 0) {
            %>
            <a href="RentcarMain.jsp?center=CarReserveConfirm.jsp?pageNum=<%= pagi.getNextPage() %>"> [다음] </a>
            <%
                    }
                }
            %>
        </p>
    </div>
</div>
</body>
</html>
