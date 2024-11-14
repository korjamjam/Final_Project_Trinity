package com.project.trinity.hospital.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.trinity.hospital.model.vo.Hospital;
import com.project.trinity.hospital.service.HospitalService;

@Controller
@RequestMapping("/hospital")
public class HospitalController {
	private final HospitalService hospitalService;
	
	@Autowired
	public HospitalController(HospitalService hospitalService) {
		this.hospitalService = hospitalService;
	}
	
	@RequestMapping("/list")
	public String hospitalList() {
		return "hospital_detail/hospital_list";
	}
	
	@RequestMapping("/detail")
	public String hospitalDetail(String hpId, Model m) {
		Hospital h = hospitalService.selectHospital(hpId);
		m.addAttribute("h",h);
		return "hospital_detail/hospital_detail";
	}
	
}
