<%--
  Created by IntelliJ IDEA.
  User: kalit
  Date: 2024-03-26
  Time: 오후 4:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<h2>회원 정보 보기</h2>
<jsp:useBean id="mbean" class="bean.MemberBean"><!-- 객체생성 MemberBean mbean = new MemberBean() -->
<!-- JSP 내용을 자바빈 클래스(MemberBean)에 데이터 매핑 -->
    <jsp:setProperty name="mbean" property="*" />
</jsp:useBean>

<h2>당신의 아이디 <jsp:getProperty name="mbean" property="id"/></h2>
<h2>당신의 패스 <jsp:getProperty name="mbean" property="pass1"/></h2>
<h2>당신의 이메일 <jsp:getProperty name="mbean" property="email"/></h2>
<h2>당산의 전화는 <%= mbean.getTel() %></h2>
</body>
</html>
