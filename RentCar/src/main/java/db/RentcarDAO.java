package db;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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

    public ArrayList<CarListBean> getSelectCar() {
        ArrayList<CarListBean> list = new ArrayList<>();
        getCon();
        try {
            String sql = "SELECT * FROM RENT_CAR ORDER BY NO DESC";
            stmt = con.prepareStatement(sql);
            resultSet = stmt.executeQuery();

            int count = 0;
            while (resultSet.next()) {
                CarListBean bean = new CarListBean();
                bean.setCarListData(resultSet);
                list.add(bean);
                count++;
                if (count >= 3) {
                    con.close();
                    break;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<CarListBean> getCategoryCar(int category) {
        ArrayList<CarListBean> list = new ArrayList<>();
        getCon();
        try {
            String sql = "SELECT * FROM RENT_CAR WHERE CATEGORY = ?";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, category);
            resultSet = stmt.executeQuery();
            while (resultSet.next()) {
                CarListBean bean = new CarListBean();
                bean.setCarListData(resultSet);
                list.add(bean);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public ArrayList<CarListBean> getAllCar() {
        ArrayList<CarListBean> list = new ArrayList<>();
        getCon();
        try {
            String sql = "SELECT * FROM RENT_CAR";
            stmt = con.prepareStatement(sql);
            resultSet = stmt.executeQuery();
            while (resultSet.next()) {
                CarListBean bean = new CarListBean();
                bean.setCarListData(resultSet);
                list.add(bean);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public CarListBean getOneCar(int no) {
        CarListBean bean = new CarListBean();
        getCon();
        try {
            String sql = "SELECT * FROM RENT_CAR WHERE NO = ?";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, no);
            resultSet = stmt.executeQuery();
            if (resultSet.next()) {
                bean.setCarListData(resultSet);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bean;
    }
}
