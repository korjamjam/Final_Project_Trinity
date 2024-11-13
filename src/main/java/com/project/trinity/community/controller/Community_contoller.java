package com.project.trinity.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Community_contoller {
    
    // 커뮤니티 메인 페이지 연결
    @RequestMapping("community_main.me")
    public String showCommunityMainPage() {
        // "community_main" JSP로 포워딩
        return "community/community_main";
    }
    
    // 자유 게시판 페이지 연결
    @RequestMapping("community_free.me")
    public String showCommunityFreePage() {
        // "community_free" JSP로 포워딩
        return "community/community_free";
    }
    
    // 메디컬 게시판 페이지 연결
    @RequestMapping("community_medical.me")
    public String showCommunityMedicalPage() {
        // "community_medical" JSP로 포워딩
        return "community/community_medical";
    }
     // 이벤트 페이지 연결
    @RequestMapping("community_event.me")
    public String showCommunityEventPage() {
        // "community_event" JSP로 포워딩
        return "community/community_event";
    }
    
    // 글 작성 페이지 연결
    @RequestMapping("community_main_writer.me")
    public String showCommunityWriterPage() {
        // "community_main_writer" JSP로 포워딩
        return "community/community_main_writer";
    }
    
    // 게시글 상세 페이지 연결
    @RequestMapping("community_detail.me")
    public String showCommunityDetailPage() {
        // "community_detail" JSP로 포워딩
        return "community/community_detail";
    }
    @RequestMapping("community_post_detail.me")
public String showCommunityDetailPage(@RequestParam("category") String category, Model model) {
    model.addAttribute("currentCategory", category);
    return "community/community_post_detail";
}

}
