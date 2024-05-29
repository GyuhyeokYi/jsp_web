package db;

import lombok.Data;

@Data
public class CarReserveBean {
    private int no;
    private int qty;
    private int rentalPeriod;
    private String rentalDate;
    private int useInsurance;
    private int useWifi;
    private int useNavi;
    private int useSeat;
}
