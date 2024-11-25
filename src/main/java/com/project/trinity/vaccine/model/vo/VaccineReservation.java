package com.project.trinity.vaccine.model.vo;

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
	private String vresNo;          // 예약 번호
    private String userNo;          // 사용자 번호
    private String hosNo;           // 병원 번호
    private String gstNo;           // 게스트 번호
    private String patientName;     // 접종자 이름
    private String patientBirthday;    // 생년월일
    private String vaccineType;           // 백신 종류
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date vresDate;
    private String vresTime;        // 예약 시간
    private String resContent;      // 특이 사항
    private String gender;          // 성별
    private String phoneCode;       // 전화번호 앞자리
    private String phoneNumber;     // 전화번호 
    private String emailLocal; // 이메일 앞부분
    private String emailDomain; // 이메일 뒷부분
    private String email;
}
