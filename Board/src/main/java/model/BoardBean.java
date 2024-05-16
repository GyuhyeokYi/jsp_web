package model;

import lombok.Data;

import java.sql.ResultSet;

@Data
public class BoardBean {

    private int num;
    private String writer;
    private String email;
    private String subject;
    private String password;
    private String  reg_date;
    private int ref;
    private int re_step;
    private int re_level;
    private int readcount;
    private String content;
    private String newYn;

    public void setBoadData(ResultSet resultSet) {
        try {
            setNum(resultSet.getInt(1));
            setWriter(resultSet.getString(2));
            setEmail(resultSet.getString(3));
            setSubject(resultSet.getString(4));
            setPassword(resultSet.getString(5));
            setReg_date(resultSet.getString(6));
            setRef(resultSet.getInt(7));
            setRe_step(resultSet.getInt(8));
            setRe_level(resultSet.getInt(9));
            setReadcount(resultSet.getInt(10));
            setContent(resultSet.getString(11));
            setNewYn(resultSet.getString(12));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
