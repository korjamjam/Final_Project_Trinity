package com.project.trinity.inquiry.vo;


import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor  // 기본 생성자 자동 생성
@AllArgsConstructor // 모든 필드를 받는 생성자 자동 생성
public class Inquiry {
	  private String inquiryNo;        // INQUIRY_ID
	    private String userNo;           // USER_NO
	    private String inquiryWriter;
	    private String categoryId;       // CATEGORY_ID
	    private String inquiryTitle;     // INQUIRY_TITLE
	    private String inquiryContent;   // INQUIRY_CONTENT
	    private String adminReply;       // ADMIN_REPLY
	    private String status;           // STATUS
	    private String enrollDate;       // CREATE_DATE
	    private String updateDate;       // UPDATE_DATE
	    private int inquiryViews;               // 조회수
	    private String categoryName;
}
