package com.project.trinity.vaccine.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.trinity.hospital.model.vo.HospitalInfo;
import com.project.trinity.vaccine.model.vo.VaccineReservation;
import com.project.trinity.vaccine.service.VaccineReservationService;

@Controller
@RequestMapping("/vaccineReservation")
public class VaccineReservationController {

    @Autowired
    private VaccineReservationService vaccineReservationService;

    // 백신 예약 페이지 1로 이동
    @GetMapping("/vaccinepage1")
    public String vaccineReservation1() {
        return "health_reservation/vaccine_reservation1";
    }

    // 백신 예약 페이지 2로 이동 (병원 목록 포함)
    @PostMapping("/vaccinepage2")
    public String vaccineReservation2(VaccineReservation vaccineReservation, Model model) {
        model.addAttribute("vaccineReservation", vaccineReservation); // 전달된 데이터 유지

        // 병원 목록 가져오기
        List<HospitalInfo> hospitalList = vaccineReservationService.getAllHospitals();
        model.addAttribute("hospitalList", hospitalList);

        return "health_reservation/vaccine_reservation2";
    }

    // 예약 처리 - 일반 폼 방식
    @PostMapping("/submitReservation")
    public String submitReservation(
        VaccineReservation vaccineReservation,
        @RequestParam("gender") String genderInput,
        @RequestParam("phoneNumber") String phoneNumberPrefix,
        @RequestParam("email") String emailLocal,
        @RequestParam("emailDomain") String emailDomain
    ) {
        try {
            // Gender 처리
            if ("1".equals(genderInput) || "3".equals(genderInput)) {
                vaccineReservation.setGender("M"); // 남성
            } else if ("2".equals(genderInput) || "4".equals(genderInput)) {
                vaccineReservation.setGender("F"); // 여성
            } else {
                throw new IllegalArgumentException("잘못된 성별 값입니다.");
            }

            // Phone Number 합치기
            vaccineReservation.setPhoneNumber(phoneNumberPrefix + vaccineReservation.getPhoneNumber());

            // Email 합치기
            vaccineReservation.setEmail(emailLocal + "@" + emailDomain);

            // 예약 정보 삽입
            vaccineReservationService.insertReservation(vaccineReservation);

            return "redirect:/main"; // 예약 성공 시 메인 페이지로 리다이렉트
        } catch (Exception e) {
            e.printStackTrace();
            return "error/error_page"; // 에러 발생 시 에러 페이지로 이동
        }
    }

    // 예약 처리 - AJAX 요청 방식
    @PostMapping("/submitReservationAjax")
    @ResponseBody
    public String submitReservationAjax(
        VaccineReservation vaccineReservation,
        @RequestParam("gender") String genderInput,
        @RequestParam("phoneNumber") String phoneNumberPrefix,
        @RequestParam("email") String emailLocal,
        @RequestParam("emailDomain") String emailDomain
    ) {
        try {
            // Gender 처리
            if ("1".equals(genderInput) || "3".equals(genderInput)) {
                vaccineReservation.setGender("M"); // 남성
            } else if ("2".equals(genderInput) || "4".equals(genderInput)) {
                vaccineReservation.setGender("F"); // 여성
            } else {
                return "fail: 잘못된 성별 값입니다.";
            }

            // Phone Number 합치기
            vaccineReservation.setPhoneNumber(phoneNumberPrefix + vaccineReservation.getPhoneNumber());

            // Email 합치기
            vaccineReservation.setEmail(emailLocal + "@" + emailDomain);

            // 예약 정보 삽입
            vaccineReservationService.insertReservation(vaccineReservation);

            return "success"; // 성공 메시지 반환
        } catch (Exception e) {
            e.printStackTrace();
            return "fail: 서버 오류가 발생했습니다."; // 실패 메시지 반환
        }
    }
}
