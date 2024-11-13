package com.project.trinity.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	//커뮤니티 페이지 연결
    @RequestMapping("/main")
    public String showAdminMainPage() {
        // "community_main" JSP로 포워딩
        return "admin/admin_main_page";
    }
    
    @RequestMapping("/hospital")
    public String showAdminHospital() {
        // "community_main" JSP로 포워딩
        return "admin/admin_hospital";
    }
    
    @RequestMapping("/hospitalDetail")
    public String showAdminHospitalDetail() {
        // "community_main" JSP로 포워딩
        return "admin/admin_hospital_detail";
    }
    
    @RequestMapping("/member")
    public String showAdminMember() {
        // "community_main" JSP로 포워딩
        return "admin/admin_member_detail";
    }
    
    @RequestMapping("/memberDetail")
    public String showAdminMemeberDetail() {
        // "community_main" JSP로 포워딩
        return "admin/admin_member_detail";
    }
    
    @RequestMapping("/post")
    public String showAdminPost() {
        // "community_main" JSP로 포워딩
        return "admin/admin_post";
    }
    
    @RequestMapping("/postDetail")
    public String showAdminPostDetail() {
        // "community_main" JSP로 포워딩
        return "admin/admin_post_detail";
    }
    
    @RequestMapping("/reservation")
    public String showAdminReservation() {
        // "community_main" JSP로 포워딩
        return "admin/admin_reservation";
    }
    
    @RequestMapping("/reservationDetail")
    public String showAdminReservationDetail() {
        // "community_main" JSP로 포워딩
        return "admin/admin_reservation_detail";
    }
    
	
}
