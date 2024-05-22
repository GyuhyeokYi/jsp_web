package db;

import lombok.Data;

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
}
