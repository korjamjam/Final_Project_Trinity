package com.project.trinity.vaccine.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.trinity.hospital.model.vo.HospitalInfo;
import com.project.trinity.member.model.vo.Guest;
import com.project.trinity.member.model.vo.Member;
import com.project.trinity.vaccine.model.vo.VaccineReservation;
import com.project.trinity.vaccine.service.VaccineReservationService;

@Controller
@RequestMapping("/vaccineReservation") // 모든 경로에 /vaccineReservation 접두어를 붙여 구조화
public class VaccineReservationController {

    @Autowired
    private VaccineReservationService vaccineReservationService; // 서비스 레이어 주입

    /**
     * 백신 예약 페이지 1로 이동
     * 사용자가 처음 접속하는 페이지
     */
    @GetMapping("/vaccinepage1")
    public String vaccineReservation1() {
        return "health_reservation/vaccine_reservation1"; // 예약 페이지 1로 이동
    }

    /**
     * 백신 예약 페이지 2로 이동 (병원 목록 포함)
     */
    @PostMapping("/vaccinepage2")
    public String vaccineReservation2(VaccineReservation vaccineReservation, Model model) {

        // 모든 병원 목록을 가져옴 (DB 조회)
        List<HospitalInfo> hospitalList = vaccineReservationService.getAllHospitals();
        
        // 디버깅 로그 출력
        System.out.println("DEBUG: hospitalList 데이터 확인 -> " + hospitalList);
        
        // 예약 정보와 병원 목록을 JSP로 전달
        model.addAttribute("vaccineReservation", vaccineReservation);
        model.addAttribute("hospitalList", hospitalList);

        return "health_reservation/vaccine_reservation2"; // 백신 예약 페이지 2로 이동
    }

    /**
     * 예약 처리 - 일반 폼 방식 (동기)
     */
    @PostMapping("/submitReservation")
    public String submitReservation(
        VaccineReservation vaccineReservation,
        HttpSession session,
        @RequestParam("gender") String genderInput, // **성별 정보 (M/F)**
        @RequestParam("phoneCode") String phoneCode, // **전화번호 앞자리**
        @RequestParam("phoneNumber") String phoneNumber, // **전화번호 뒷자리**
        @RequestParam("emailLocal") String emailLocal, // **이메일 아이디**
        @RequestParam("emailDomain") String emailDomain // **이메일 도메인**
    ) {
        System.out.println("DEBUG: 일반 폼 예약 처리 시작");

        try {
            //로그인 여부 확인
            Member loginUser = (Member) session.getAttribute("loginUser");
            if (loginUser != null) {
                // **회원일 경우 - USER_NO 설정, GST_NO는 null**
                vaccineReservation.setUserNo(loginUser.getUserNo());
                vaccineReservation.setGstNo(null);
                System.out.println("DEBUG: 로그인 상태 - USER_NO: " + loginUser.getUserNo());
            } else {
                //비회원일 경우 - Guest 테이블에 정보 삽입
                System.out.println("DEBUG: 비회원 상태, GUEST 테이블에 데이터 삽입 시작");

                Guest guest = new Guest();
                guest.setGstName(vaccineReservation.getPatientName());
                guest.setGstEmail(emailLocal + "@" + emailDomain);
                guest.setGstPhone(phoneCode + phoneNumber);
                guest.setGstBirth(vaccineReservation.getPatientBirthday());
                guest.setGstGender(genderInput);

                //비회원 정보 DB 저장 후 GST_NO 설정
                String guestNo = vaccineReservationService.insertGuest(guest);
                vaccineReservation.setGstNo(guestNo);
                vaccineReservation.setUserNo(null);
                System.out.println("DEBUG: 삽입된 GST_NO: " + guestNo);
            }

            //이메일 설정
            vaccineReservation.setEmail(emailLocal + "@" + emailDomain);

            //예약 정보 DB 저장
            vaccineReservationService.insertReservation(vaccineReservation);
            System.out.println("DEBUG: 예약 정보 삽입 완료");

            return "redirect:/main"; // **메인 페이지로 리다이렉트**
        } catch (IllegalArgumentException e) {
            System.err.println("ERROR: 입력 검증 실패 - " + e.getMessage());
            return "error/error_page"; // **입력 검증 실패 시 에러 페이지로 이동**
        } catch (Exception e) {
            System.err.println("ERROR: 서버 오류 발생");
            e.printStackTrace();
            return "error/error_page"; // **서버 오류 발생 시 에러 페이지로 이동**
        }
    }

