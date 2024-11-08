package com.project.trinity.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommunityController {
	
	//커뮤니티 페이지 연결
    @RequestMapping("community_main.me")
    public String showCommunityMainPage() {
        // "community_main" JSP로 포워딩
        return "community/community_main";
    }
    
    @RequestMapping("community_event.me")
    public String showCommunityEventPage() {
        // "community_main" JSP로 포워딩
        return "community/community_event";
    }
    
    @RequestMapping("community_free.me")
    public String showCommunityFreePage() {
        // "community_main" JSP로 포워딩
        return "community/community_free";
    }
    
    @RequestMapping("community_medical.me")
    public String showCommunityMedicalPage() {
        // "community_main" JSP로 포워딩
        return "community/community_medical";
    }
    
    @RequestMapping("community_main_writer.me")
    public String showCommunityWriterPage() {
        // "community_main" JSP로 포워딩
        return "community/community_main_writer";
    }
    
    @RequestMapping("community_detail.me")
    public String showCommunityDetailPage() {
        // "community_main" JSP로 포워딩
        return "community/community_detail";
    }
}