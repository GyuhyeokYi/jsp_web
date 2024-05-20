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
    PreparedStatement stmt;
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
                    ", ?, ?, 0, ?, SYSDATE)";
            stmt = con.prepareStatement(sql);
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

    public BoardBean getOneBoard(int num) {
        getCon();
        try {
            String updatesql = "UPDATE BOARD SET READCOUNT = READCOUNT + 1 WHERE NUM = ?";
            stmt = con.prepareStatement(updatesql);
            stmt.setInt(1, num);
            stmt.executeUpdate();

            String sql = "SELECT * FROM BOARD WHERE NUM = ?";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, num);
            resultSet = stmt.executeQuery();
            BoardBean board = new BoardBean();
            if (resultSet.next()) {
                board.setBoardData(resultSet);
            }

            con.close();
            return board;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<BoardBean> getAllBoard(int startRow, int endRow) {
        ArrayList<BoardBean> list = new ArrayList<>();
        getCon();
        try {
//            String sql = "SELECT A.*, CASE WHEN (SYSDATE - A.REG_DATE) <= 7 THEN 'Y' ELSE 'N' END AS NEW_YN " +
//                    "FROM BOARD A ORDER BY A.NUM DESC";
            String sql = "SELECT * FROM (SELECT A.*, ROWNUM AS RNUM FROM (SELECT *  FROM BOARD ORDER BY REF DESC, RE_STEP ASC, RE_LEVEL ASC) A) "
                    + "WHERE RNUM >= ? AND RNUM <= ?";

            stmt = con.prepareStatement(sql);
            stmt.setInt(1, startRow);
            stmt.setInt(2, endRow);
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

    public void addReadCount(int num) {
        getCon();

        try {
            String sql = "UPDATE BOARD SET READCOUNT = READCOUNT + 1 WHERE NUM = ?";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, num);
            stmt.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean reWriteBoard(BoardBean board) {
        getCon();
        int ref = board.getRef();
        int re_step = board.getRe_step();
        int re_level = board.getRe_level();

        try {
            // RE_LEVEL 부모글 보다 큰것을 모두 1씩 증가
            String levelsql = "UPDATE BOARD SET RE_LEVEL = RE_LEVEL + 1 WHERE REF = ? AND RE_LEVEL > ?";
            stmt = con.prepareStatement(levelsql);
            stmt.setInt(1, ref);
            stmt.setInt(2, re_level);
            stmt.executeUpdate();

            // 답변글 저장, RE_STEP 1 증가,
            String sql = "insert into board values(BOARD_SEQ.nextval, ?, ?, ?, ?, SYSDATE, ?, ?, ?, 0, ?, SYSDATE)";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, board.getWriter());
            stmt.setString(2, board.getEmail());
            stmt.setString(3, board.getSubject());
            stmt.setString(4, board.getPassword());
            stmt.setInt(5, ref);
            stmt.setInt(6, re_step + 1); // 답글이기에 부모글에 1에 더해준다.
            stmt.setInt(7, re_level + 1);
            stmt.setString(8, board.getContent());
            stmt.executeUpdate();

            con.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return  false;
    }

    public BoardBean getOneUpdateBoard(int num) {
        getCon();
        try {
            String sql = "SELECT * FROM BOARD WHERE NUM = ?";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, num);
            resultSet = stmt.executeQuery();
            BoardBean board = new BoardBean();
            if (resultSet.next()) {
                board.setBoardData(resultSet);
            }

            con.close();
            return board;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateBoard(BoardBean board) {
        getCon();
        try {
            String sql = "UPDATE BOARD SET SUBJECT = ?, CONTENT = ?, MODI_DATE = SYSDATE WHERE NUM = ?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, board.getSubject());
            stmt.setString(2, board.getContent());
            stmt.setInt(3, board.getNum());
            stmt.executeUpdate();

            String maxsql = "SELECT MAX(REF) FROM BOARD";
            stmt = con.prepareStatement(maxsql);
            resultSet = stmt.executeQuery();
            int maxRef = 0;
            if (resultSet.next()) {
                maxRef = resultSet.getInt(1);
            }

            if (maxRef > board.getRef() && 1 == board.getRe_step()) {
                String upmaxsql = "UPDATE BOARD SET REF = ? WHERE REF = ?";
                stmt = con.prepareStatement(upmaxsql);
                stmt.setInt(1, maxRef + 1);
                stmt.setInt(2, board.getRef());
                stmt.executeUpdate();
            }

            con.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public String getPass(int num) {
        String pass = "";
        getCon();
        try {
            String sql = "SELECT PASSWORD FROM BOARD WHERE NUM = ?";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, num);
            resultSet = stmt.executeQuery();

            if (resultSet.next()) {
                pass =  resultSet.getString(1);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pass;
    }

    public boolean deleteBoard(BoardBean board) {
        getCon();
        try {
            String sql = "DELETE FROM BOARD WHERE NUM = ?";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, board.getNum());
            stmt.executeUpdate();
            con.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public int getAllCount() {
        getCon();
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) FROM BOARD";
            stmt = con.prepareStatement(sql);
            resultSet = stmt.executeQuery();
            if (resultSet.next()) {
                count = resultSet.getInt(1);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
}
