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

        try {
            String sql = "INSERT INTO CAR_RESERVE VALUES(DBMS_RANDOM.STRING('X', 12),?,?,?,?,?,?,?,?,?,SYSDATE)";
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

    public ArrayList<CarReserveBean> getCarReserveList(String id, int starRow, int endRow) {
        ArrayList<CarReserveBean> list = new ArrayList<>();

        getCon();
        try {
            StringBuilder sql = new StringBuilder();
            sql.append("SELECT * FROM (SELECT A.*, ROWNUM AS RNUM FROM (SELECT * FROM CAR_RESERVE NATURAL JOIN RENT_CAR WHERE 1=1 ");
            if (!"admin".equals(id)) {
                sql.append("AND ID = ? ");
                sql.append("AND TO_DATE(RENTAL_DATE, 'YYYY-MM-DD') > SYSDATE -1 ");
            }
            sql.append("ORDER BY INST_DTM DESC) A) ");
            sql.append("WHERE RNUM >= ? AND RNUM <= ?");
            stmt = con.prepareStatement(sql.toString());
            if (!"admin".equals(id)) {
                stmt.setString(1, id);
                stmt.setInt(2, starRow);
                stmt.setInt(3, endRow);
            } else {
                stmt.setInt(1, starRow);
                stmt.setInt(2, endRow);
            }

            resultSet = stmt.executeQuery();
            while (resultSet.next()) {
                CarReserveBean bean = new CarReserveBean();
                bean.setCarReserveData(resultSet, 0, true);

                CarListBean car = new CarListBean();
                car.setName(resultSet.getString(12));
                car.setPrice(resultSet.getInt(14));
                car.setImg(resultSet.getString(17));

                bean.setCar(car);
                list.add(bean);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public CarReserveBean getCarReserveOne(String reserveNo) {
        getCon();
        try {
            String sql = "SELECT B.*, A.* FROM CAR_RESERVE A " +
                    "INNER JOIN RENT_CAR B ON A.NO = B.NO WHERE A.RESERVE_NO = ?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, reserveNo);
            resultSet = stmt.executeQuery();
            if (resultSet.next()) {
                CarListBean car = new CarListBean();
                car.setCarListData(resultSet);

                CarReserveBean bean = new CarReserveBean();
                bean.setCarReserveData(resultSet, 8, false);

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

    public void deleteCarReserve(String reserveNo) {
        getCon();
        try {
            String sql = "DELETE FROM CAR_RESERVE WHERE RESERVE_NO = ?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, reserveNo);
            stmt.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getAllCount(String id) {
        getCon();
        int count = 0;
        try {
            StringBuilder sql = new StringBuilder();
            sql.append("SELECT COUNT(*) FROM CAR_RESERVE WHERE 1=1 ");
            if (!"admin".equals(id)) {
                sql.append("AND ID = ? ");
            }

            stmt = con.prepareStatement(sql.toString());
            if (!"admin".equals(id)) {
                stmt.setString(1, id);
            }
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
