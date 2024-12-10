package com.project.trinity.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.trinity.admin.service.AdminService;
import com.project.trinity.community.board.model.vo.Board;
import com.project.trinity.hospital.model.vo.HospitalInfo;
import com.project.trinity.member.model.vo.Member;
import com.project.trinity.member.model.vo.Rankup;
import com.project.trinity.reservation.model.vo.Reservation;

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
    public String showAdminMember(
            @RequestParam(name = "role", defaultValue = "전체") String role,
            Model model) {
        
        List<Member> memberList;

        // 조건에 따라 회원 목록 필터링
        switch (role) {
            case "의사":
                memberList = adminService.getMembersByRole("medKey"); // 의사는 medKey가 있는 회원
                break;
            case "관리자":
                memberList = adminService.getMembersByRole("isAdmin"); // 관리자는 isAdmin = 'Y'
                break;
            case "일반":
                memberList = adminService.getMembersByRole("general"); // 일반 회원은 medKey 없음 & isAdmin = 'N'
                break;
            default:
                memberList = adminService.getAllMembers(); // 전체 회원
        }

        model.addAttribute("memberList", memberList); // JSP에 전달
        model.addAttribute("selectedRole", role); // 선택된 역할 전달
        return "admin/admin_member";
    }
   
    //회원관리 상세페이지
    @RequestMapping("/memberDetail")
    public String showAdminMemberDetail(@RequestParam("userNo") String userNo, Model model) {
        Member member = adminService.getMemberDetail(userNo); // 특정 회원 정보 가져오기
        System.out.println("Member: " + member); // 디버깅용 로그
        model.addAttribute("member", member); // JSP에 전달
        return "admin/admin_member_detail";
    }
    
    //회원 상세페이지 수정기능
    @RequestMapping("updateMember")
    public String updateMember(
    		@RequestParam("userNo") String userNo,
            @RequestParam("postcode") String postcode,
            @RequestParam("address") String address,
            @RequestParam("status") String status,
            @RequestParam("isAdmin") String isAdmin,
            RedirectAttributes redirectAttributes) {
    	
    	// 업데이트를 위한 Member 객체 생성
        Member updatedMember = new Member();
        updatedMember.setUserNo(userNo);
        updatedMember.setPostcode(postcode);
        updatedMember.setAddress(address);
        updatedMember.setStatus(status);
        updatedMember.setIsAdmin(isAdmin);

        // 업데이트 수행
        boolean isUpdated = adminService.updateMember(updatedMember);

        // 성공/실패 메시지 설정
        String message = isUpdated ? "회원 정보가 성공적으로 수정되었습니다." : "회원 정보 수정에 실패하였습니다.";
        redirectAttributes.addFlashAttribute("alertMsg", message);

        // 다시 상세 페이지로 리다이렉트
        return "redirect:/admin/memberDetail?userNo=" + userNo;
    }
    
    // 등업 신청 페이지
    @RequestMapping("/rankup")
    public String showAdminRankUp(Model model) {
        List<Rankup> rankupList = adminService.getAllRankups();
        model.addAttribute("rankupList", rankupList);
        return "admin/admin_rankup";
    }
    //등업 상세페이지
    @RequestMapping("/rankupDetail")
    public String showAdminRankUpDetail(@RequestParam(name = "seqNo", required = true) String seqNo, Model model) {
        Rankup rankupDetail = adminService.getRankupDetail(seqNo); // 모든 정보 가져오기      
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

    //----------------------------------병원관리 페이지----------------------------------
    @RequestMapping("/hospital")
    public String showAdminHospital(
            @RequestParam(name = "department", defaultValue = "전체") String department,
            Model model) {
        
        List<HospitalInfo> hospitalList;

        // 선택된 department에 따라 병원 목록 필터링
        if ("전체".equals(department)) {
            hospitalList = adminService.getAllHospitals(); // 전체 병원 가져오기
        } else {
            hospitalList = adminService.getHospitalsByDepartment(department); // 특정 진료과목 병원
        }

        // hospitalList를 모델에 추가
        model.addAttribute("hospitalList", hospitalList);
        model.addAttribute("selectedDepartment", department); // 선택된 진료과목 유지

        return "admin/admin_hospital";
    }

    @RequestMapping("/hospitalDetail")
    public String showAdminHospitalDetail(@RequestParam("hosNo") String hosNo, Model model) {
        HospitalInfo hospitalinfo = adminService.getHospitalDetail(hosNo); // 데이터 가져오기
        System.out.println("HospitalInfo: " + hospitalinfo); // 디버깅 로그 추가
        model.addAttribute("hospital", hospitalinfo); // JSP로 전달
        return "admin/admin_hospital_detail";
    }
    
    @RequestMapping(value = "/updateHospital", method = RequestMethod.POST)
    public String updateHospital(
            @RequestParam("hosNo") String hosNo,
            @RequestParam("hosTel") String hosTel,
            @RequestParam("hosAddress") String hosAddress,
            @RequestParam("hosOnduty") String hosOnduty,
            @RequestParam("hosParking") String hosParking,
            RedirectAttributes redirectAttributes) {

        HospitalInfo hospital = new HospitalInfo();
        hospital.setHosNo(hosNo);
        hospital.setHosTel(hosTel);
        hospital.setHosAddress(hosAddress);
        hospital.setHosOnduty(hosOnduty);
        hospital.setHosParking(hosParking);

        boolean isUpdated = adminService.updateHospital(hospital);

     // 성공/실패 메시지 설정
        if (isUpdated) {
            redirectAttributes.addFlashAttribute("successMessage", "병원 정보가 성공적으로 수정되었습니다.");
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "병원 정보 수정에 실패하였습니다.");
        }

        // 병원 리스트 페이지로 리다이렉트
        return "redirect:/admin/hospital";
    }


    
    //----------------------------------예약관리 페이지----------------------------------
 // AdminController.java
    @RequestMapping("/reservation")
    public String showAllReservations(Model model) {
        List<Reservation> reservations = adminService.getAllReservations();
        System.out.println("Reservations: " + reservations); // 디버깅 로그
        model.addAttribute("reservations", reservations);
        return "admin/admin_reservation";
    }
    
    //예약관리 상세 페이지
    @RequestMapping("/reservationDetail")
    public String showReservationDetail(@RequestParam("reservationNo") String reservationNo, Model model) {
        // 서비스에서 예약 정보를 가져옴
        Map<String, Object> reservationDetail = adminService.getReservationDetail(reservationNo);

        // 가져온 데이터를 JSP로 전달
        model.addAttribute("reservationDetail", reservationDetail);
        return "admin/admin_reservation_detail";
    }

    
    //----------------------------------게시글관리 페이지----------------------------------
    @RequestMapping("/post")
    public String showAdminPost(Model model) {
        List<Board> postList = adminService.getAllPosts();
        model.addAttribute("postList", postList);
        return "admin/admin_post";
    }
    
    //게시글관리 상세 페이지
    @RequestMapping("/postDetail")
    public String showAdminPostDetail() {
        return "admin/admin_post_detail";
    }   
}