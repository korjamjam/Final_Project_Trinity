package com.project.trinity.api.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;

public class JsonToDatabase {

    // 데이터베이스 연결 정보
    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String DB_USER = "TRINITY";
    private static final String DB_PASSWORD = "TRINITY";
    private static final String API_KEY = "CgW4Hiix9takPucR5PSLrWfmoZ%2FkSPM%2FEpLAL8pcWJYFWb5qFCLs8%2BgU5m0ArTekGGo4m3e4JZ9SESlwpa3jXw%3D%3D"; // 발급받은 API 키를 입력하세요.

    public static void main(String[] args) {
        int numOfRows = 50; // 가져올 데이터 수
        String sido = "서울특별시"; // 시/도
        String sigungu = "강남구"; // 시/군/구
        String department = "D011"; // 진료 과목 (소아과)

        try {
            // API URL 구성 (파라미터를 포함하여 API 요청 URL을 생성)
            String apiUrl = "http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncListInfoInqire?"
                    + "serviceKey=" + API_KEY
                    + "&Q0=" + URLEncoder.encode(sido, "UTF-8")
                    + "&Q1=" + URLEncoder.encode(sigungu, "UTF-8")
                    + "&QD=" + department
                    + "&numOfRows=" + numOfRows;
            System.out.println(apiUrl); // 생성된 API URL을 출력

            // API 요청을 보내고 응답을 받음
            URL url = new URL(apiUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            // 응답 데이터를 읽기 위한 BufferedReader 설정
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            StringBuilder content = new StringBuilder();
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                content.append(inputLine);
            }
            in.close(); // BufferedReader 종료
            conn.disconnect(); // HTTP 연결 종료

            // XML 응답 데이터를 JSON으로 변환
            JSONObject jsonObject = XML.toJSONObject(content.toString());

            // JSON 전체 응답 구조 출력 (응답 구조를 확인하기 위함)
            System.out.println("API 응답 JSON: " + jsonObject.toString(4)); // 들여쓰기로 보기 쉽게 출력

            // JSON 구조 확인 및 데이터 저장
            if (jsonObject.has("response") && jsonObject.getJSONObject("response").has("body") 
                    && jsonObject.getJSONObject("response").getJSONObject("body").has("items")) {
                
                // 응답 데이터에서 병원 정보 항목을 가져옴
                Object itemsObject = jsonObject.getJSONObject("response")
                                                .getJSONObject("body")
                                                .getJSONObject("items")
                                                .get("item");

                JSONArray items;
                // 데이터가 여러 개일 경우 JSONArray로 변환, 단일 데이터일 경우 JSONArray에 추가하여 처리
                if (itemsObject instanceof JSONArray) {
                    items = (JSONArray) itemsObject; // 여러 개의 병원 데이터가 있을 경우
                } else {
                    items = new JSONArray();
                    items.put(itemsObject); // 단일 병원 데이터가 있을 경우
                }

                // 데이터베이스 연결
                Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                String sql = "INSERT INTO HOSPITAL_KID (name, address, division, department, start_time, end_time, hpid, latitude, longitude) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);

                // 각 병원 정보를 데이터베이스에 저장
                for (int i = 0; i < items.length(); i++) {
                    JSONObject item = items.getJSONObject(i);

                    preparedStatement.setString(1, item.optString("dutyName", "")); // 병원 이름
                    preparedStatement.setString(2, item.optString("dutyAddr", "")); // 병원 주소
                    preparedStatement.setString(3, item.optString("dutyDivNam", "")); // 병원 구분
                    preparedStatement.setString(4, item.optString("dutyEmclsName", "")); // 진료 과목
                    preparedStatement.setString(5, item.optString("dutyTime1s", "")); // 진료 시작 시간
                    preparedStatement.setString(6, item.optString("dutyTime1c", "")); // 진료 종료 시간
                    preparedStatement.setString(7, item.optString("hpid", "")); // 병원 ID
                    preparedStatement.setDouble(8, item.optDouble("wgs84Lat", 0)); // 위도
                    preparedStatement.setDouble(9, item.optDouble("wgs84Lon", 0)); // 경도

                    // SQL 문 실행하여 데이터 저장
                    preparedStatement.executeUpdate();
                }

                // PreparedStatement 및 데이터베이스 연결 종료
                preparedStatement.close();
                connection.close();
                System.out.println("데이터가 성공적으로 저장되었습니다.");
            } else if (jsonObject.has("OpenAPI_ServiceResponse")) {
                // 인증 오류 또는 기타 오류 메시지 처리
                JSONObject errorMsg = jsonObject.getJSONObject("OpenAPI_ServiceResponse").optJSONObject("cmmMsgHeader");
                if (errorMsg != null) {
                    System.out.println("오류 메시지: " + errorMsg.optString("returnAuthMsg"));
                    System.out.println("오류 코드: " + errorMsg.optInt("returnReasonCode"));
                } else {
                    System.out.println("API 응답에 'cmmMsgHeader' 정보가 없습니다.");
                }
            } else {
                // 예기치 않은 JSON 구조일 경우 출력
                System.out.println("JSON 구조가 예상과 다릅니다.");
            }

        } catch (Exception e) {
            // 예외 처리
            e.printStackTrace();
        }
    }
}
