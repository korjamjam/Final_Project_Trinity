package com.project.trinity.hospital.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.trinity.hospital.model.vo.Hospital;
import com.project.trinity.hospital.service.HospitalService;

@Controller
public class HospitalController {
	
	private final HospitalService hospitalService;
	
	@Autowired
	public HospitalController(HospitalService hospitalService) {
		this.hospitalService = hospitalService;
	}
	
	@GetMapping("hospital_list")
	public String hospitalList() {
		return "hospital_detail/hospital_list";
	}
	
	@GetMapping("hospital_detail")
	public String hospitalDetail(String hpId, Model m) {
		
	
		
		return "hospital_detail/hospital_detail";
	}
	
}
