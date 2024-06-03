<%@ page import="com.gnirfix.jsp3.FileUploader" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-06-03
  Time: 오후 3:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    String name = request.getParameter("name");
    String mesaage = "";
    try {
        // 클라이언트로부터 넘어운 데이터를 저장해주는 객체
        FileUploader fileUploader = new FileUploader();
        fileUploader.upload(request, response);
    } catch (Exception e) {
        e.printStackTrace();
        mesaage = e.getMessage();
    }
%>
<div>
    <%= name %>
</div>
<div>
    <%= mesaage %>
</div>
</body>
</html>
