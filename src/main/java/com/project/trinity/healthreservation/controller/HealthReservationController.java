package com.project.trinity.healthreservation.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.trinity.healthreservation.service.HealthReservationService;
import com.project.trinity.reservation.model.vo.Reservation;

@Controller
@RequestMapping("/healthReservation")
public class HealthReservationController {

    @Autowired
    private HealthReservationService healthReservationService;

    // 백신 예약 페이지 1로 이동
    @GetMapping("/vaccinepage1")
    public String vaccineReservation1() {
        return "health_reservation/vaccine_reservation1";
    }

    // 백신 예약 페이지 2로 이동
    @PostMapping("/vaccinepage2")
    public String vaccineReservation2(@ModelAttribute Reservation reservation, Model model, HttpSession session) {
    	//예약 데이터 확인 디버깅
    	System.out.println("Received Reservation in vaccineReservation2: " + reservation);
    	
        model.addAttribute("reservation", reservation);
        return "health_reservation/vaccine_reservation2";
        
    }

    @PostMapping("/submitReservation")
    public String submitReservation(@ModelAttribute Reservation reservation, HttpSession session) {
    	    try {
    	        // 세션에서 userNo 가져오기
    	        String userNo = (String) session.getAttribute("userNo");
    	        if (userNo == null) {
    	            throw new IllegalArgumentException("로그인된 사용자 정보가 없습니다.");
    	        }
    	        reservation.setUserNo(userNo);

    	        // 예약 데이터 저장
    	        healthReservationService.saveReservation(reservation);
    	    } catch (Exception e) {
    	        // 예외가 발생해도 처리 후 메인 페이지로 이동
    	        e.printStackTrace();
    	    }
    	    // 항상 메인 페이지로 리다이렉트
    	    return "redirect:/main";
    	}
    	
//        String userNo = (String) session.getAttribute("userNo");
//        if (userNo == null) {
//            throw new IllegalArgumentException("로그인된 사용자 정보가 없습니다.");
//        }
//        reservation.setUserNo(userNo);
//
//        // 예약 저장 처리
//        healthReservationService.saveReservation(reservation);
//
//        // 메인 페이지로 리다이렉트
//        return "redirect:/main";
//    }
	@GetMapping("/guide")
	public String healthReservationGuide() {
		return "health_reservation/health_reservation_guide";
	}
	
	@GetMapping("/guideEven")
	public String cautionGuideEvening() {
		return "health_reservation/caution_guide_evening";
	}
	
	@GetMapping("/guideDday")
	public String cautionGuideDday() {
		return "health_reservation/caution_guide_dday";
	}
	
	@GetMapping("/guideEndo")
	public String cautionGuideEndoscope() {
		return "health_reservation/caution_guide_endoscope";
	}
	
	@GetMapping("/guideCt")
	public String cautionGuideCtMri() {
		return "health_reservation/caution_guide_ct_mri";
	}
	
	@GetMapping("/reservation1")
	public String healthReservation1() {
		return "health_reservation/health_reservation1";
	}
	
	@GetMapping("/reservation2")
	public String healthReservation2() {
		return "health_reservation/health_reservation2";
	}
	
	@GetMapping("/result")
	public String healthReservationResult() {
		return "health_reservation/health_reservation_result";
	}
	
	@GetMapping("/infoNomal")
	public String healthReservationInfoNomal() {
		return "health_reservation/health_reservation_info_nomal";
	}
	
	@GetMapping("/itemsInfo")
	public String healthReservationItems() {
		return "health_reservation/health_reservation_items_info";
	}
}
