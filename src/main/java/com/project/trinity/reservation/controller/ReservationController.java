package com.project.trinity.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller("/reservation")
public class ReservationController {
	
	@GetMapping("/form")
	public String generalReservation() {
		return "reservation/general_reservation";
	}
}
