package com.project.trinity.hospital.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.trinity.hospital.model.vo.HospitalAccount;
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
		m.addAttribute("list", list);

		System.out.println(list);
		return "hospital_detail/hospital_list";
	}
	
	@RequestMapping("/list/api")
    @ResponseBody
    public ArrayList<HospitalInfo> hospitalListPaginated(@RequestParam(value = "subject", defaultValue = "listAll") String subject,
                                                         @RequestParam(value = "order", defaultValue = "ASC") String order,
                                                         @RequestParam(value = "page", defaultValue = "1") int page,
                                                         @RequestParam(value = "limit", defaultValue = "10") int limit) {
        return hospitalService.selectHospitalListPaginated(subject, order, page, limit);
    }
	
	@RequestMapping("/detail")
	public String hospitalDetail(String hosNo, Model m) {
		HospitalInfo h = hospitalService.selectHospital(hosNo);
		HospitalAccount hInfo = hospitalService.selectHospitalInfo(hosNo);
		m.addAttribute("h",h);
		m.addAttribute("hInfo",hInfo);
		System.out.println(hInfo);
		return "hospital_detail/hospital_detail";
	}
	
	@RequestMapping("/list/search")
	public String SearchHospital(@RequestParam("keyword") String keyword, Model m) {
		ArrayList<HospitalInfo> searchList = hospitalService.searchHospital(keyword);
		
		m.addAttribute("list", searchList);
		return "hospital_detail/hospital_list";
	}
	
	@RequestMapping("/list/openHos")
	public String OpenHospital(Model m) {
		ArrayList<HospitalInfo> searchList = hospitalService.openHospitalList();
		//여기부터 고치면됨. requestparam 추가하고 리스트 띄우기
		m.addAttribute("list", searchList);
		return "hospital_detail/hospital_list";
	}
}
