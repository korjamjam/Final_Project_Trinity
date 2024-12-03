package com.project.trinity.reservation.model.vo;


import java.sql.Date;
import java.time.LocalDate;

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
public class HealthReservation {
	private String hResNo;              // 건강검진 진료 예약 번호
    private String userNo; 				// 사용자 번호(로그인)
    private String hosNo; 				// 병원 번호
    private String gstNo;				// 게스트 번호(비로그인)
    private String patientName;         // 검진자 이름
    private String patientBirthday;        // 검진자 생년월일
    private String resDate;			    // 검진 날짜
    private String resTime; 		    // 검진 시작 시간
    private String resCategory;         // 진료 카테고리
    private String resComment;         // 진료 특이사항
    private String patientEmail;	    // 검진자 이메일
    private String patientGender;       // 성별
    private String patientResult;		// 결과 수령방법
    private String hosName;				// 병원 이름
    private String hosAddress;			// 병원 주소
}
