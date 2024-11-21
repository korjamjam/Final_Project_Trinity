package com.project.trinity.healthreservation.model.vo;

import lombok.Data;

@Data
public class HealthReservation {
	private String hResNo;
	private String userNo;
	private String gstNo;
	private String hosNo;
	private String resDate;
	private String resTime;
	private String resCategory;
	private String patientName;
	private String patientBirthday;
	private String patientEmail;
	private String patientGender;
	private String patientResult;
}
