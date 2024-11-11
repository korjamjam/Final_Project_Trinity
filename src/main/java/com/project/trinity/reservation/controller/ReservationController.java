package com.project.trinity.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReservationController {
	
	@GetMapping("general_reservation")
	public String generalReservation() {
		return "reservation/general_reservation";
	}
}
