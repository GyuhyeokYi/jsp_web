package model;

import lombok.Data;

import java.sql.Date;
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
    private String modi_date;

    public void setBoardData(ResultSet resultSet) {
        try {
            setNum(resultSet.getInt(1));
            setWriter(resultSet.getString(2));
            setEmail(resultSet.getString(3));
            setSubject(resultSet.getString(4));
            setPassword(resultSet.getString(5));

            Date regDate = resultSet.getDate(6);
            setReg_date(regDate.toString());
            setRef(resultSet.getInt(7));
            setRe_step(resultSet.getInt(8));
            setRe_level(resultSet.getInt(9));
            setReadcount(resultSet.getInt(10));
            setContent(resultSet.getString(11));

            Date modiDate = resultSet.getDate(12);
            setModi_date(modiDate.toString());

            if (System.currentTimeMillis() - modiDate.getTime() <= 1000 * 60 * 60 * 24 * 1) {
                setNewYn("Y");
            } else {
                setNewYn("N");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
