package com.project.trinity.inquiry.model.controller;

import com.project.trinity.board.common.vo.PageInfo;
import com.project.trinity.board.common.vo.Template;
import com.project.trinity.inquiry.model.service.InquiryService;
import com.project.trinity.inquiry.model.vo.Inquiry;
import com.project.trinity.member.model.vo.Member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {

	private InquiryService inquiryService;

	@Autowired
	public InquiryController(InquiryService inquiryService) {
		this.inquiryService = inquiryService;

	}

	@GetMapping("/main")
	public String getInquiryBoard(@RequestParam(value = "categoryId", required = false) String categoryId,
			@RequestParam(value = "cpage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "sortType", required = false, defaultValue = "작성일") String sortType, Model m) {

		if ("CAT07".equals(categoryId)) {
			return "/inquiry/inquiry_qna"; // Q&A 전용 JSP 반환
		}

		if (categoryId != null
				&& (categoryId.equals("CAT04") || categoryId.equals("CAT05") || categoryId.equals("CAT06"))) {

			int listCount = inquiryService.getListCount(categoryId); // 전체 게시물 수 조회
			PageInfo pi = Template.getPageInfo(listCount, currentPage, 10, 20); // 공통 페이지네이션 유틸리티 사용
			List<Inquiry> inquiryList = inquiryService.selectListByCategory(categoryId, pi, sortType); // 데이터 조회

			// 모델에 데이터 추가
			m.addAttribute("categoryId", categoryId);
			m.addAttribute("sortType", sortType);
			m.addAttribute("inquiryList", inquiryList);
			m.addAttribute("pi", pi);

			return "/inquiry/inquiry_board";
		}

		// 4. 잘못된 카테고리 ID 처리
		m.addAttribute("errorMsg", "잘못된 카테고리입니다.");
		return "/common/errorPage";
	}

	// insertBoard하면서 동시에 작동해서 상세페이지를 바로 보여줌
	@GetMapping("/inquiryDetail")
    public String viewDetailPage(@RequestParam("ino") String ino, Model m, HttpSession session) {
        // 현재 게시글 번호 확인
        System.out.println("Received ino: " + ino);

        // 현재 게시글 조회
        Inquiry inq = inquiryService.viewDetailPageWithCount(ino);

        if (inq == null) {
            m.addAttribute("errorMsg", "게시글을 찾을 수 없습니다.");
            return "/common/errorPage";
        }

        // 로그인 사용자 정보 가져오기
        Member loginUser = (Member) session.getAttribute("loginUser");

//        // 이전 글 번호와 다음 글 번호 조회
//        String prevBno = inquiryService.getPreviousBoard(bno);
//        Inquiry prevBoard = (prevBno != null) ? inquiryService.viewDetailPageWithCount(prevBno) : null;
//
//        String nextBno = inquiryService.getNextBoard(bno);
//        Inquiry nextBoard = (nextBno != null) ? inquiryService.viewDetailPageWithCount(nextBno) : null;

 

        // 모델에 데이터 추가
        m.addAttribute("inq", inq);               // 현재 게시글 정보
//        m.addAttribute("prevBoard", prevBoard);       // 이전 게시글
//        m.addAttribute("nextBoard", nextBoard);       // 다음 게시글
        m.addAttribute("categoryId", inq.getCategoryId());
        m.addAttribute("categoryName", inq.getCategoryName());
       
        return "inquiry/inquiry_board_detail"; // 상세 페이지로 이동
    }




}
