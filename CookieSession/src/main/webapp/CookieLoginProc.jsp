<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-04-30
  Time: 오전 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    // 쿠키클래스 생성
    String save = request.getParameter("save");
    String id = request.getParameter("id");

    if ("Y".equals(save)) {
        Cookie cookie = new Cookie("id", id);
        // 쿠키 유효시간 설정
        cookie.setMaxAge(60 * 10); // 10분가 유효

        // 사용자에게 쿠키 값을 넘겨 줌.
        response.addCookie(cookie);
%>
<p>쿠키 생성 완료</p>
<%
    } else {
        Cookie cookie = new Cookie("id", null);
        cookie.setMaxAge(0);
        response.addCookie(cookie);
%>
<p>쿠키 삭제됨</p>
<%
    }
%>
</body>
</html>
