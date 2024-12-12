package com.project.trinity.inquiry.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor  // 기본 생성자 자동 생성
@AllArgsConstructor // 모든 필드를 받는 생성자 자동 생성
public class Inquiry {
    private String inquiryNo;
    private String userNo;
    private String userId; // 추가된 필드: USER_ID
    private String inquiryWriter;
    private String categoryId;
    private String subcategoryId; // 하위 카테고리 ID
    private String categoryName;
    private String subcategoryName; // 하위 카테고리명
    private String inquiryTitle;
    private String inquiryContent;
    private String adminReply;
    private String status;
    private String enrollDate;
    private String updateDate;
    private int inquiryViews;
}
