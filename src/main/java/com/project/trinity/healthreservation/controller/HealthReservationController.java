package com.project.trinity.healthreservation.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.trinity.healthreservation.service.HealthReservationService;
import com.project.trinity.member.model.vo.Guest;
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
    public String vaccineReservation2(@ModelAttribute Reservation reservation, Model model) {
    	//예약 데이터 확인 디버깅
    	System.out.println("Received Reservation in vaccineReservation2: " + reservation);
    	
        model.addAttribute("reservation", reservation);
        return "health_reservation/vaccine_reservation2";
    }

    @PostMapping("/submitReservation")
    public String submitReservation(@ModelAttribute Reservation reservation, HttpSession session) {
        System.out.println("Received Reservation: " + reservation);

        String userNo = (String) session.getAttribute("userNo");
        if (userNo == null) {
            throw new IllegalArgumentException("로그인된 사용자 정보가 없습니다.");
        }

        reservation.setUserNo(userNo);
        
        // 디버깅: USER_NO와 HOS_NO 출력
        System.out.println("USER_NO: " + reservation.getUserNo());
        System.out.println("HOS_NO: " + reservation.getHosNo());
        System.out.println("Reservation Data: " + reservation);
        
        healthReservationService.saveReservation(reservation);

        return "redirect:/healthReservation/vaccinepage1";
    }

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
	
	// 건강검진 
	@GetMapping("/reservation1")
	public String healthReservation1() {
		return "health_reservation/health_reservation1";
	}
	
	// 건강검진 받는 사용자 정보 받아주는 컨트롤러
	@RequestMapping("/reservation2")
	public String healthReservation2(
			@RequestParam("reservation_user_name") String reservation_user_name,
			@RequestParam("reservation_user_num1") String reservation_user_num1,
			@RequestParam("reservation_user_num2") String reservation_user_num2,
			@RequestParam("reservation_user_phone1") String reservation_user_phone1,
			@RequestParam("reservation_user_phone2") String reservation_user_phone2,
			@RequestParam("reservation_user_email1") String reservation_user_email1,
			@RequestParam("reservation_user_email2") String reservation_user_email2,
			@RequestParam("postcode") String postcode,
			@RequestParam("address") String address,
			@RequestParam("extraAddress") String extraAddress,
			@RequestParam("detailAddress") String detailAddress,
			@RequestParam("use_tos_ans1") String use_tos_ans1,
			@RequestParam("use_tos_ans2") String use_tos_ans2,
			HttpSession session) {
		//이용약관 두개 다 동의 한 경우만 다음 페이지 리턴
		if((use_tos_ans1.equals("yes"))&&(use_tos_ans1.equals("yes"))) {
			//로그인 유저 정보 없으면 게스트 저장하고 게스트 넘버 반환
			if(session.getAttribute("loginUser") != null) {
				String gstName = reservation_user_name;
				String gstBirth = reservation_user_num1;
				String gstGender = "";
				//주민번호 뒷자리 홀수면 M, 짝수면 F로 반환
				if(Integer.parseInt(reservation_user_num2) %2 ==0) {
					gstGender = "F";
				} else {
					gstGender = "M";
				}
				String gstPhone = reservation_user_phone1 + reservation_user_phone2;
				String gstEmail = reservation_user_email1 + "@" + reservation_user_email2;
				String gstAddress = address + extraAddress + detailAddress;
				Guest guest = new Guest(gstName, gstEmail, gstPhone, gstBirth, gstGender, gstAddress);
				
				//게스트 정보 게스트 테이블에 추가
				int result = healthReservationService.insertGuest(guest);
				//성공
				if(result > 0) {
					session.setAttribute("gstNo", guest.getGstNo());
					return "health_reservation/health_reservation2";
				//실패
				} else {
					return "health_reservation/health_reservation1";
				}
			}//로그인 유저 정보 있으면 유저번호 반환
			else {
				return "health_reservation/health_reservation2";
			}
		//이용약관 동의 안하면 원래 페이지 리턴	
		} else {
			return "health_reservation/health_reservation1";
		}
	}
	
	//
	@RequestMapping("/reservationSubmit")
	public String healthReservation3(
			@RequestParam("reservation_user_select") String reservation_user_select,
			@RequestParam("reservation_user_hospital") String reservation_user_hospital,
			@RequestParam("reservation_user_text") String reservation_user_text,
			@RequestParam("reservation_user_date") String reservation_user_date,
			@RequestParam("reservation_user_time") String reservation_user_time,
			@RequestParam("reservation_user_result") String reservation_user_result,
			HttpSession session) {
		//로그인한 회원이 예약하는 경우
		if(session.getAttribute("loginUser") != null) {
			
		} else {
			Guest guest = (Guest)session.getAttribute("guest");
			System.out.println(guest);
//			String selectGstNo = healthReservationService.selectGuest(guest.getGstName(),guest.getGstPhone());
		}
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



//}
