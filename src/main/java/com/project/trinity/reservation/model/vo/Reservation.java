package com.project.trinity.reservation.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reservation {
	private String resNo;          // 예약 번호
    private String gresNo;         // 일반 진료 예약 번호
    private String vresNo;         // 백신 예약 번호
    private String healthResNo;    // 검진 예약 번호
    private String userNo;         // 사용자 번호
    private String gstNo;          // 게스트 번호
    private String patientName;    // 예약자 이름
    private String patientBirthday;// 환자 생년월일
    private String resDate;        // 예약 날짜
    private String resTime;        // 예약 시간 
    private String hosNo;          // 병원 번호
    private String resContent;     // 예약 내용
    private String resCategory;     // 예약 내용
    private String hosName;        // 병원 이름
    private String hosAddress;     // 병원 주소
    private String phone;     	   // 환자 번호
    private String gender;         //
}
