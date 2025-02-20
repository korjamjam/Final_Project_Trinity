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

    //----------------------------------회원 관리 페이지----------------------------------
    @RequestMapping("/member")
    public String showAdminMember(
            @RequestParam(name = "role", defaultValue = "전체") String role, // 역할(role) 파라미터를 받아옴 (기본값: 전체)
            Model model) { // JSP로 데이터를 전달하기 위한 Model 객체
    
        List<Member> memberList;

        //회원 역할(role)에 따라 회원 목록을 필터링
        switch (role) {
            case "의사":
                memberList = adminService.getMembersByRole("medKey"); // "medKey"가 있는 회원은 의사로 분류
                break;
            case "관리자":
                memberList = adminService.getMembersByRole("isAdmin"); // "isAdmin" 값이 'Y'인 경우 관리자
                break;
            case "일반":
                memberList = adminService.getMembersByRole("general"); // "medKey"가 없고 "isAdmin"이 'N'이면 일반 회원
                break;
            default:
                memberList = adminService.getAllMembers(); // 역할 필터 없이 전체 회원 조회
        }

        // 조회된 회원 목록을 JSP로 전달
        model.addAttribute("memberList", memberList);
        model.addAttribute("selectedRole", role); // 현재 선택된 역할(role) 정보 전달

        return "admin/admin_member"; // 회원 관리 JSP 페이지로 이동
    }

   
    // 회원관리 상세페이지
    @RequestMapping("/memberDetail")
    public String showAdminMemberDetail(
            @RequestParam("userNo") String userNo, // 회원의 고유번호(userNo) 파라미터로 받음
            Model model) { // JSP로 데이터를 전달하는 Model 객체
    
        //특정 회원의 상세 정보 조회
        Member member = adminService.getMemberDetail(userNo); 

        //디버깅 로그 (콘솔 출력)
        System.out.println("Member: " + member);

        //조회된 회원 정보를 JSP에 전달
        model.addAttribute("member", member); 

        return "admin/admin_member_detail"; // 회원 상세 정보 JSP 페이지로 이동
    }

    
    // 회원 상세페이지 수정기능
    @RequestMapping("updateMember")
    public String updateMember(
            @RequestParam("userNo") String userNo, // 회원 고유번호
            @RequestParam("postcode") String postcode, // 우편번호
            @RequestParam("address") String address, // 주소
            @RequestParam("status") String status, // 회원 상태 (활성, 비활성 등)
            @RequestParam("isAdmin") String isAdmin, // 관리자 여부 (Y/N)
            RedirectAttributes redirectAttributes) { // 리다이렉트 시 메시지를 전달하기 위한 객체
    
        //수정할 회원 정보를 Member 객체에 저장
        Member updatedMember = new Member();
        updatedMember.setUserNo(userNo);
        updatedMember.setPostcode(postcode);
        updatedMember.setAddress(address);
        updatedMember.setStatus(status);
        updatedMember.setIsAdmin(isAdmin);

        //회원 정보 업데이트 실행
        boolean isUpdated = adminService.updateMember(updatedMember);

        //업데이트 성공 여부에 따라 알림 메시지 설정
        String message = isUpdated ? "회원 정보가 성공적으로 수정되었습니다." : "회원 정보 수정에 실패하였습니다.";
        redirectAttributes.addFlashAttribute("alertMsg", message);

        //수정 후 다시 회원 상세 페이지로 리다이렉트
        return "redirect:/admin/memberDetail?userNo=" + userNo;
    }


    
    // 등업 신청 페이지
    @RequestMapping("/rankup")
    public String showAdminRankUp(Model model) { 
        //등업 신청 목록을 가져옴
        List<Rankup> rankupList = adminService.getAllRankups();
    
        //조회된 등업 신청 목록을 JSP에 전달
        model.addAttribute("rankupList", rankupList); 

        return "admin/admin_rankup"; // 등업 신청 목록 페이지로 이동
    }

    // 등업 상세페이지
    @RequestMapping("/rankupDetail")
    public String showAdminRankUpDetail(
            @RequestParam(name = "seqNo", required = true) String seqNo, // 등업 신청 번호(seqNo) 받아오기
            Model model) { // JSP에 데이터를 전달하는 Model 객체
    
        //특정 등업 신청의 상세 정보 조회
        Rankup rankupDetail = adminService.getRankupDetail(seqNo); 

        //조회된 등업 신청 정보를 JSP에 전달
        model.addAttribute("rankupDetail", rankupDetail);

        return "admin/admin_rankup_detail"; // 등업 상세 페이지로 이동
    }

    
    // 회원 등업하기
    @RequestMapping("/updateRankup")
    public String updateRankup(
            @RequestParam("seqNo") String seqNo, // 등업 신청 번호
            @RequestParam("status") String status, // 등업 신청 상태 (승인, 거부, 대기)
            RedirectAttributes redirectAttributes) { // 리다이렉트 시 메시지 전달
    
        String alertMsg = ""; // 등업 처리 결과 메시지

        // 등업 상태 변경 로직
        if ("A".equals(status)) { // 승인 처리
            adminService.approveRankup(seqNo); 
            alertMsg = "등업이 승인되었습니다.";
        } else if ("D".equals(status)) { // 거부 처리
            adminService.rejectRankup(seqNo);
            alertMsg = "등업이 거부되었습니다.";
        } else if ("W".equals(status)) { // 대기 상태로 변경
            adminService.setRankupToWaiting(seqNo);
            alertMsg = "등업 상태가 대기로 설정되었습니다.";
        }

        //처리 결과 메시지를 추가하고 리스트 페이지로 리다이렉트
        redirectAttributes.addFlashAttribute("alertMsg", alertMsg);
        return "redirect:/admin/rankup"; 
    }

    //----------------------------------병원 관리 페이지----------------------------------
    @RequestMapping("/hospital")
    public String showAdminHospital(
            @RequestParam(name = "department", defaultValue = "전체") String department, // 진료과목(department) 필터링 (기본값: 전체)
            Model model) { // JSP에 데이터를 전달하는 Model 객체
    
        List<HospitalInfo> hospitalList;

        //선택된 진료과목에 따라 병원 목록 필터링
        if ("전체".equals(department)) {
            hospitalList = adminService.getAllHospitals(); // 전체 병원 조회
        } else {
            hospitalList = adminService.getHospitalsByDepartment(department); // 특정 진료과목 병원 조회
        }

        // 조회된 병원 목록을 JSP에 전달
        model.addAttribute("hospitalList", hospitalList);
        model.addAttribute("selectedDepartment", department); // 현재 선택된 진료과목을 유지

        return "admin/admin_hospital"; // 병원 관리 페이지로 이동
    }

    @RequestMapping("/hospitalDetail")
    public String showAdminHospitalDetail(
            @RequestParam("hosNo") String hosNo, // 병원 고유번호(hosNo) 받아오기
            Model model) { // JSP에 데이터를 전달하는 Model 객체
    
        //특정 병원의 상세 정보 조회
        HospitalInfo hospitalinfo = adminService.getHospitalDetail(hosNo);

        //디버깅 로그 출력 (콘솔)
        System.out.println("HospitalInfo: " + hospitalinfo);

        //조회된 병원 정보를 JSP에 전달
        model.addAttribute("hospital", hospitalinfo);

        return "admin/admin_hospital_detail"; // 병원 상세 페이지로 이동
    }
    
    @RequestMapping(value = "/updateHospital", method = RequestMethod.POST)
    public String updateHospital(
            @RequestParam("hosNo") String hosNo, // 병원 고유번호
            @RequestParam("hosTel") String hosTel, // 병원 전화번호
            @RequestParam("hosAddress") String hosAddress, // 병원 주소
            @RequestParam("hosOnduty") String hosOnduty, // 병원 운영 여부 (Y/N)
            @RequestParam("hosParking") String hosParking, // 주차 가능 여부 (Y/N)
            RedirectAttributes redirectAttributes) { // 리다이렉트 시 메시지 전달
    
        //수정할 병원 정보를 HospitalInfo 객체에 저장
        HospitalInfo hospital = new HospitalInfo();
        hospital.setHosNo(hosNo);
        hospital.setHosTel(hosTel);
        hospital.setHosAddress(hosAddress);
        hospital.setHosOnduty(hosOnduty);
        hospital.setHosParking(hosParking);

        //병원 정보 업데이트 실행
        boolean isUpdated = adminService.updateHospital(hospital);

        //업데이트 성공 여부에 따라 알림 메시지 설정
        String alertMsg = isUpdated ? "병원 정보가 성공적으로 수정되었습니다." : "병원 정보 수정에 실패하였습니다.";
        redirectAttributes.addFlashAttribute("alertMsg", alertMsg);

        //수정 후 다시 병원 상세 페이지로 리다이렉트
        return "redirect:/admin/hospitalDetail?hosNo=" + hosNo;
    }

    
    //----------------------------------예약 관리 페이지----------------------------------
    @RequestMapping("/reservation")
    public String showAllReservations(Model model) { 
        //전체 예약 목록 조회
        List<Reservation> reservations = adminService.getAllReservations();
    
        //디버깅 로그 출력
        System.out.println("Reservations: " + reservations);

        //조회된 예약 목록을 JSP에 전달
        model.addAttribute("reservations", reservations);

        return "admin/admin_reservation"; // 예약 관리 페이지로 이동
    }
    
    // 예약 관리 상세 페이지
    @RequestMapping("/reservationDetail")
    public String showReservationDetail(
            @RequestParam("reservationNo") String reservationNo, // 예약 번호 받아오기
            Model model) { // JSP에 데이터를 전달하는 Model 객체
    
        //특정 예약 정보 조회
        Map<String, Object> reservationDetail = adminService.getReservationDetail(reservationNo);

        //조회된 예약 정보를 JSP에 전달
        model.addAttribute("reservationDetail", reservationDetail);

        return "admin/admin_reservation_detail"; // 예약 상세 페이지로 이동
    }

    
    //----------------------------------게시글관리 페이지----------------------------------
    @RequestMapping("/post")
    public String showAdminPost(Model model) {
        List<Board> postList = adminService.getAllPosts();
        model.addAttribute("postList", postList);
        return "admin/admin_post";
    }

    //게시글 상세 정보 조회 페이지
    @RequestMapping("/postDetail")
    public String showAdminPostDetail(@RequestParam("postNo") String postNo, Model model) {
        //특정 게시글 정보 조회
        Board postDetail = adminService.getPostDetail(postNo);
        model.addAttribute("postDetail", postDetail); // JSP로 데이터 전달
        return "admin/admin_post_detail"; // 게시글 상세 페이지로 이동
    }


    //게시글 삭제 
    @RequestMapping("/deletePost")
    public String deletePost(@RequestParam("postNo") String postNo, RedirectAttributes redirectAttributes) {
        //게시글 삭제 실행
        boolean isDeleted = adminService.deletePost(postNo);

        //성공 여부에 따라 메시지 설정
        String message = isDeleted ? "게시글이 성공적으로 삭제되었습니다." : "게시글 삭제에 실패하였습니다.";
        redirectAttributes.addFlashAttribute("alertMsg", message);

        return "redirect:/admin/post"; // 삭제 후 게시글 목록 페이지로 이동
    }
}
