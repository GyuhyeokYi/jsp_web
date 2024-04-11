<%@ page import="model.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-04-09
  Time: 오후 4:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<jsp:useBean id="mbean" class="model.MemberBean">
    <jsp:setProperty name="mbean" property="*" /> <!-- 데이터 매핑 -->
</jsp:useBean>
<%
    String id = request.getParameter("id");
    MemberDAO memberDAO = new MemberDAO();

    String pass = memberDAO.getPass(id);

    if (mbean.getPass1().equals(pass)) {
        int result = memberDAO.updateMember(mbean);
        if (result > 0) {%>
<script>
    alert("회원정보 수정을 성공하였습니다.")
    location.href = 'MemberList.jsp'
</script>
<%
        } else {
%>
<script>
    alert("회원정보 수정을 실패하였습니다.")
    window.history.back()
</script>
<%
        }
    } else {
%>
    <script>
        alert("패스워드가 맞지 않습니다. 다시 확인 해주세요.")
        window.history.back()
    </script>
<%
    }
%>
</body>
</html>
