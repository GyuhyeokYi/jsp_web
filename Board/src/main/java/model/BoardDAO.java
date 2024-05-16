package model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {

    Connection con; // 데이터베이스에 접근할 수 있도록 설정
    ResultSet resultSet; // 쿼리의 결과를 리턴 받아 자바에 저장해주는 객체

    public void getCon() {
        // 커넥션풀을 이용함.
        try {
            Context context = new InitialContext();
            DataSource dataSource = (DataSource) context.lookup("java:comp/env/jdbc/pool");
            con = dataSource.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean insertBoard(BoardBean board) {
        try {
            getCon();

            int re_step = 1;
            int re_level = 1;

            String sql = "insert into board values(BOARD_SEQ.nextval, ?, ?, ?, ?, SYSDATE," +
                    " (SELECT NVL(MAX(A.REF), 0) + 1 FROM BOARD A)" +
                    ", ?, ?, 0, ?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, board.getWriter());
            stmt.setString(2, board.getEmail());
            stmt.setString(3, board.getSubject());
            stmt.setString(4, board.getPassword());
            stmt.setInt(5, re_step);
            stmt.setInt(6, re_level);
            stmt.setString(7, board.getContent());

            stmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return  false;
    }

    public int testCon() {
        try {
            getCon();

            String sql = "select count(*) from board";
            resultSet = con.prepareStatement(sql).executeQuery();

            if (resultSet.next()) {
                return resultSet.getInt(1);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public ArrayList<BoardBean> allSelectBorad() {
        ArrayList<BoardBean> list = new ArrayList<>();
        try {
            getCon();

            String sql = "SELECT A.*, CASE WHEN (SYSDATE - A.REG_DATE) <= 7 THEN 'Y' ELSE 'N' END AS NEW_YN " +
                    "FROM BOARD A ORDER BY A.NUM DESC";
            PreparedStatement stmt = con.prepareStatement(sql);
            resultSet = stmt.executeQuery();


            while (resultSet.next()) {
                BoardBean board = new BoardBean();
                board.setBoardData(resultSet);
                list.add(board);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addReadCount(String num) {
        try {
            getCon();

            String sql = "UPDATE BOARD SET READCOUNT = READCOUNT + 1 WHERE NUM = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, num);
            stmt.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
