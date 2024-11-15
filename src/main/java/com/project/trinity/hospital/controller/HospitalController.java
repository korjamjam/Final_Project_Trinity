package com.project.trinity.hospital.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.trinity.hospital.model.vo.HospitalInfo;
import com.project.trinity.hospital.service.HospitalService;

@Controller
@RequestMapping("hospital")
public class HospitalController {
	private final HospitalService hospitalService;
	
	@Autowired
	public HospitalController(HospitalService hospitalService) {
		this.hospitalService = hospitalService;
	}
	
	@RequestMapping("/list")
	public String hospitalList(@RequestParam(value = "subject", defaultValue = "listAll") String subject,
	        				   @RequestParam(value = "order", defaultValue = "ASC") String order, 
	        				   Model m) {
		System.out.println(subject);
		System.out.println(order);
		ArrayList<HospitalInfo> list = hospitalService.selectHospitalList(subject, order);
		m.addAllAttributes(list);
		return "hospital_detail/hospital_list";
	}
	
	@RequestMapping("/detail")
	public String hospitalDetail(String hpId, Model m) {
		HospitalInfo h = hospitalService.selectHospital(hpId);
		m.addAttribute("h",h);
		return "hospital_detail/hospital_detail";
	}
	
}
