package com.project.trinity.reservation.model.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
public class Reservation {
    private String resNo;          // 예약 번호
    private String userNo;         // 사용자 번호
    private String hosNo;          // 병원 번호
    private String patientName;    // 환자 이름
    private String patientBirthday;// 환자 생년월일
    private String resDate;        // 예약 날짜
    private String resTime;        // 예약 시간
    private String resCategory;    // 예약 카테고리
    private String resContent;     // 예약 내용
    private String hosName;        // 병원 이름
    private String hosAddress;     // 병원 주소
    private String phone;     	   // 환자 번호
}


