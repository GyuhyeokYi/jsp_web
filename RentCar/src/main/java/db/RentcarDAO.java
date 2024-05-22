package db;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RentcarDAO {
    Connection con;
    PreparedStatement stmt;
    ResultSet resultSet;

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
}
