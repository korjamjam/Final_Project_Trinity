package com.project.trinity.inquiry.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {

	//커뮤니티 페이지 연결
    @RequestMapping("inquiry_faq.me")
    public String showInquiryFaqPage() {
        // "community_main" JSP로 포워딩
        return "inquiry/inquiry_faq";
    }
    
    @RequestMapping("inquiry_notice.me")
    public String showCommunityEventPage() {
        // "community_main" JSP로 포워딩
        return "inquiry/inquiry_notice";
    }
    
    @RequestMapping("inquiry_notification.me")
    public String showCommunityFreePage() {
        // "community_main" JSP로 포워딩
        return "inquiry/inquiry_notification";
    }
    
    @RequestMapping("inquiry_qna.me")
    public String showCommunityMedicalPage() {
        // "community_main" JSP로 포워딩
        return "inquiry/inquiry_qna";
    }
    
//    고객문의 페이지 글쓰기 제작
//    @RequestMapping("community_main_writer.me")
//    public String showCommunityWriterPage() {
//        // "community_main" JSP로 포워딩
//        return "inquiry/community_main_writer";
//    }
//    
//    @RequestMapping("community_detail.me")
//    public String showCommunityDetailPage() {
//        // "community_main" JSP로 포워딩
//        return "inquiry/community_detail";
//    }
    
    @RequestMapping("inquiry_qna_write.me")
    public String showCommunityQPage() {
        // "community_main" JSP로 포워딩
        return "inquiry/inquiry_qna_write";
    }
}
