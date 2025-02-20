**공공데이터포털 병원 조회 API 연동**
- 공공데이터포털에서 제공하는 병원 정보 API를 활용하여 병원 목록을 조회
- 시/도, 시/군/구, 진료 과목을 입력하여 병원 검색 가능
- XML 응답 데이터를 JSON으로 변환하여 클라이언트에 반환
- `ApiController`에서 `HttpURLConnection`을 이용해 API 호출 후 데이터를 가공하여 반환
- **사용한 기술**: `Spring MVC`, `HttpURLConnection`, `org.json.XML`, `Oracle DB`, `JSP`

**병원 검색 데이터 저장 (DB 연동)**
- 병원 검색 API에서 받은 데이터를 `Oracle DB`에 저장
- `JsonToDatabase` 클래스에서 API 응답을 처리하여 `HOSPITAL_KID` 테이블에 삽입
- `JDBC`를 활용하여 데이터베이스 연결 및 `INSERT` 실행
- **사용한 기술**: `JDBC`, `PreparedStatement`, `MyBatis`, `Spring Boot`
