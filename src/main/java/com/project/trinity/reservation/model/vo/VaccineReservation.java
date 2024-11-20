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
public class VaccineReservation {
	private String vresNo;              // 백신 예약 번호
    private String userNo; 				// 사용자 번호(로그인)
    private String hosNo; 				// 병원 번호
    private String gstNo;				// 게스트 번호(비로그인)
    private String patientName;         // 접종자 이름
    private int patientBirthday;        // 점종자 생년월일
    private Date vresDate;			    // 백신 접종 날짜
    private Date vresTime; 				// 백신 접종 시간
    private String vType;				// 백신 종류
    private String resContent;          // 특이 사항

}
