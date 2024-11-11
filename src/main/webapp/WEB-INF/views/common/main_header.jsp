<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="sidebar.jsp" %> <!-- 사이드바 포함 -->
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctoring Header</title>

    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/common/default.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/common/main_header_style.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/common/sidebar.css">
</head>
<body>
    <header class="header">
        <div class="logo">
            <img src="${pageContext.servletContext.contextPath}/resources/img/Doctoring.png" alt="주사기 아이콘" class="icon"> 
            <a href="main" class="logo-text">닥터링</a>
        </div>
        <nav class="nav-links">
            <div class="dropdown">
                <a href="hospital_list">병원찾기</a>
            </div>
            <div class="dropdown">
                <a href="#">종합예약</a>
                <div class="dropdown-content">
                    <a href="general_reservation">진료예약</a>
                    <a href="#">백신예약</a>
                    <a href="#">예약확인</a>
                </div>
            </div>
            <div class="dropdown">
                <a href="#">건강검진</a>
                <div class="dropdown-content">
                    <a href="#">국가 검진 예약</a>
                    <a href="#">검진 예약 안내</a>
                    <a href="#">검진 절차 예약</a>
                    <a href="#">검진 결과 조회</a>
                    <a href="#">검사 항목 정보</a>
                </div>
            </div>
            <div class="dropdown">
                <a href="community_main.me">커뮤니티</a>
                <div class="dropdown-content">
                    <a href="community_main.me">인기</a>
                    <a href="community_free.me">자유</a>
                    <a href="community_medical.me">의료 소통</a>
                    <a href="community_event.me">이벤트</a>
                </div>
            </div>
            <div class="dropdown">
                <a href="inquiry_notification.me">고객문의</a>
                <div class="dropdown-content">
                    <a href="inquiry_notification.me">공지사항</a>
                    <a href="inquiry_notice.me">알림판</a>
                    <a href="inquiry_faq.me">FAQ</a>
                    <a href="inquiry_qna.me">Q&A</a>
                </div>
            </div>
        </nav>
        <div class="login-menu">
            <a href="login_main.me">로그인</a>
            <div class="menu-icon" onclick="toggleSidebar()">&#9776;</div>
        </div>
    </header>

    <!-- JavaScript to toggle the sidebar -->
    <script>
        function toggleSidebar() {
            document.querySelector('.hamburger-sidebar').classList.toggle('hamburger-show-sidebar');
        }

        // Close button in sidebar
        const closeBtn = document.querySelector('.hamburger-close-btn');
        if (closeBtn) {
            closeBtn.addEventListener('click', toggleSidebar);
        }
    </script>
</body>
</html>
