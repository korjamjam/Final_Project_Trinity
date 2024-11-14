package com.project.trinity.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @RequestMapping("/main")
    public String showAdminMainPage() {
        return "admin/admin_main_page";
    }
    
    @RequestMapping("/hospital")
    public String showAdminHospital() {
        return "admin/admin_hospital";
    }
    
    @RequestMapping("/hospitalDetail")
    public String showAdminHospitalDetail() {
        return "admin/admin_hospital_detail";
    }
    
    @RequestMapping("/member")
    public String showAdminMember() {
        return "admin/admin_member";
    }
    
    @RequestMapping("/memberDetail")
    public String showAdminMemeberDetail() {
        return "admin/admin_member_detail";
    }
    
    @RequestMapping("/post")
    public String showAdminPost() {
        return "admin/admin_post";
    }
    
    @RequestMapping("/postDetail")
    public String showAdminPostDetail() {
        return "admin/admin_post_detail";
    }
    
    @RequestMapping("/reservation")
    public String showAdminReservation() {
        return "admin/admin_reservation";
    }
    
    @RequestMapping("/reservationDetail")
    public String showAdminReservationDetail() {
        return "admin/admin_reservation_detail";
    }
    
	
}
