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
@EqualsAndHashCode
public class Reservation {
	private String resNo; // 예약 번호
	private String userNo; // 사용자 번호
	private String patientName; // 환자 이름
	private String patientBirthday; // 환자 생년월일 (YYYYMMDD 형식)
	private String hosNo; // 병원 번호
	private String resDate;
	private String resTime;
	private String resCategory; // 예약 카테고리
	private String resContent;
	private String hosName; // 병원 이름
	private String hosAddress; // 병원 주소
// 예약 내용
}
