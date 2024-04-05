package model;

import lombok.Data;

import java.util.ArrayList;
import java.util.Date;

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
