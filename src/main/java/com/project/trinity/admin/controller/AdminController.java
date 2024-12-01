package com.project.trinity.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    //등업 상세페이지
    @RequestMapping("/rankupDetail")
    public String showAdminRankUpDetail(@RequestParam(name = "seqNo", required = true) String seqNo, Model model) {
        Rankup rankupDetail = adminService.getRankupDetail(seqNo); // 모든 정보 가져오기
        System.out.println("RankupDetail: " + rankupDetail);
        
        model.addAttribute("rankupDetail", rankupDetail);
        return "admin/admin_rankup_detail";
    }
    
    // 회원 등업하기
    @RequestMapping("/updateRankup")
    public String updateRankup(@RequestParam("seqNo") String seqNo, 
                               @RequestParam("status") String status, 
                               RedirectAttributes redirectAttributes) {
        String alertMsg = "";

        if ("A".equals(status)) { // 승인일 경우
            adminService.approveRankup(seqNo); // 등업 승인 처리
            alertMsg = "등업이 승인되었습니다.";
        } else if ("D".equals(status)) { // 거부일 경우
            adminService.rejectRankup(seqNo); // 등업 거부 처리
            alertMsg = "등업이 거부되었습니다.";
        } else if ("W".equals(status)) { // 대기일 경우
            adminService.setRankupToWaiting(seqNo); // 대기 상태 처리
            alertMsg = "등업 상태가 대기로 설정되었습니다.";
        }

        redirectAttributes.addFlashAttribute("alertMsg", alertMsg);
        return "redirect:/admin/rankup"; // 등업 리스트 페이지로 이동
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
