package com.project.trinity.member.model.vo;

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
public class Guest {
    private String gstNo;
    private String gstName;
    private String gstEmail;
    private String gstPhone;
    private String gstBirth;
    private String gstGender;
    private String gstAddress;
    
	public Guest(String gstName, String gstEmail, String gstPhone, String gstBirth, String gstGender,
			String gstAddress) {
		super();
		this.gstName = gstName;
		this.gstEmail = gstEmail;
		this.gstPhone = gstPhone;
		this.gstBirth = gstBirth;
		this.gstGender = gstGender;
		this.gstAddress = gstAddress;
	}
    
    
}
