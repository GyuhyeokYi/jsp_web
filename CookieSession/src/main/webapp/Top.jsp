<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-10
  Time: 오후 3:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    .flex {
        display: flex;
        justify-content: center;
        background: url('img/log.jpg');
    }
</style>
<body>
<%
    String id = (String) session.getAttribute("id");

    if (id == null) {
        id = "게스트";
    }
%>
<!-- Top -->
<div class="flex">
    <table style="width: 100%">
        <tr style="height: auto">
            <!-- 로고 이미지 -->
            <td colspan="2" style="text-align: center;">
                <a href="SessionMain.jsp"><img alt="로고"  src="img/log.jpg" style="width: 200px; height: auto; object-fit: cover;"></a>
            </td>
            <td colspan="5" style="text-align: center; font-size: 3rem;">
                낭만 캠핑
            </td>
        </tr>
        <tr style="height: 50px">
            <td style="text-align: center; width: 100px;">텐트</td>
            <td style="text-align: center; width: 100px;">의자</td>
            <td style="text-align: center; width: 100px;">식기류</td>
            <td style="text-align: center; width: 100px;">침낭</td>
            <td style="text-align: center; width: 100px;">테이블</td>
            <td style="text-align: center; width: 100px;">화롯대</td>
            <td style="text-align: center; width: 200px;">
                <strong><%= id %></strong>님
            <%
                if (id.equals("게스트")) {
            %>
                <button class="btn btn-primary" onclick="location.href='SessionMain.jsp?center=SessionLoginForm.jsp'">로그인</button>
            <%
                } else {
            %>
                <button class="btn btn-primary" onclick="location.href='SessionLogout.jsp'">로그아웃</button>
            <%
                }
            %>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
