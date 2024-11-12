package com.project.trinity.api.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ApiController {
	public static final String SERVICE_KEY = "HKb7iVYQRtzR%2FuEZ1Vsv4sWyTa7YRFead%2BZQkrp15xBVAuqSFv0CtG0ihJb1DhRh%2BP7FryyPkgdxnIV2y%2FqBSA%3D%3D";
    @GetMapping("/hospital")
    public String getHospitalInfo(
    		@RequestParam(required = true) String sido,
            String sigungu,
            String hospitalType,
            String department,
            @RequestParam(defaultValue = "1") String pageNo,
            @RequestParam(defaultValue = "200") String numOfRows,
            Model model) throws Exception {

        StringBuilder urlBuilder = new StringBuilder(
                "http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncListInfoInqire");
        urlBuilder.append("?serviceKey=" + SERVICE_KEY);
        urlBuilder.append("&returnType=xml");
        urlBuilder.append("&Q0=" + URLEncoder.encode(sido, "UTF-8"));
        if (sigungu != null) {
            urlBuilder.append("&Q1=" + URLEncoder.encode(sigungu, "UTF-8"));
        }
        if (hospitalType != null) {
            urlBuilder.append("&QZ=" + URLEncoder.encode(hospitalType, "UTF-8"));
        }
        if (department != null) {
            urlBuilder.append("&QD=" + URLEncoder.encode(department, "UTF-8"));
        }
        urlBuilder.append("&pageNo=" + pageNo);
        urlBuilder.append("&numOfRows=" + numOfRows);

        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder xmlResult = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            xmlResult.append(line);
        }
        br.close();
        conn.disconnect();

        // 특수 문자 및 제어 문자 제거
        String cleanXml = xmlResult.toString().replaceAll("[\\x00-\\x1F]", ""); // 제어 문자 제거
        cleanXml = cleanXml.replaceAll("\\p{C}", ""); // 다른 숨겨진 제어 문자 제거

        // XML 데이터를 JSON으로 변환
        JSONObject jsonResult = XML.toJSONObject(cleanXml);
        model.addAttribute("hospitalData", jsonResult.toString());

        return "hospital_test";
    }
	
}