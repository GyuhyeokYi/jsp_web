package db;

import lombok.Data;

import java.sql.ResultSet;

@Data
public class CarReserveBean {
    private int reserveNo;
    private int no;
    private String id;
    private int qty;
    private int rentalPeriod;
    private String rentalDate;
    private int useInsurance;
    private int useWifi;
    private int useNavi;
    private int useSeat;
    private CarListBean car;

    public int calculateRentalPrice(int carPrice) {
        int rentalPrice = 0;

        rentalPrice = carPrice * rentalPeriod;

        if (useInsurance == 1) {
            rentalPrice = rentalPrice + 10000 * rentalPeriod;
        }
        if (useWifi == 1) {
            rentalPrice = rentalPrice + 10000 * rentalPeriod;
        }
        if (useSeat == 1) {
            rentalPrice = rentalPrice + 10000 * rentalPeriod;
        }
        return rentalPrice;
    }

    public void setCarReserveData(ResultSet resultSet, int offset) {
        try {
            reserveNo = resultSet.getInt(offset + 1);
            no = resultSet.getInt(offset + 2);
            id = resultSet.getString(offset + 3);
            qty = resultSet.getInt(offset + 4);
            rentalPeriod = resultSet.getInt(offset + 5);
            rentalDate = resultSet.getString(offset + 6);
            useInsurance = resultSet.getInt(offset + 7);
            useWifi = resultSet.getInt(offset + 8);
            useNavi = resultSet.getInt(offset + 9);
            useSeat = resultSet.getInt(offset + 10);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
