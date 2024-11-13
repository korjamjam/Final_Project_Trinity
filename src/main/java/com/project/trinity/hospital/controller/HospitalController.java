package com.project.trinity.hospital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HospitalController {
	
	@GetMapping("hospital.list")
	public String hospitalList() {
		return "hospital_detail/hospital_list";
	}
	
	@GetMapping("hospital.detail")
	public String hospitalDetail() {
		return "hospital_detail/hospital_detail";
	}
	
}
