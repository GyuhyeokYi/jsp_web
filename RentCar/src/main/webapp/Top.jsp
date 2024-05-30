<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-21
  Time: 오후 4:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>상단</title>
</head>
<style>
    .menu {
        background: red !important;
    }
    .menu:hover {
        background: blue !important;
    }
    .menu a {
        text-decoration: none;
        color: white;
    }
</style>
<body>
<%
    String id = (String) session.getAttribute("id");

    if (id == null) {
        id = "GUEST";
    }
%>
<script>
    function openloginpopup() {
        const id =  prompt('아이디를 입력해주세요!');
        const pass = prompt('패스워드를 입력해주세요!');
        if (pass === '1234') {
            location.href = 'LoginProc.jsp?id=' + id;
        }
    }
    function openLogoutPopup() {
        const logout = confirm('로그아웃 하시겠습니까?')
        if (logout) {
            location.href = 'LogoutProc.jsp';
        }
    }
</script>
    <table class="table text-center align-middle">
        <colgroup>
            <col style="width: 20%;">
            <col style="width: 20%;">
            <col style="width: 20%;">
            <col style="width: 20%;">
            <col style="width: 20%;">
        </colgroup>
        <tr>
            <td colspan="2" class="text-start"><a href="RentcarMain.jsp"><img src="./img/RENT.png" alt="로고" style="height: 65px;"></a></td>
            <td colspan="3" class="text-end">
                <strong><%= id %></strong>님 반갑습니다.&nbsp;
                <%
                    if ("GUEST".equals(id)) {
                %>
                <button type="button" class="btn btn-dark btn-sm no-radius" onclick="window.location.href='RentcarMain.jsp?center=Login.jsp'">로그인</button>
                <%
                    } else {
                %>
                <button type="button" class="btn btn-dark btn-sm no-radius" onclick="openLogoutPopup()">로그아웃</button>
                <%
                    }
                %>

            </td>
        </tr>
        <tr style="border-radius: 8px;">
            <td class="menu"><strong><a href="RentcarMain.jsp?center=CarReserveMain.jsp">예약하기</a></strong></td>
            <td class="menu"><strong><a href="RentcarMain.jsp?center=CarReserveConfirm.jsp">예약확인</a></strong></td>
            <td class="menu"><strong><a href="#">자유게시판</a></strong></td>
            <td class="menu"><strong><a href="#">이벤트</a></strong></td>
        <td class="menu"><strong><a href="#">고객센터</a></strong></td>
        </tr>
    </table>

</body>
</html>
