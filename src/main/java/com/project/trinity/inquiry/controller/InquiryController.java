package com.project.trinity.inquiry.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {

	//커뮤니티 페이지 연결
    @RequestMapping("/faq")
    public String showInquiryFaqPage() {
        // "community_main" JSP로 포워딩
        return "inquiry/inquiry_faq";
    }
    
    @RequestMapping("/notice")
    public String showCommunityEventPage() {
        // "community_main" JSP로 포워딩
        return "inquiry/inquiry_notice";
    }
    
    @RequestMapping("/notification")
    public String showCommunityFreePage() {
        // "community_main" JSP로 포워딩
        return "inquiry/inquiry_notification";
    }
    
    @RequestMapping("/qna")
    public String showCommunityMedicalPage() {
        // "community_main" JSP로 포워딩
        return "inquiry/inquiry_qna";
    }
    
    @RequestMapping("/qnawrite")
    public String showCommunityQPage() {
        // "community_main" JSP로 포워딩
        return "inquiry/inquiry_qna_write";
    }
}
