package com.project.trinity.inquiry.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {
	 // 캐시 비활성화 메서드
    private void disableCache(HttpServletResponse response) {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
    }

	//커뮤니티 페이지 연결
	@RequestMapping("/notification")
    public String showInquiryNotificationPage(HttpServletResponse response) {
		disableCache(response);
		return "inquiry/inquiry_notification";
    }
	
	@RequestMapping("/notice")
    public String showInquiryNoticePage() {
        // "community_main" JSP로 포워딩
        return "inquiry/inquiry_notice";
    }
    
    @RequestMapping("/faq")
    public String showInquiryFaqPage() {
        // "community_main" JSP로 포워딩
        return "inquiry/inquiry_faq";
    }
    
    
    @RequestMapping("/qna")
    public String showInquiryQnaPage() {
        // "community_main" JSP로 포워딩
        return "inquiry/inquiry_qna";
    }
    
    @RequestMapping("/qnawrite")
    public String showInquiryQnaWritePage() {
        // "community_main" JSP로 포워딩
        return "inquiry/inquiry_qna_write";
    }
}
