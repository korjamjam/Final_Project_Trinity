# 🏥 병원진료 예약 사이트

## 📌 프로젝트 개요
- **프로젝트명**: 병원진료 예약 사이트
- **깃허브 주소**: [GitHub Repository](https://github.com/korjamjam/Final_Project_Trinity/tree/jimin)
- **수행기간**: 2024.10.15 ~ 2024.12.12

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

## 🚀 실행 방법
```bash
# 프로젝트 클론
git clone https://github.com/korjamjam/Final_Project_Trinity.git

# 프로젝트 디렉토리 이동
cd Final_Project_Trinity

# Maven 빌드 및 실행
mvn clean install
mvn spring-boot:run
