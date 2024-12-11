package com.project.trinity.inquiry.controller;


import com.project.trinity.community.common.vo.PageInfo;
import com.project.trinity.community.common.vo.Template;
import com.project.trinity.inquiry.service.InquiryService;
import com.project.trinity.inquiry.vo.Inquiry;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

  

@Controller
@RequestMapping("/inquiry")
public class InquiryController {

   
    private InquiryService inquiryService;


    
    @Autowired
    public InquiryController(InquiryService inquiryService) {
        this.inquiryService = inquiryService;
       
    }


    @GetMapping("/main")
    public String getInquiryBoard(
            @RequestParam(value = "categoryId", required = false) String categoryId,
            @RequestParam(value = "cpage", required = false, defaultValue = "1") int currentPage,
            @RequestParam(value = "sortType", required = false, defaultValue = "작성일") String sortType,
            Model model) {

        // 1. 카테고리 이름 가져오기
        String categoryName = inquiryService.getCategoryNameById(categoryId);
        model.addAttribute("categoryName", categoryName);
        System.out.println("Category ID: " + categoryId);
        if (categoryId == null) {
            throw new IllegalArgumentException("Category ID is null");
        }

        // 2. Q&A (CAT07) 처리
        if ("CAT07".equals(categoryId)) {
            return "/inquiry/inquiry_qna"; // Q&A 전용 JSP 반환
        }

        // 3. 일반 게시판 처리 (CAT04, CAT05, CAT06)
        if (categoryId != null && (categoryId.equals("CAT04") || categoryId.equals("CAT05") || categoryId.equals("CAT06"))) {
            int listCount = inquiryService.getListCount(categoryId); // 전체 게시물 수 조회
            PageInfo pi = Template.getPageInfo(listCount, currentPage, 10, 20); // 공통 페이지네이션 유틸리티 사용
            List<Inquiry> inquiryList = inquiryService.selectListByCategory(categoryId, pi, sortType); // 데이터 조회
            System.out.println("Inquiry List: " + inquiryList); // 컨트롤러에서 데이터 확인

            // 모델에 데이터 추가
            model.addAttribute("categoryId", categoryId);
            model.addAttribute("categoryName", categoryName);
            model.addAttribute("sortType", sortType);
            model.addAttribute("inquiryList", inquiryList);
            model.addAttribute("pi", pi);

            return "/inquiry/inquiry_board";
        }

        // 4. 잘못된 카테고리 ID 처리
        model.addAttribute("errorMsg", "잘못된 카테고리입니다.");
        return "/common/errorPage";
    }


}
