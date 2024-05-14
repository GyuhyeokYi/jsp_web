<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-05-10
  Time: 오후 2:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>메인화면</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<%
    // Center값을 변경해주시 위해서 request객체를 이용하여 center값을 받아옴.
    String center = request.getParameter("center");

    // 처음 SessionMain.jsp를 실행하면 null 값이 실행되기 때문에 null 처리
    if (center == null) {
        center = "Center.jsp";
    }
%>
<div style="display: flex; justify-content: center">
    <table style="border: 1px solid black; width: 800px">
        <!-- Top -->
        <tr>
            <td colspan="2" style="border: 1px solid black;">
                <jsp:include page="Top.jsp"/>
            </td>
        </tr>

        <tr style="height: 400px;">
            <!-- Left -->
            <td  style="width: 200px; border: 1px solid black;">
                <jsp:include page="Left.jsp"/>
            </td>

            <!-- Center -->
            <td style="border: 1px solid black; text-align: center">
                <jsp:include page="<%= center %>"/>
            </td>
        </tr>

        <!-- Bottom -->
        <tr style="height: 200px;">
            <td colspan="2" style="border: 1px solid black;">
                <jsp:include page="Bottom.jsp"/>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
