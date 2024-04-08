package model;

import java.sql.*;
import java.util.ArrayList;

// 오라클 연결하고 SELECT, INSERT, UPDATE, DELETE 업무 수행
public class MemberDAO {

    String id = "JSP_TEST";
    String pass = "12345";
    String url = "jdbc:oracle:thin:@localhost:1521:XE";
    Connection con; // 데이터베이스에 접근할 수 있도록 설정
    ResultSet resultSet; // 쿼리의 결과를 리턴 받아 자바에 저장해주는 객체

    public void getCon() {
        try {
            // 1.해당 데이터 베이스 사용한다고 선언(클래스=오라크용을 사용)
            Class.forName("oracle.jdbc.driver.OracleDriver");
            // 2.해당 데이터 베이스 접속
            con = DriverManager.getConnection(url, id, pass);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 데이터 베이스의 한사람의 회원 정보를 저장해주는 메소그
    public void insertMember(MemberBean mbean) {
        try {
            getCon();
            // 3.접속 후, 쿼리 준비 설정
            String sql = "INSERT INTO MEMBER VALUES(?, ?, ?, ?, ?, ?, ?, ?, SYSDATE)";

            // 쿼리를 실행시켜주는 객체
            PreparedStatement stmt = con.prepareStatement(sql);
            // ?에 맞게 데이터를 매핑
            stmt.setString(1, mbean.getId());
            stmt.setString(2, mbean.getPass1());
            stmt.setString(3, mbean.getTel());
            stmt.setString(4, mbean.getEmail());
            stmt.setString(5, mbean.getHobby());
            stmt.setString(6, mbean.getJob());
            stmt.setString(7, mbean.getAge());
            stmt.setString(8, mbean.getInfo());

            stmt.executeUpdate(); // insert, update, delete 시 사용하는 메소드

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<MemberBean> allSelectMember() {
        ArrayList<MemberBean> list = new ArrayList<>();
        try {
            getCon();

            String sql = "SELECT * FROM MEMBER ORDER BY INST_DTM";
            PreparedStatement stmt = con.prepareStatement(sql);
            resultSet =  stmt.executeQuery();

            while(resultSet.next()) {
                MemberBean memberBean = new MemberBean();
                memberBean.setId(resultSet.getString(1));
                memberBean.setTel(resultSet.getString(2));
                memberBean.setPass1(resultSet.getString(3));
                memberBean.setEmail(resultSet.getString(4));
                memberBean.setHobby(resultSet.getString(5));
                memberBean.setJob(resultSet.getString(6));
                memberBean.setAge(resultSet.getString(7));
                memberBean.setInfo(resultSet.getString(8));
                memberBean.setInstDtm(resultSet.getString(9));
                list.add(memberBean);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public MemberBean oneSelectMember(String id) {
        MemberBean memberBean = new MemberBean();

        try {
            getCon();

            String sql = "SELECT * FROM MEMBER WHERE ID = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, id);

            resultSet = stmt.executeQuery();

            if (resultSet.next()) {
                memberBean.setId(resultSet.getString(1));
                memberBean.setTel(resultSet.getString(2));
                memberBean.setPass1(resultSet.getString(3));
                memberBean.setEmail(resultSet.getString(4));
                memberBean.setHobby(resultSet.getString(5));
                memberBean.setJob(resultSet.getString(6));
                memberBean.setAge(resultSet.getString(7));
                memberBean.setInfo(resultSet.getString(8));
                memberBean.setInstDtm(resultSet.getString(9));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return memberBean;
    }
}
