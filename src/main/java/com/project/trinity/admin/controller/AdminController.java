package com.project.trinity.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.trinity.admin.service.AdminService;
import com.project.trinity.member.model.vo.Member;
import com.project.trinity.member.model.vo.Rankup;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    // 관리자 메인페이지
    @RequestMapping("/main")
    public String showAdminMainPage() {
        return "admin/admin_main_page";
    }

    // 회원관리 페이지
    @RequestMapping("/member")
    public String showAdminMember(Model model) {
        List<Member> memberList = adminService.getAllMembers(); // 모든 회원 목록 가져오기
        model.addAttribute("memberList", memberList); // JSP로 전달
        return "admin/admin_member";
    }
    
    //회원관리 상세페이지
    @RequestMapping("/memberDetail")
    public String showAdminMemeberDetail() {
        return "admin/admin_member_detail";
    }
    
    // 등업 신청 페이지
    @RequestMapping("/rankup")
    public String showAdminRankUp(Model model) {
        List<Rankup> rankupList = adminService.getAllRankups();
        System.out.println(rankupList); // 데이터 확인용
        model.addAttribute("rankupList", rankupList);
        return "admin/admin_rankup";
    }
    //회원관리 상세페이지
    @RequestMapping("/rankupDetail")
    public String showAdminRankUpDetail() {
        return "admin/admin_rankup_detail";
    }
    
    //병원관리 페이지
    @RequestMapping("/hospital")
    public String showAdminHospital() {
        return "admin/admin_hospital";
    }
    
    //병원관리 상세페이지
    @RequestMapping("/hospitalDetail")
    public String showAdminHospitalDetail() {
        return "admin/admin_hospital_detail";
    }
    
    //예약관리 페이지
    @RequestMapping("/reservation")
    public String showAdminReservation() {
        return "admin/admin_reservation";
    }
    
    //예약관리 상세 페이지
    @RequestMapping("/reservationDetail")
    public String showAdminReservationDetail() {
        return "admin/admin_reservation_detail";
    }
    
    //게시글관리 페이지
    @RequestMapping("/post")
    public String showAdminPost() {
        return "admin/admin_post";
    }
    
    //게시글관리 상세 페이지
    @RequestMapping("/postDetail")
    public String showAdminPostDetail() {
        return "admin/admin_post_detail";
    }   
}
