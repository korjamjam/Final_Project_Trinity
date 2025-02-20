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

/**
 * ApiController - 공공데이터포털 병원 정보 API 연동 컨트롤러
 * 
 * - 공공데이터포털에서 제공하는 병원 정보를 조회하여 JSON 형식으로 반환
 * - 사용자가 입력한 지역 정보(시도, 시군구) 및 진료 과목을 기반으로 병원 목록을 검색
 * - XML 응답을 JSON 형식으로 변환하여 제공
 */
@Controller
public class ApiController {

    // 공공데이터포털 API에서 제공하는 병원 검색 서비스 키 (URL 인코딩된 상태)
    // 실제 개발자 서비스
    public static final String SERVICE_KEY = "CgW4Hiix9takPucR5PSLrWfmoZ%2FkSPM%2FEpLAL8pcWJYFWb5qFCLs8%2BgU5m0ArTekGGo4m3e4JZ9SESlwpa3jXw%3D%3D";

    /**
     * 공공데이터포털 병원 정보 조회 API
     * 
     * - 사용자가 입력한 `sido`(시도), `sigungu`(시군구), `department`(진료 과목)에 해당하는 병원 정보를 조회
     * - API 요청 후 XML 응답을 JSON 형식으로 변환하여 반환
     * - `@ResponseBody`를 사용하여 JSON 데이터를 직접 응답
     *
     * @param sido (필수) 시도명
     * @param sigungu (선택) 시군구명
     * @param hospitalType (선택) 병원 유형
     * @param department (선택) 진료 과목 코드
     * @param pageNo (선택) 페이지 번호 (기본값: 1)
     * @param numOfRows (선택) 페이지당 조회할 병원 수 (기본값: 200)
     * @return JSON 형식의 병원 정보 데이터
     * @throws Exception API 요청 또는 응답 처리 중 발생한 예외
     */
    
    @ResponseBody //JSON 데이터를 직접 반환
    @GetMapping(value = "/hospital", produces = "application/json; charset=UTF-8")
    public String getHospitalInfo(
            @RequestParam(required = true) String sido, // 필수 요청 파라미터 (시도)
            String sigungu, // 선택 요청 파라미터 (시군구)
            String hospitalType, // 선택 요청 파라미터 (병원 유형)
            String department, // 선택 요청 파라미터 (진료 과목 코드)
            @RequestParam(defaultValue = "1") String pageNo, // 기본값 1 (페이지 번호)
            @RequestParam(defaultValue = "200") String numOfRows // 기본값 200 (조회할 데이터 개수)
    ) throws Exception {

        // 공공데이터포털 API 요청 URL 생성
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncListInfoInqire");
        
        System.out.println(urlBuilder.toString()); // 생성된 API URL을 확인하는 디버깅 로그

        //필수 파라미터 추가
        urlBuilder.append("?serviceKey=").append(SERVICE_KEY); // API 키 추가
        urlBuilder.append("&returnType=json"); // 응답 형식을 JSON으로 설정
        urlBuilder.append("&Q0=").append(URLEncoder.encode(sido, "UTF-8")); // 시도 파라미터 (URL 인코딩)

        //선택적 파라미터 추가
        if (sigungu != null && !sigungu.isEmpty()) {
            urlBuilder.append("&Q1=").append(URLEncoder.encode(sigungu, "UTF-8")); // 시군구 파라미터 (URL 인코딩)
        }
        if (department != null && !department.isEmpty()) {
            urlBuilder.append("&QD=").append(URLEncoder.encode(department, "UTF-8")); // 진료 과목 파라미터 (URL 인코딩)
        }
        urlBuilder.append("&pageNo=").append(pageNo); // 페이지 번호 설정
        urlBuilder.append("&numOfRows=").append(numOfRows); // 페이지당 데이터 개수 설정

        //API 요청 보내기
        URL requestURL = new URL(urlBuilder.toString()); // URL 객체 생성
        HttpURLConnection conn = (HttpURLConnection) requestURL.openConnection(); // HTTP 연결
        conn.setRequestMethod("GET"); // HTTP GET 요청 설정

        //API 응답 데이터 읽기
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8")); // 응답 데이터를 UTF-8로 읽기
        StringBuilder result = new StringBuilder();
        String line;

        //API 응답을 한 줄씩 읽어서 저장
        while ((line = br.readLine()) != null) {
            result.append(line);
        }
        br.close(); // BufferedReader 닫기
        conn.disconnect(); // HTTP 연결 종료

        //XML 응답을 JSON 형식으로 변환
        JSONObject jsonResult = XML.toJSONObject(result.toString()); // org.json.XML 라이브러리를 이용하여 변환

        //최종 변환된 JSON 데이터를 반환
        return jsonResult.toString();
    }
}
