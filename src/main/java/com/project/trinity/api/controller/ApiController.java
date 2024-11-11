package com.project.trinity.api.controller;

import com.project.trinity.api.service.ApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ApiController {

    private final ApiService apiService;

    @Autowired
    public ApiController(ApiService apiService) {
        this.apiService = apiService;
    }

    // hospitals 페이지를 위한 매핑
    @GetMapping("/hospitals")
    public String showHospitalsPage(
            @RequestParam(required = false) String sido,
            @RequestParam(required = false) String sigungu,
            @RequestParam(required = false) String department,
            Model model) {
        
        if (sido != null && department != null) {
            String hospitalInfo = apiService.getHospitalInfo(sido, sigungu, department, 1, 10);
            model.addAttribute("hospitalInfo", hospitalInfo);
        }
        return "hospitals"; // hospitals.jsp로 포워딩
    }
}