    /**
     * 예약 처리 - Ajax 방식 (비동기)
     */
    @PostMapping("/submitReservationAjax")
    @ResponseBody
    public String submitReservationAjax(
        VaccineReservation vaccineReservation, 
        HttpSession session,
        @RequestParam("gender") String genderInput, 
        @RequestParam("fullPhoneNumber") String fullPhoneNumber, 
        @RequestParam("emailLocal") String emailLocal, 
        @RequestParam("emailDomain") String emailDomain
    ) {
        try {
            // 이메일 설정
            vaccineReservation.setEmail(emailLocal + "@" + emailDomain);

            // 성별 검증 및 변환
            String gender;
            if ("1".equals(genderInput) || "3".equals(genderInput)) {
                gender = "M";
            } else if ("2".equals(genderInput) || "4".equals(genderInput)) {
                gender = "F";
            } else {
                throw new IllegalArgumentException("잘못된 성별 값입니다: " + genderInput);
            }
            System.out.println("DEBUG: 변환된 성별 값 - " + gender);

            // 로그인 여부 확인
            Member loginUser = (Member) session.getAttribute("loginUser");
            if (loginUser != null) {
                vaccineReservation.setUserNo(loginUser.getUserNo());
                vaccineReservation.setGstNo(null);
            } else {
                // 비회원 정보 DB 저장
                Guest guest = new Guest();
                guest.setGstName(vaccineReservation.getPatientName());
                guest.setGstEmail(emailLocal + "@" + emailDomain);
                guest.setGstPhone(fullPhoneNumber);
                guest.setGstBirth(vaccineReservation.getPatientBirthday());
                guest.setGstGender(gender);

                String guestNo = vaccineReservationService.insertGuest(guest);
                vaccineReservation.setGstNo(guestNo);
                vaccineReservation.setUserNo(null);
            }

            // 예약 정보 DB 저장
            vaccineReservationService.insertReservation(vaccineReservation);
            System.out.println("DEBUG: 최종 vaccineReservation 객체 - " + vaccineReservation);

            return "success"; // **Ajax 성공 응답**
        } catch (IllegalArgumentException e) {
            return "fail: " + e.getMessage();
        } catch (Exception e) {
            e.printStackTrace();
            return "fail: 서버 오류가 발생했습니다.";
        }
    }



    /**
     * 예약 정보 설정 메서드
     * - 성별, 전화번호, 이메일 값을 검증 및 설정하는 메서드
     */
    private void setReservationDetails(
        VaccineReservation vaccineReservation, // 예약 데이터 객체
        String genderInput, // 성별 입력값
        String phoneCode, // 전화번호 앞자리
        String phoneNumber, // 전화번호 뒷자리
        String emailLocal, // 이메일 아이디
        String emailDomain // 이메일 도메인
    ) {
        // Gender 설정
        if ("1".equals(genderInput) || "3".equals(genderInput)) {
            vaccineReservation.setGender("M"); // 남성

        } else if ("2".equals(genderInput) || "4".equals(genderInput)) {
            vaccineReservation.setGender("F"); // 여성

        } else {
            throw new IllegalArgumentException("잘못된 성별 값입니다."); // 성별 값 검증 실패
        }

        // Phone Number 합치기
        if (phoneCode == null || phoneCode.isEmpty() || phoneNumber == null || phoneNumber.isEmpty()) {
            throw new IllegalArgumentException("전화번호 정보가 비어 있습니다."); // 전화번호 값 검증 실패
        }
        String fullPhoneNumber = phoneCode + phoneNumber; // 전화번호 조합
        vaccineReservation.setPhoneNumber(fullPhoneNumber); // 전화번호 설정

        // Email 합치기
        if (emailLocal == null || emailLocal.isEmpty() || emailDomain == null || emailDomain.isEmpty()) {
            throw new IllegalArgumentException("이메일 정보가 비어 있습니다."); // 이메일 값 검증 실패
        }
        vaccineReservation.setEmail(emailLocal + "@" + emailDomain); // 이메일 설정

    }
}
