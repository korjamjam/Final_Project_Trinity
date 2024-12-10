package com.project.trinity.reservation.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.trinity.hospital.model.vo.HospitalInfo;
import com.project.trinity.hospital.service.HospitalService;
import com.project.trinity.member.model.vo.Guest;
import com.project.trinity.member.model.vo.Member;
import com.project.trinity.reservation.service.ReservationService;

@Controller
@RequestMapping("/reservation") // 클래스 레벨에 기본 경로 설정
public class ReservationController {

	private final ReservationService rService;

	private final HospitalService hService;

	@Autowired
	public ReservationController(ReservationService reservationService, HospitalService hospitalService) {
		this.rService = reservationService;
		this.hService = hospitalService;
	}

	@RequestMapping("/gForm")
	public String generalReservation(String hosNo, String curTime, Model m) {
		HospitalInfo hInfo = hService.selectHospitalInfo(hosNo);
		System.out.println(hInfo);
		System.out.println(curTime);
		m.addAttribute("hInfo", hInfo);
		m.addAttribute("curTime", curTime);
		return "reservation/general_reservation";
	}

	@RequestMapping("/gReservation")
    public String gReservation(String userNo, String hosNo, String gReservation_date, String resTime, String subject,
            String content, String userName, String birthday, String phone, String email, String gender, HttpSession session) {
		String resDate = gReservation_date;
		System.out.println(resDate);
		if (userNo.equals("")) { // 게스트 예약
			int resultG = rService.insertgGuest(userName, birthday, phone, email, gender);
			Guest g = rService.selectGuest(phone, email);
			String guestNo = g.getGstNo();
			if (resultG != 0) { // 게스트 입력 성공
				int resultR = rService.insertgGuestReservation(hosNo, guestNo, userName, birthday, resDate, resTime,
						subject, content, gender);
				if(resultR != 0) {
					System.out.println("게스트 일반 진료 예약 완료");
					session.setAttribute("message", "예약이 완료되었습니다.");
				} else {
					System.out.println("게스트 일반 진료 예약 실패");
					session.setAttribute("message", "예약 실패");
				}
			} else { // 게스트 입력 실패
				System.out.println("게스트 입력 실패");
			}
		} else { // 회원 예약
			System.out.println("회원 예약");
			int result = rService.insertgReservation(userNo, hosNo, resDate, resTime, subject, content);
			if(result == 1) {
				System.out.println("회원 일반 진료 예약 완료");
				session.setAttribute("message", "예약이 완료되었습니다.");
			} else {
				System.out.println("회원 일반 진료 예약 실패");
				session.setAttribute("message", "예약 실패");
			}
		}
		return "redirect:/main";
	}
	
	@RequestMapping("/cancel")
	public String cancelReservation(String resNo, HttpSession session) {
	    Member loginUser = (Member) session.getAttribute("loginUser");
	    if (loginUser == null) {
	        return "redirect:/member/login"; // 로그인 페이지로 리다이렉트
	    }

	    System.out.println("[DEBUG] 취소할 예약 번호: " + resNo);

	    int result = rService.cancelReservation(resNo);
	    if (result > 0) {
	        System.out.println("[DEBUG] 예약 취소 성공");
	    } else {
	        System.out.println("[DEBUG] 예약 취소 실패");
	    }

	    return "redirect:/member/reservationconfirmation"; // 예약 확인 페이지로 리다이렉트
	}




}