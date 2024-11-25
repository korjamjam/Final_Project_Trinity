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
public class GeneralReservation {
	private String gresNo;              // 일반 진료 예약 번호
    private String userNo; 				// 사용자 번호(로그인)
    private String hosNo; 				// 병원 번호
    private String gstNo;				// 게스트 번호(비로그인)
    private String gpatientName;        // 접종자 이름
    private String gpatientBirthday;       // 점종자 생년월일
    private Date gresDate;			    // 백신 접종 날짜
    private String gresTime; 		    // 백신 접종 시간
    private String gresSubject;         // 예약 진료 과목
    private String gresContent;			// 증상
    private String gender;              // 성별
	
}
