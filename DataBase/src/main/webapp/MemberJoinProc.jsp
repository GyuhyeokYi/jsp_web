<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %><%--
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

    String id = "JSP_TEST";
    String pass = "12345";
    String url = "jdbc:oracle:thin:@localhost:1521:XE";

    try {
        // 1.해당 데이터 베이스 사용한다고 선언(클래스=오라크용을 사용)
        Class.forName("oracle.jdbc.driver.OracleDriver");
        // 2.해당 데이터 베이스 접속
        Connection con = DriverManager.getConnection(url, id, pass);
        // 3.접속 후, 쿼리 준비 설정
        String sql = "INSERT INTO MEMBER VALUES(?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement pstmt = con.prepareStatement(sql);
        // ?에 맞게 데이터를 매핑
        pstmt.setString(1, mbean.getId());
        pstmt.setString(2, mbean.getTel());
        pstmt.setString(3, mbean.getPass1());
        pstmt.setString(4, mbean.getEmail());
        pstmt.setString(5, mbean.getHobby());
        pstmt.setString(6, mbean.getJob());
        pstmt.setString(7, mbean.getAge());
        pstmt.setString(8, mbean.getInfo());

        pstmt.executeUpdate(); // insert, update, delete 시 사용하는 메소드

        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

오라클 접속 완료

</body>
</html>
