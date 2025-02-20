# 🏥 병원진료 예약 사이트

## 📌 프로젝트 개요
- **프로젝트명**: 병원진료 예약 사이트
- **수행기간**: 2024.10.16 ~ 2024.12.12

## 🎯 개발 목표
- 진료, 백신, 건강검진 예약 시스템을 통해 사용자에게 의료 예약 기능을 제공하여 사회적 편의성을 증대
- 커뮤니티 기능을 활용하여 사용자 간 정보 공유와 소통을 강화하고, 실질적인 커뮤니케이션 공간 제공
- 기존 여러 서비스와 차별화된 기능을 통해 사용자 만족도를 높이고, 시장 내 경쟁력을 확보

---

## 🛠️ 기술 스택 및 개발 환경

| 항목            | 내용 |
|----------------|----------------------|
| **운영체제** | Windows 10 |
| **사용 언어** | Java(JDK 18), JavaScript, HTML5, CSS3 |
| **Framework / Library** | Spring Framework 5.3.22, Apache Maven 3.9.9 |
| **DB** | Oracle DB 21.4.3 |
| **Tool** | STS 3.9.13, Visual Studio Code |
| **WAS** | Apache Tomcat 9.0.95 |
| **Collaboration** | GitHub, Trello |
| **API** | MyBatis, Kakao Maps API |

---

## 🔥 주요 기능
### 🏥 진료 및 예약 기능
- **로그인 및 회원 관리**: 마이페이지를 통한 개인 정보 수정 기능
- **병원 검색 및 예약**:  
  - 병원 검색 및 예약, 예약 정보 조회 기능
  - AI를 활용한 맞춤형 진료 추천 기능
- **백신 예약 기능**:  
  - 개인 진료와 연계한 백신 예약 기능
  - 예방접종 예약 및 백신 정보 제공
- **건강검진 예약 기능**:  
  - 건강검진 항목 별 맞춤형 검진 추천 및 소통 기능

### 🔧 관리자 페이지
- **병원 정보 관리**: 병원 정보 수정
- **예약 관리**: 예약 내역 수정
- **게시판 관리**: 게시글 관리 및 수정

---

### **📌 맡은 기능 설명**

#### **🏥 병원 검색 API**
- **공공데이터포털 병원 조회 API 연동**
  - 공공데이터포털에서 제공하는 병원 정보 API를 활용하여 병원 목록을 조회
  - 시/도, 시/군/구, 진료 과목을 입력하여 병원 검색 가능
  - XML 응답 데이터를 JSON으로 변환하여 클라이언트에 반환
  - `ApiController`에서 `HttpURLConnection`을 이용해 API 호출 후 데이터를 가공하여 반환

- **병원 검색 데이터 저장 (DB 연동)**
  - 병원 검색 API에서 받은 데이터를 `Oracle DB`에 저장
  - `JsonToDatabase` 클래스에서 API 응답을 처리하여 `HOSPITAL_KID` 테이블에 삽입
  - `JDBC`를 활용하여 데이터베이스 연결 및 `INSERT` 실행

---

#### **💉 백신 예약 기능**
- **백신 예약 페이지 구현**
  - `VaccineReservationController`에서 백신 예약 페이지 이동 처리 (`vaccinepage1`, `vaccinepage2`)
  - 병원 목록 조회 후 예약 페이지에서 선택할 수 있도록 구현

- **백신 예약 신청 기능**
  - 로그인한 사용자와 비회원의 예약을 구분하여 처리
  - `HttpSession`을 이용해 로그인 여부 확인 후 **회원**은 `USER_NO`, **비회원**은 `GST_NO`를 생성하여 관리
  - **백신 예약 정보가 DB에 저장됨**

- **백신 예약 신청 (AJAX)**
  - 백신 예약을 `AJAX` 요청으로 처리하여 비동기 방식으로 예약 등록 가능
  - `@ResponseBody`를 사용하여 JSON 응답을 반환
  - 입력 값 검증 및 예외 처리 (`IllegalArgumentException`)

---

#### **🛠 관리자 페이지**
- **회원 관리**
  - `AdminController`에서 회원 목록을 조회하고, 특정 회원의 상세 정보를 확인할 수 있도록 구현
  - 역할별 필터링 기능 (의사, 관리자, 일반 회원) 제공
  - `updateMember()`를 통해 회원 정보를 수정 가능

- **병원 관리**
  - 관리자 페이지에서 병원 목록을 조회하고, 특정 병원의 상세 정보를 확인 가능
  - `updateHospital()`을 통해 병원 정보를 수정 가능

- **예약 관리**
  - 관리자가 모든 예약 내역을 확인하고, 예약 상세 정보를 조회할 수 있도록 구현
  - `AdminController`에서 예약 데이터를 가져와 `Model`을 통해 `JSP`로 전달

- **게시판 관리**
  - 관리자가 게시판의 게시글을 조회하고 관리할 수 있도록 구현
  - `AdminController`에서 게시글 목록을 조회하여 `admin_post.jsp`로 전달


