package com.project.trinity.api.service;

import org.springframework.stereotype.Service;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

@Service
public class ApiService {
    public static final String SERVICE_KEY = "HKb7iVYQRtzR%2FuEZ1Vsv4sWyTa7YRFead%2BZQkrp15xBVAuqSFv0CtG0ihJb1DhRh%2BP7FryyPkgdxnIV2y%2FqBSA%3D%3D";

    public String getHospitalInfo(String sido, String sigungu, String department, int pageNo, int numOfRows) {
        String result = "";
        try {
            String url = "http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncListInfoInqire";
            url += "?serviceKey=" + SERVICE_KEY;
            url += "&returnType=json";
            
            // 필터 파라미터 추가
            url += "&Q0=" + URLEncoder.encode(sido, "UTF-8");       // 주소(시도)
            url += "&Q1=" + URLEncoder.encode(sigungu, "UTF-8");    // 주소(시군구)
            url += "&QD=" + URLEncoder.encode(department, "UTF-8"); // 진료과목
            url += "&pageNo=" + pageNo;                             // 페이지 번호
            url += "&numOfRows=" + numOfRows;                       // 목록 건수

            URL requestURL = new URL(url);
            HttpURLConnection urlConnection = (HttpURLConnection) requestURL.openConnection();
            urlConnection.setRequestMethod("GET");

            BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
            String line;
            while ((line = br.readLine()) != null) {
                result += line;
            }
            br.close();
            urlConnection.disconnect();

        } catch (Exception e) {
            e.printStackTrace();
            return "Error occurred while calling API";
        }
        return result;
    }
}
