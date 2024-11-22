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
@RequestMapping("/vaccineReservation") // 모든 경로에 /vaccineReservation 접두어를 붙여 구조화
public class VaccineReservationController {

    @Autowired
    private VaccineReservationService vaccineReservationService; // 서비스 레이어 주입

    /**
     * 백신 예약 페이지 1로 이동
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
        // 병원 목록 가져오기
        List<HospitalInfo> hospitalList = vaccineReservationService.getAllHospitals(); // 병원 정보를 서비스에서 가져옴
        model.addAttribute("vaccineReservation", vaccineReservation); // 전달받은 예약 데이터를 모델에 추가
        model.addAttribute("hospitalList", hospitalList); // 병원 목록을 모델에 추가

        return "health_reservation/vaccine_reservation2"; // 예약 페이지 2로 이동
    }

    /**
     * 예약 처리 - 일반 폼 방식
     */
    @PostMapping("/submitReservation")
    public String submitReservation(
        VaccineReservation vaccineReservation, // 예약 데이터 객체
        @RequestParam("gender") String genderInput, // 성별 입력값
        @RequestParam("phoneCode") String phoneCode, // 전화번호 앞자리
        @RequestParam("phoneNumber") String phoneNumber, // 전화번호 뒷자리
        @RequestParam("emailLocal") String emailLocal, // 이메일 아이디
        @RequestParam("emailDomain") String emailDomain // 이메일 도메인
    ) {
        System.out.println("DEBUG: 일반 폼 예약 처리 시작");
        try {
            // 이메일 값을 객체에 설정
            vaccineReservation.setEmailLocal(emailLocal); // 이메일 아이디 설정
            vaccineReservation.setEmailDomain(emailDomain); // 이메일 도메인 설정
            vaccineReservation.setEmail(emailLocal + "@" + emailDomain); // 전체 이메일 설정

            // 나머지 값 설정
            setReservationDetails(vaccineReservation, genderInput, phoneCode, phoneNumber, emailLocal, emailDomain);

            // 예약 정보 삽입
            vaccineReservationService.insertReservation(vaccineReservation); // 예약 데이터를 DB에 저장

            return "redirect:/main"; // 성공 시 메인 페이지로 리다이렉트
        } catch (IllegalArgumentException e) {
            return "error/error_page"; // 입력 오류 시 에러 페이지
        } catch (Exception e) {
            e.printStackTrace();
            return "error/error_page"; // 서버 오류 시 에러 페이지
        }
    }

    /**
     * 예약 처리 - AJAX 요청 방식
     */
    @PostMapping("/submitReservationAjax")
    @ResponseBody
    public String submitReservationAjax(
        VaccineReservation vaccineReservation, // 예약 데이터 객체
        @RequestParam("gender") String genderInput, // 성별 입력값
        @RequestParam("fullPhoneNumber") String fullPhoneNumber, // 전체 전화번호
        @RequestParam("emailLocal") String emailLocal, // 이메일 아이디
        @RequestParam("emailDomain") String emailDomain // 이메일 도메인
    ) {
        try {
            // 이메일 값 설정
            vaccineReservation.setEmailLocal(emailLocal); // 이메일 아이디 설정
            vaccineReservation.setEmailDomain(emailDomain); // 이메일 도메인 설정
            vaccineReservation.setEmail(emailLocal + "@" + emailDomain); // 전체 이메일 설정

            // 성별 설정
            if ("1".equals(genderInput) || "3".equals(genderInput)) {
                vaccineReservation.setGender("M"); // 남성
            } else if ("2".equals(genderInput) || "4".equals(genderInput)) {
                vaccineReservation.setGender("F"); // 여성
            } else {
                throw new IllegalArgumentException("잘못된 성별 값입니다."); // 성별 값 검증 실패
            }

            // 전화번호 설정
            vaccineReservation.setPhoneNumber(fullPhoneNumber); // 전화번호 설정

            // 예약 정보 삽입
            vaccineReservationService.insertReservation(vaccineReservation); // 예약 데이터를 DB에 저장

            return "success"; // 성공 응답 반환
        }
        catch (IllegalArgumentException e) {
            return "fail: " + e.getMessage(); // 입력 오류 시 실패 메시지 반환
        }
        catch (Exception e) {
            e.printStackTrace();
            return "fail: 서버 오류가 발생했습니다."; // 서버 오류 시 실패 메시지 반환
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
