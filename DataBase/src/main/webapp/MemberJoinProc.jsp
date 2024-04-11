<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="model.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-03-29
  Time: 오전 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    // 취미 부분을 별도로 처리 함.
    String[] hobby = request.getParameterValues("hobby");
    // 배열의 있는 내용을 하나의 스트링으로 저장
    StringBuilder textHobby = new StringBuilder();

    for (String s : hobby) {
        textHobby.append(s).append(" ");
    }
%>
<!-- useBean를 이용하여 한꺼번에 데이터를 받아옴 -->
<jsp:useBean id="mbean" class="model.MemberBean">
    <jsp:setProperty name="mbean" property="*" /> <!-- 데이터 매핑 -->
</jsp:useBean>

<%
    mbean.setHobby(textHobby.toString());
     if (mbean.getPass1().equals(mbean.getPass2())) {
         MemberDAO memberDAO = new MemberDAO();
         memberDAO.insertMember(mbean);
%>
<script>
    alert("회원가입에 성공하셨습니다.")
    window.location.href="MemberList.jsp"
</script>
<%
     } else {
%>
<script>
    alert("입력하신 비밀번호가 일치 하지 않습니다.")
    window.history.back()
</script>
<%
     }
%>
</body>
</html>
