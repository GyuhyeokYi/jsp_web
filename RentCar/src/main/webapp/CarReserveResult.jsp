<%@ page import="db.CarReserveBean" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="db.RentcarDAO" %>
<%@ page import="db.CarListBean" %>
<%@ page import="java.text.NumberFormat" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-28
  Time: 오후 3:11
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
<jsp:useBean id="rbean" class="db.CarReserveBean">
    <jsp:setProperty name="rbean" property="*" />
</jsp:useBean>
<%
    String id = (String) session.getAttribute("id");

    if (id == null) {
        session.setAttribute("lastPage", "CarReserveResult.jsp");
        session.setAttribute("carReserveBean", rbean);
%>
<script>
    alert("로그인후 예약이 가능합니다.")
    window.location.href = "RentcarMain.jsp?center=Login.jsp"
</script>
<%
        return;
    } else {
        session.setAttribute("lastPage", null);
        if (rbean.getRentalDate() == null) {
            rbean = (CarReserveBean) session.getAttribute("carReserveBean");
        }
    }

    // 날짜비교
    Date d1 = null;
    Date d2 = null;

    // 날짜를 포멧 해주는 클래스
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    try {
        d1 = sdf.parse(rbean.getRentalDate());
        d2 = sdf.parse(sdf.format(Calendar.getInstance().getTime()));
    } catch (ParseException e) {
        e.printStackTrace();
%>
<script>
    alert('시스템 처리 중 오류가 발생하였습니다. 잠시 후 다시 이용해주시기 바랍니다.')
    window.location.href = 'RentcarMain.jsp'
</script>
<%
        return;
    }

    int compare = d1.compareTo(d2);
    // 예약하려는 날짜보다 현재날짜가 크다면 -1
    // 예약하려는 날자와 현재날짜가 같다면 0
    // 예약하려는 날짜가 더 크다면 1을 리턴

    if (compare < 0) {
%>
<script>
    alert('현재 시스템 날짜보다 이전 날짜는 선택 할 수 없습니다.')
    window.history.back()
</script>
<%
        return;
    }
    rbean.setId(id);
    RentcarDAO rdao = new RentcarDAO();
    if (!rdao.setReserveCar(rbean)) {
%>
<script>
    alert('시스템 처리 중 오류가 발생하였습니다. 잠시 후 다시 이용해주시기 바랍니다.')
    window.location.href = 'RentcarMain.jsp'
</script>
<%
        return;
    }
    CarListBean car = rdao.getOneCar(rbean.getNo());
%>
<div class="container text-center">
    <table class="table table-borderless align-middle">
        <colgroup>
            <col style="width: 50%;">
            <col style="width: 25%;">
            <col style="width: 25%;">
        </colgroup>
        <tr>
            <td colspan="3"><div style="color: gray; font-size: 2rem;">차량 예약 완료 화면</div></td>
        </tr>
        <tr>
            <td rowspan="9">
                <img alt="차량이미지" class="carImg" src="img/<%= car.getImg() %>">
            </td>
            <td style="text-align: center">예약자 ID</td>
            <td><%= id %></td>
        </tr>
        <tr>
            <td>차량이름</td>
            <td><%= car.getName() %></td>
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
            <td><%= NumberFormat.getInstance().format(rbean.calculateRentalPrice(car.getPrice())) %>원</td>
        </tr>
    </table>
</div>
</body>
</html>
