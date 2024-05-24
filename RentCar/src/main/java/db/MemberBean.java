package db;

import lombok.Data;

import java.sql.ResultSet;
import java.util.ArrayList;

@Data
public class MemberBean {

    private String id;
    private String pass1;
    private String pass2;
    private String email;
    private String tel;
    private String hobby;
    private String job;
    private String age;
    private String info;
    private String instDtm;

    public void setMemberData(ResultSet resultSet) {
        try {
            setId(resultSet.getString(1));
            setPass1(resultSet.getString(2));
            setTel(resultSet.getString(3));
            setEmail(resultSet.getString(4));
            setHobby(resultSet.getString(5));
            setJob(resultSet.getString(6));
            setAge(resultSet.getString(7));
            setInfo(resultSet.getString(8));
            setInstDtm(resultSet.getString(9));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
        ArrayList<MemberBean> arrayList = new ArrayList<>();

        for(int i = 0; i < 5; i++) {
            MemberBean memberBean = new MemberBean();
            memberBean.setId("apple_" + (i + 1));
            memberBean.setPass1("@gni0918");
            memberBean.setEmail("gyuhyeok@gnifrix.com");

            memberBean.setTel("010-5592-7662");
            memberBean.setHobby("독서");
            memberBean.setJob("회사원");
            memberBean.setAge("40대");
            memberBean.setInfo("특이사항 없음.");

            arrayList.add(memberBean);
        }
        System.out.println("회원정보 = " + arrayList);
    }
}
