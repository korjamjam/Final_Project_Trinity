package com.project.trinity.hospital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.trinity.hospital.model.vo.Hospital;
import com.project.trinity.hospital.service.HospitalService;

@Controller
@RequestMapping("/hospital")
public class HospitalController {
	@RequestMapping("/list")
	public String hospitalList() {
		return "hospital_detail/hospital_list";
	}
	
	@RequestMapping("/detail")
	public String hospitalDetail() {
		return "hospital_detail/hospital_detail";
	}
	
}
