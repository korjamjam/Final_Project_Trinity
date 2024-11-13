<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사이드바 아코디언 메뉴</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/common/sidebar.css">
</head>
<body> 
    <div class="hamburger-sidebar">
        <div class="hamburger-sidebar-header">
            <span class="hamburger-login-text">로그인</span>
            <button class="hamburger-close-btn">✕</button>
        </div>
        <ul class="hamburger-sidebar-menu">
            <!-- 병원찾기 -->
            <li class="accordion-item">
                <div class="accordion-header" onclick="toggleAccordion(this)">
                    <a href="#">병원찾기</a><span class="accordion-arrow">&gt;</span>
                </div>
                <ul class="dropdown-content">
                    <li><a href="hospital_list">병원찾기</a></li>
                </ul>
            </li>

            <!-- 예약 -->
            <li class="accordion-item">
                <div class="accordion-header" onclick="toggleAccordion(this)">
                    <a href="#">예약</a><span class="accordion-arrow">&gt;</span>
                </div>
                <ul class="dropdown-content">
                    <li><a href="#" onclick="checkLogin()">진료예약</a></li>
                    <li><a href="#">백신예약</a></li>
                    <li><a href="#">예약확인</a></li>
                </ul>
            </li>

            <!-- 건강검진 -->
            <li class="accordion-item">
                <div class="accordion-header" onclick="toggleAccordion(this)">
                    <a href="#">건강검진</a><span class="accordion-arrow">&gt;</span>
                </div>
                <ul class="dropdown-content">
                    <li><a href="health.reservation1">국가 검진 예약</a></li>
                    <li><a href="health.guide">검진 예약 안내</a></li>
                    <li><a href="health_reservation_info_nomal">검진 절차 예약</a></li>
                    <li><a href="health_reservation_result">검진 결과 조회</a></li>
                    <li><a href="health_reservation_items_info">검사 항목 정보</a></li>
                </ul>
            </li>

            <!-- 커뮤니티 -->
            <li class="accordion-item">
                <div class="accordion-header" onclick="toggleAccordion(this)">
                    <a href="#">커뮤니티</a><span class="accordion-arrow">&gt;</span>
                </div>
                <ul class="dropdown-content">
                    <li><a href="community_main.me">인기</a></li>
                    <li><a href="community_free.me">자유</a></li>
                    <li><a href="community_medical.me">의료 소통</a></li>
                    <li><a href="community_event.me">이벤트</a></li>
                </ul>
            </li>

            <!-- 고객문의 -->
            <li class="accordion-item">
                <div class="accordion-header" onclick="toggleAccordion(this)">
                    <a href="#">고객문의</a><span class="accordion-arrow">&gt;</span>
                </div>
                <ul class="dropdown-content">
                    <li><a href="inquiry_notification.me">공지사항</a></li>
                    <li><a href="inquiry_notice.me">알림판</a></li>
                    <li><a href="inquiry_faq.me">FAQ</a></li>
                    <li><a href="inquiry_qna.me">Q&A</a></li>
                </ul>
            </li>
        </ul>
    </div>

    <script>
        function toggleAccordion(header) {
            const allContents = document.querySelectorAll('.dropdown-content');
            const currentContent = header.nextElementSibling;

            if (!currentContent.classList.contains('active')) {
                allContents.forEach(content => content.classList.remove('active'));
            }

            const allArrows = document.querySelectorAll('.accordion-arrow');
            const currentArrow = header.querySelector('.accordion-arrow');
            allArrows.forEach(arrow => arrow.classList.remove('rotate'));
            
            currentContent.classList.toggle('active');
            currentArrow.classList.toggle('rotate');
        }
    </script>
</body>
</html>
