package com.project.trinity.vaccine.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @PostMapping("/vaccinepage2")
    public String vaccineReservation2(VaccineReservation vaccineReservation, Model model) {
        model.addAttribute("vaccineReservation", vaccineReservation); // 전달된 데이터 유지

        // 병원 목록 가져오기
        List<HospitalInfo> hospitalList = vaccineReservationService.getAllHospitals();
//        System.out.println("디버그 - 컨트롤러에서 가져온 병원 목록: " + hospitalList); // 병원 목록 확인
//
//        if (hospitalList == null || hospitalList.isEmpty()) {
//            System.out.println("디버그 - 병원 목록이 비어 있습니다.");
//        }

        // 병원 목록을 JSP에 전달
        model.addAttribute("hospitalList ", hospitalList);
        return "health_reservation/vaccine_reservation2";
    }

    // 예약 처리
    @PostMapping("/submitReservation")
    public String submitReservation(VaccineReservation vaccineReservation) {
    	System.out.println("디버그: " + vaccineReservation);
        vaccineReservationService.insertReservation(vaccineReservation);
        return "redirect:/main"; // 예약 성공 페이지로 리다이렉트
    }
}