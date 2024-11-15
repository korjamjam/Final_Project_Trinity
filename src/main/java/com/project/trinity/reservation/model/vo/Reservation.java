package com.project.trinity.reservation.model.vo;

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
@EqualsAndHashCode
public class Reservation {
    private String resNo;               // 예약 번호
    private String userNo;              // 사용자 번호
    private String patientName;      // 환자 이름
    private int patientBirthday;      // 환자 생년월일
    private String hosNo;            // 병원 번호
    private Date resDate;            // 예약 날짜
    private Date resTime;            // 예약 시간
    private String resCategory;      // 예약 카테고리
    private String resContent;       // 예약 내용

    // 추가 필드가 필요하다면 이곳에 선언해줍니다.
    // 예: private String vaccineCategory;
}
