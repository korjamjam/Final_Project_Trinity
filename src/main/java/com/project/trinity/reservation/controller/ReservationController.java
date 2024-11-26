package com.project.trinity.reservation.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.trinity.hospital.model.vo.HospitalInfo;
import com.project.trinity.reservation.service.ReservationService;
import com.project.trinity.hospital.service.HospitalService;

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
    	if(userNo != null) {
    		int result = rService.insertgReservation(userNo, hosNo, resDate, resTime, subject, content);
    	} else {
    		int result = rService.insertgGuest(userName, birthday, phone, email, gender);
    		if(result != 0) {	//성공
    			System.out.println("게스트 입력 성공");
    			//여기부터 작성하면됨
    			//게스트를 일반 예약 테이블에 삽입하는 과정
    		} else {	//실패
    			System.out.println("게스트 입력 실패");
    		}
    	}
    	return "/main";
    }
    
}
