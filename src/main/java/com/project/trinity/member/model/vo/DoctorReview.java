package com.project.trinity.member.model.vo;

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
public class DoctorReview {
	private String reviewNo;
	private String userNo;
	private String reviewTitle;
	private String reviewContent;
	private String reviewCreatedAt;
	private String reviewUpdatedAt;
	private String reviewRating;
}
