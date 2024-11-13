package com.project.trinity.hospital.model.vo;

import com.project.trinity.member.model.vo.Member;

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
public class Hospital {
	
	private String name;
	private String address;
	private String division;
	private String department;
	private String startTime;
	private String endTime;
	private String hpId;
	private String latitude;
	private String longitude;
	
}
