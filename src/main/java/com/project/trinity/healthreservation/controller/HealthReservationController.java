package com.project.trinity.healthreservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/healthReservation")
public class HealthReservationController {

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
	
	@GetMapping("/vaccinepage1")
    public String vaccineReservation1() {
        return "health_reservation/vaccine_reservation1";
    }
    
    @GetMapping("/vaccinepage2")
    public String vaccineReservation2() {
        return "health_reservation/vaccine_reservation2";
    }
}
