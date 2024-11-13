package com.project.trinity.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommunityController {

 @RequestMapping("/community_main.me")
    public String communityMain(@RequestParam(name = "type", required = false) String type, Model model) {
        String boardTitle;
         System.out.println("type 파라미터 값: " + type);  // type 값 확인
        if ("free".equals(type)) {
            boardTitle = "자유게시판";
        } else if ("meditalk".equals(type)) {
            boardTitle = "메디톡";
        } else if ("event".equals(type)) {
            boardTitle = "이벤트";
        } else {
            boardTitle = "실시간 인기글";
        }
        model.addAttribute("boardTitle", boardTitle);
        return "community/community_main";
    }
    // 동적으로 커뮤니티 페이지 연결 - type 파라미터에 따라 게시판 종류를 설정
 @RequestMapping("/community_board.me")
    public String getBoardPage(@RequestParam(name = "type", required = false) String type, Model model) {
        String boardTitle;


        if ("free".equals(type)) {
            boardTitle = "자유게시판";
        } else if ("meditalk".equals(type)) {
            boardTitle = "메디톡";
        } else if ("event".equals(type)) {
            boardTitle = "이벤트";
        } else {
            boardTitle = "실시간 인기글";
        }

        // 모델에 속성 추가
        model.addAttribute("boardTitle", boardTitle);

        // JSP 파일 이름을 community/Board로 설정하여 Board.jsp를 찾도록 함
        return "community/Board";
    }

    // 글 작성 페이지 연결
    @RequestMapping("community_main_writer.me")
    public String showCommunityWriterPage() {
        return "community/community_main_writer";
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
        return "community/summernote";
    }
}
