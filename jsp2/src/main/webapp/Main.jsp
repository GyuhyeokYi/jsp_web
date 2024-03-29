<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-03-15
  Time: 오후 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<div style="display: flex; justify-content: center">
    <table style="border: 1px solid black; width: 800px">
        <!-- Top -->
        <tr>
            <td colspan="2" style="border: 1px solid black;">
                <jsp:include page="Top.jsp">
                    <jsp:param name="id" value="이규혁"/>
                </jsp:include>
            </td>
        </tr>

        <tr style="height: 400px;">
            <!-- Left -->
            <td  style="width: 200px; border: 1px solid black;">
                <jsp:include page="Left.jsp"/>
            </td>

            <!-- Center -->
            <td style="width: 600px; border: 1px solid black;">
                <jsp:include page="Center.jsp"/>
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
