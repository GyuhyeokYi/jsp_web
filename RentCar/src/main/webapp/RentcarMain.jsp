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
    <title>렌트카메인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<style>
    .no-radius {
        border-radius: unset;
    }
    .carImg {
        width: 100%;
        height: 15rem;
        object-fit: cover;
    }
</style>
<body>
<%
    String center = request.getParameter("center");
    if (center == null) {
        center = "Center.jsp";
    }
%>
<table class="table table-borderless">
    <tr>
        <td><jsp:include page="Top.jsp"/></td>
    </tr>
    <tr>
        <td><jsp:include page="<%= center %>"/></td>
    </tr>
    <tr>
        <td><jsp:include page="Bottom.jsp"/></td>
    </tr>
</table>
</body>
</html>
