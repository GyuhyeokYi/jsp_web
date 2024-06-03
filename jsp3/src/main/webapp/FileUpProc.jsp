<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.nio.charset.StandardCharsets" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-06-03
  Time: 오후 5:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    String uploadYn = request.getParameter("uploadYn");
    String message = "";
    String fileName = request.getParameter("fileName");
    String fileNameBase64 = new String(Base64.getDecoder().decode(fileName), StandardCharsets.UTF_8);
    String fileNameUrl = URLDecoder.decode(fileNameBase64, StandardCharsets.UTF_8);

    if ("N".equals(uploadYn)) {
        message = "파일 업로드에 실패하였습니다.";
    } else {
        message = "파일 업로드에 성공하였습니다.";
    }
%>
<script>
    alert('<%= message %>')
    <%
    if (uploadYn.equals("N")) {
    %>
    window.history.back()
    <%
    }
    %>
</script>
<div class="container text-center">
    <p>파일이름: <%= fileNameUrl %></p>
</div>
</body>
</html>
