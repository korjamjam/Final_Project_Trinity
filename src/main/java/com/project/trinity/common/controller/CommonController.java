package com.project.trinity.common.controller;

import com.project.trinity.community.board.service.BoardService;
import com.project.trinity.inquiry.service.InquiryService;
import com.project.trinity.member.service.MemberService;
import com.project.trinity.community.board.model.vo.Board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class CommonController {

	  private final BoardService boardService;
	  private final InquiryService inquiryService;
	  private final MemberService memberService;
	 
	    @Autowired
	    public CommonController(BoardService boardService, InquiryService inquiryService, MemberService memberService) {
	        this.boardService = boardService;
	        this.inquiryService = inquiryService;
	        this.memberService = memberService;
	    }

    @GetMapping("/main")
    public String main(Model m) {
    	 // 최신 공지사항 게시글 3개 가져오기
        List<Board> latestNoticePosts = inquiryService.getLatestInquiryPosts("CAT04"); // CAT04: 공지사항 ID
        // 최신 이벤트 게시글 3개 가져오기
        List<Board> latestEventPosts = boardService.getLatestBoardPosts("CAT03"); // CAT03: 이벤트 ID
        // 인증된 리뷰 수, 회원 수, 의사 수 가져오기
        List<Integer> amountCount = memberService.selectCountList();
      
        System.out.println("Notice Posts: " + latestNoticePosts);
        System.out.println("Event Posts: " + latestEventPosts);
        // 모델에 데이터 추가
        m.addAttribute("latestNoticePosts", latestNoticePosts);
        m.addAttribute("latestEventPosts", latestEventPosts);
        m.addAttribute("amountCount", amountCount);
    
      
        // main.jsp로 이동
        return "main";
    }
}
