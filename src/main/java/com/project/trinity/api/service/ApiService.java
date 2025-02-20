package com.project.trinity.api.service;

import org.springframework.stereotype.Service;
import java.io.BufferedReader; // **입력 스트림을 버퍼링하여 성능 향상**
import java.io.InputStreamReader; // **바이트 스트림을 문자 스트림으로 변환**
import java.net.HttpURLConnection; // **HTTP 요청을 위한 Java 기본 클래스**
import java.net.URL; // **API 요청을 위한 URL 객체**
import java.net.URLEncoder; // **한글 및 특수문자를 URL에서 안전하게 변환하는 클래스**

/**
 * API 서비스 클래스
 * - 외부 공공 데이터 포털(API)에서 병원 정보를 조회하는 서비스
 * - OpenAPI를 사용하여 JSON 데이터를 가져오는 기능 포함
 */
@Service // **Spring의 서비스 컴포넌트로 등록**
public class ApiService {
    
    // **공공 데이터 포털에서 발급받은 API 키 (인증을 위해 사용)**
    public static final String SERVICE_KEY = "HKb7iVYQRtzR%2FuEZ1Vsv4sWyTa7YRFead%2BZQkrp15xBVAuqSFv0CtG0ihJb1DhRh%2BP7FryyPkgdxnIV2y%2FqBSA%3D%3D";

    /**
     * 병원 정보를 외부 API에서 조회하는 메서드
     * 
     * @param sido        시/도 (필수)
     * @param sigungu     시/군/구 (선택)
     * @param department  진료 과목 (선택)
     * @param pageNo      페이지 번호 (페이징 처리)
     * @param numOfRows   한 페이지당 조회할 개수
     * @return API 응답 데이터 (JSON 형식)
     */
    public String getHospitalInfo(String sido, String sigungu, String department, int pageNo, int numOfRows) {
        StringBuilder result = new StringBuilder(); // **API 응답 데이터를 저장할 StringBuilder**
        try {
            //API 요청 URL 생성
            StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncListInfoInqire");
            
            // 필수 파라미터 추가 (서비스 키, 응답 타입, 시/도 정보)
            urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + SERVICE_KEY);
            urlBuilder.append("&" + URLEncoder.encode("returnType", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("Q0", "UTF-8") + "=" + URLEncoder.encode(sido, "UTF-8"));
            
            // 선택적 파라미터 추가 (시/군/구, 진료 과목)
            if (sigungu != null) {
                urlBuilder.append("&" + URLEncoder.encode("Q1", "UTF-8") + "=" + URLEncoder.encode(sigungu, "UTF-8"));
            }
            if (department != null) {
                urlBuilder.append("&" + URLEncoder.encode("QD", "UTF-8") + "=" + URLEncoder.encode(department, "UTF-8"));
            }
            
            // 페이징 처리
            urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(pageNo), "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(numOfRows), "UTF-8"));

            // URL 객체 생성
            URL requestURL = new URL(urlBuilder.toString());
            
            // HTTP 연결 객체 생성 및 요청 설정
            HttpURLConnection conn = (HttpURLConnection) requestURL.openConnection();
            conn.setRequestMethod("GET"); // **GET 방식으로 API 호출**
            conn.setRequestProperty("Content-type", "application/json"); // **JSON 형식의 응답을 요청**

            // API 응답 처리
            BufferedReader br;
            if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                //정상 응답(200~300번대)일 경우 InputStream에서 데이터 읽기
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                //오류 응답일 경우 ErrorStream에서 데이터 읽기
                br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }

            //응답 데이터를 한 줄씩 읽어서 result에 추
            String line;
            while ((line = br.readLine()) != null) {
                result.append(line);
            }
            br.close(); //스트림 종료
            conn.disconnect(); //HTTP 연결 종료
            
            System.out.println("API 호출 결과: " + result.toString()); //API 응답 출력 (디버깅용)

        } catch (Exception e) {
            e.printStackTrace();
            return "Error occurred while calling API"; // **예외 발생 시 에러 메시지 반환
        }

        return result.toString(); // JSON 응답 데이터 반환
    }
}
