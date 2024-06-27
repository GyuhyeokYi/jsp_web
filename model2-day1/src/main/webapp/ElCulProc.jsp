<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-06-13
  Time: 오전 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<h2>결과보기</h2>
<div>
    <%
        String exp2 = request.getParameter("exp2");
        if (exp2.equals("+")) {
    %>
    결과는 ${param.exp1 + param.exp3}
    <%
    } else if (exp2.equals("-")) {
    %>
    결과는 ${param.exp1 + param.exp3}
    <%
    } else if (exp2.equals("*")) {
    %>
    결과는 ${param.exp1 * param.exp3}
    <%
    } else if (exp2.equals("/")) {
    %>
    결과는 ${param.exp1 / param.exp3}
    <%
        }
    %>
</div>

</body>
</html>
