package com.project.trinity.hospital.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
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
	public String hospitalList(Model model, @RequestParam(value="subjectType", defaultValue="all") String subjectType, @RequestParam(value="orderType", defaultValue="all") String orderType) {
		ArrayList<Hospital> list = hospitalService.selectHospitalList(subjectType, orderType);

		model.addAttribute("list", list);
		return "hospital_detail/hospital_list";
	}
	
	@RequestMapping("/detail")
	public String hospitalDetail(String hpId, Model m) {
		Hospital h = hospitalService.selectHospital(hpId);
		m.addAttribute("h",h);
		return "hospital_detail/hospital_detail";
	}
	
}
