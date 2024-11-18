package com.project.trinity.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reservation") // 클래스 레벨에 기본 경로 설정
public class ReservationController {
    
    @GetMapping("/form")
    public String generalReservation() {
        return "reservation/general_reservation";
        
    }
}
