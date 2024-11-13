package com.project.trinity.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
<<<<<<< HEAD:src/main/java/com/project/trinity/community/controller/community_contoller.java

@Controller
public class community_contoller {
    
=======
<<<<<<<< HEAD:src/main/java/com/project/trinity/community/controller/communityController.java
import org.springframework.ui.Model;



@Controller
public class CommunityContoller {

>>>>>>> 70cbdd799b920f85202b586452386a75d07141ab:src/main/java/com/project/trinity/community/controller/CommunityContoller.java
    // 커뮤니티 메인 페이지 연결
    @RequestMapping("community_main.me")
    public String showCommunityMainPage() {
        return "community/community_main";
    }

    // 자유 게시판 페이지 연결
    @RequestMapping("community_free.me")
    public String showCommunityFreePage() {
        return "community/community_free";
    }

    // 메디컬 게시판 페이지 연결
    @RequestMapping("community_medical.me")
    public String showCommunityMedicalPage() {
        return "community/community_medical";
    }

    // 이벤트 페이지 연결
    @RequestMapping("community_event.me")
    public String showCommunityEventPage() {
        return "community/community_event";
    }

    // 글 작성 페이지 연결
    @RequestMapping("community_main_writer.me")
    public String showCommunityWriterPage() {
        return "community/community_main_writer";
    }

    // 게시글 상세 페이지 연결 - 기본 상세 페이지
    @RequestMapping("community_detail.me")
    public String showCommunityDetailPage() {
        return "community/community_detail";
    }

    // 게시글 상세 페이지 연결 - 카테고리와 함께
    @RequestMapping("community_post_detail.me")
    public String showCommunityPostDetailPage(@RequestParam("category") String category, Model model) {
        model.addAttribute("currentCategory", category);
        return "community/community_post_detail";
    }
      // 글쓰기 페이지 이동 매핑
    @RequestMapping("summernote.me")
    public String showSummernotePage() {
        return "community/summernote"; // "community/summernote.jsp"로 포워딩
    }
}
