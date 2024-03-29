<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-03-14
  Time: 오전 11:51
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
<!-- Top -->
<div class="flex">
    <table style="width: 100%">
        <tr style="height: auto">
            <!-- 로고 이미지 -->
            <td colspan="2" style="text-align: center;">
                <img alt="로고"  src="img/log.jpg" style="width: 200px; height: auto; object-fit: cover;">
            </td>
            <td colspan="5" style="text-align: center; font-size: 3rem;">
                낭만 캠핑
            </td>
        </tr>
        <tr style="height: 50px">
            <td style="text-align: center; width: 110px;">텐트</td>
            <td style="text-align: center; width: 110px;">의자</td>
            <td style="text-align: center; width: 110px;">식기류</td>
            <td style="text-align: center; width: 110px;">침낭</td>
            <td style="text-align: center; width: 110px;">테이블</td>
            <td style="text-align: center; width: 110px;">화롯대</td>
            <td style="text-align: center; width: 110px;"><strong><%= request.getParameter("id") %></strong>님</td>
        </tr>
    </table>
</div>
</body>
</html>
