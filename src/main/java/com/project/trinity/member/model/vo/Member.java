package com.project.trinity.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Member {
    private String userNo;
    private String userId;
    private String userPwd;
    private String userName;
    private String email;
    private String phone;
    private String birthday;
    private String gender;
    private String postcode; // 우편번호 추가
    private String address;
    private Date enrollDate;
    private String status;
    private String isAdmin;
    private String medKey;
    private String hosNo;
    private String userProfile;
}
