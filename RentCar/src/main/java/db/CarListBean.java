package db;

import lombok.Data;

import java.sql.ResultSet;

@Data
public class CarListBean {
    private int no;
    private String name;
    private String category;
    private int price;
    private int usePeople;
    private String company;
    private String img;
    private String info;

    public void setCarListData(ResultSet resultSet) {
        try {
            no = resultSet.getInt(1);
            name = resultSet.getString(2);
            category = resultSet.getString(3);
            price = resultSet.getInt(4);
            usePeople = resultSet.getInt(5);
            company = resultSet.getString(6);
            img = resultSet.getString(7);
            info = resultSet.getString(8);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
