package com.project.trinity.inquiry.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.trinity.community.board.model.vo.Board;
import com.project.trinity.inquiry.service.InquiryService;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {
	
	@Autowired
    private InquiryService inquiryService;
	
	 // 캐시 비활성화 메서드
    private void disableCache(HttpServletResponse response) {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
    }
    
  //커뮤니티 페이지 연결
    @RequestMapping("/notice")
    public String showInquiryNoticePage(HttpServletResponse response, Model model) {
        disableCache(response); // 캐시 비활성화
        List<Board> noticeList = inquiryService.getNotices(); // 공지사항 목록 가져오기
        model.addAttribute("noticeList", noticeList); // 모델에 데이터 추가
        return "inquiry/inquiry_notice"; // JSP 경로
    }

	
	@RequestMapping("/report")
    public String showInquiryReportPage(HttpServletResponse response, Model model) {
		disableCache(response); // 캐시 비활성화
		List<Board> noticeList = inquiryService.getNotices(); // 공지사항 목록 가져오기
        model.addAttribute("noticeList", noticeList); 
        return "inquiry/inquiry_report";
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
