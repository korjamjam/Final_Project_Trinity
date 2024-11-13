package com.project.trinity.hospital.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.trinity.hospital.model.vo.Hospital;
import com.project.trinity.hospital.service.HospitalService;

@Controller("/hospital")
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
