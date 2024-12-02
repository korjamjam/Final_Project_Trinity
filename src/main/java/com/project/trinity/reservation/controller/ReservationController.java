package com.project.trinity.reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.project.trinity.hospital.model.vo.HospitalInfo;
import com.project.trinity.hospital.service.HospitalService;
import com.project.trinity.member.model.vo.Guest;
import com.project.trinity.member.model.vo.Member;
import com.project.trinity.reservation.model.vo.Reservation;
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
    public String generalReservation(String hosNo, Model m) {
    	HospitalInfo hInfo = hService.selectHospitalOne(hosNo);
    	System.out.println(hInfo);
    	m.addAttribute("hInfo", hInfo);
        return "reservation/general_reservation";
    }
    
    @RequestMapping("/gReservation")
    public String gReservation(String userNo, String hosNo,String gReservation_date, 
    						   String resTime, String subject, String content, 
    						   String userName, String birthday, String phone, 
    						   String email, String gender) {
    	String resDate = gReservation_date;
    	if(userNo.equals("")) {		//게스트 예약
    		int resultG = rService.insertgGuest(userName, birthday, phone, email, gender);
    		Guest g = rService.selectGuest(phone, email);
    		String guestNo = g.getGstNo();
    		if(resultG != 0) {	//게스트 입력 성공
    			int resultR = rService.insertgGuestReservation(hosNo, guestNo, userName, birthday, resDate, resTime, subject, content, gender);
    		} else {	//게스트 입력 실패
    			System.out.println("게스트 입력 실패");
    		}
    	} else {	//회원 예약
    		System.out.println("회원 예약");
    		int result = rService.insertgReservation(userNo, hosNo, resDate, resTime, subject, content);
    	}
    	return "/main";
    }
    
    @RequestMapping("/confirmation")
    public String showReservationConfirmation(Model model, @SessionAttribute("loginUser") Member loginUser) {
        String userNo = loginUser.getUserNo();
        List<Reservation> reservations = rService.getReservationsByUserNo(userNo);
        model.addAttribute("reservations", reservations);
        return "reservationconfirmation";
    }

    
} 