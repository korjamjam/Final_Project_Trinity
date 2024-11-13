package com.project.trinity.hospital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/trinity/hospital")
public class HospitalController {
	@GetMapping("/list")
	public String hospitalList() {
		return "hospital_detail/hospital_list";
	}
	
	@GetMapping("/detail")
	public String hospitalDetail() {
		return "hospital_detail/hospital_detail";
	}
	
}
