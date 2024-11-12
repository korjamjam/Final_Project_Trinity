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
        StringBuilder result = new StringBuilder();
        try {
            StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncListInfoInqire");
            urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + SERVICE_KEY);
            urlBuilder.append("&" + URLEncoder.encode("returnType", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("Q0", "UTF-8") + "=" + URLEncoder.encode(sido, "UTF-8"));
            if (sigungu != null) {
                urlBuilder.append("&" + URLEncoder.encode("Q1", "UTF-8") + "=" + URLEncoder.encode(sigungu, "UTF-8"));
            }
            if (department != null) {
                urlBuilder.append("&" + URLEncoder.encode("QD", "UTF-8") + "=" + URLEncoder.encode(department, "UTF-8"));
            }
            urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(pageNo), "UTF-8"));
            urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(numOfRows), "UTF-8"));

            URL requestURL = new URL(urlBuilder.toString());
            HttpURLConnection conn = (HttpURLConnection) requestURL.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-type", "application/json");

            BufferedReader br;
            if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }

            String line;
            while ((line = br.readLine()) != null) {
                result.append(line);
            }
            br.close();
            conn.disconnect();
            System.out.println("API 호출 결과: " + result.toString()); // API 응답 출력

        } catch (Exception e) {
            e.printStackTrace();
            return "Error occurred while calling API";
        }

        return result.toString();
    }
}
