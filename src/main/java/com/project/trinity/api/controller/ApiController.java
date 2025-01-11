package com.project.trinity.api.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ApiController {
    public static final String SERVICE_KEY = "CgW4Hiix9takPucR5PSLrWfmoZ%2FkSPM%2FEpLAL8pcWJYFWb5qFCLs8%2BgU5m0ArTekGGo4m3e4JZ9SESlwpa3jXw%3D%3D"; // 실제 서비스 키로 교체하세요.

    @ResponseBody
    @GetMapping(value = "/hospital", produces = "application/json; charset=UTF-8")
    public String getHospitalInfo(
            @RequestParam(required = true) String sido, String sigungu,// sigungu 추가
            String hospitalType, String department,
            @RequestParam(defaultValue = "1") String pageNo,
            @RequestParam(defaultValue = "200") String numOfRows) throws Exception {

    	// API 요청 URL 생성
    	StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncListInfoInqire");
    	
    	System.out.println(urlBuilder.toString());
    	
    	urlBuilder.append("?serviceKey=").append(SERVICE_KEY);
    	urlBuilder.append("&returnType=json");
    	urlBuilder.append("&Q0=").append(URLEncoder.encode(sido, "UTF-8")); // 시도 파라미터 설정
    	if (sigungu != null && !sigungu.isEmpty()) {
    	    urlBuilder.append("&Q1=").append(URLEncoder.encode(sigungu, "UTF-8")); // 시군구 파라미터 설정
    	}
    	if (department != null && !department.isEmpty()) {
    	    urlBuilder.append("&QD=").append(URLEncoder.encode(department, "UTF-8")); // 진료 과목 파라미터 설정
    	}
    	urlBuilder.append("&pageNo=").append(pageNo);
    	urlBuilder.append("&numOfRows=").append(numOfRows);

        // API 호출
        URL requestURL = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) requestURL.openConnection();
        conn.setRequestMethod("GET");

        // API 응답 읽기
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        StringBuilder result = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            result.append(line);
        }
        br.close();
        conn.disconnect();

        // JSON으로 변환하여 반환
        JSONObject jsonResult = XML.toJSONObject(result.toString());
        return jsonResult.toString();
    }
}
