package com.project.trinity.hospital.model.vo;

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
public class HospitalInfo {
	
	private String hosNo;
	private String hosId;
	private String hosPwd;
	private String hosYear;
	private String hosName;
	private String hosAddress;
	private String hosTel;
	private String department;
	private String hosStartTime1;
	private String hosEndTime1;
	private String hosStartTime2;
	private String hosEndTime2;
	private String hosLatitude;
	private String hosLongitude;
	private String hosInfo;
	private String hosOnduty;
	private String hosParking;
	
}
