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

    public int getMember(String id, String pass1) {
        int result = 0;
        getCon();

        try {
            String sql = "SELECT COUNT(*) FROM MEMBER WHERE ID = ? AND PASS1 = ?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, id);
            stmt.setString(2, pass1);
            resultSet = stmt.executeQuery();
            if (resultSet.next()) {
                result = resultSet.getInt(1);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return  result;
    }

    public boolean setReserveCar(CarReserveBean rbean) {
        getCon();

        int reserveNo = 0;
        try {
            String sql = "INSERT INTO CAR_RESERVE VALUES(CAR_RESERVE_SEQ.nextVal,?,?,?,?,?,?,?,?,?)";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, rbean.getNo());
            stmt.setString(2, rbean.getId());
            stmt.setInt(3, rbean.getQty());
            stmt.setInt(4, rbean.getRentalPeriod());
            stmt.setString(5, rbean.getRentalDate());
            stmt.setInt(6, rbean.getUseInsurance());
            stmt.setInt(7, rbean.getUseWifi());
            stmt.setInt(8, rbean.getUseNavi());
            stmt.setInt(9, rbean.getUseSeat());
            stmt.executeUpdate();

            con.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public ArrayList<CarReserveBean> getCarReserveList(String id) {
        ArrayList<CarReserveBean> list = new ArrayList<>();

        getCon();
        try {
            String sql = "SELECT B.*, A.* FROM CAR_RESERVE A " +
                    "INNER JOIN RENT_CAR B ON A.NO = B.NO WHERE A.ID = ? ORDER BY A.RESERVE_NO";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, id);
            resultSet = stmt.executeQuery();
            while (resultSet.next()) {
                CarListBean car = new CarListBean();
                car.setCarListData(resultSet);

                CarReserveBean bean = new CarReserveBean();
                bean.setCarReserveData(resultSet, 8);

                bean.setCar(car);
                list.add(bean);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public CarReserveBean getCarReserveOne(int reserveNo) {
        getCon();
        try {
            String sql = "SELECT B.*, A.* FROM CAR_RESERVE A " +
                    "INNER JOIN RENT_CAR B ON A.NO = B.NO WHERE A.RESERVE_NO = ?";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, reserveNo);
            resultSet = stmt.executeQuery();
            if (resultSet.next()) {
                CarListBean car = new CarListBean();
                car.setCarListData(resultSet);

                CarReserveBean bean = new CarReserveBean();
                bean.setCarReserveData(resultSet, 8);

                bean.setCar(car);
                con.close();
                return bean;
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void deleteCarReserve(int reserveNo) {
        getCon();
        try {
            String sql = "DELETE FROM CAR_RESERVE WHERE RESERVE_NO = ?";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, reserveNo);
            stmt.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
