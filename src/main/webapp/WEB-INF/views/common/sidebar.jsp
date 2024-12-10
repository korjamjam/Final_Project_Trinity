<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- JSP 페이지 지시어: UTF-8 설정 -->

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8"> <!-- 문서의 문자 인코딩 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 반응형 웹을 위한 뷰포트 설정 -->
<title>사이드바 메뉴</title>
<link rel="stylesheet"
    href="${pageContext.servletContext.contextPath}/resources/css/common/sidebar.css"> <!-- CSS 파일 연결 -->
</head>
<body>
    <!-- 사이드바 -->
    <div class="hamburger-sidebar" id="sidebar">
    
        <!-- 사이드바 헤더 -->
        <div class="hamburger-sidebar-header">
        
            <c:choose> <%-- 로그인 상태에 따라 분기 처리 --%>
                <c:when test="${empty loginUser}"> <%-- 로그인되지 않은 경우 --%>
                    <span class="hamburger-login-text" onclick="navigateToLogin()">로그인</span>
                    <button class="hamburger-close-btn" onclick="toggleSidebar()">✕</button>
                </c:when>
                <c:otherwise> <%-- 로그인된 경우 --%>
                    <span class="hamburger-login-text" onclick="navigateToLogout()">로그아웃</span>
                    <button class="hamburger-close-btn" onclick="toggleSidebar()">✕</button>
                </c:otherwise>
            </c:choose>
        </div>
        
        <!-- 사이드바 메뉴 -->
        <div class="hamburger-sidebar-menu">
        
            <!-- 병원찾기 메뉴 -->
            <div class="sidebar-item" onclick="toggleSubmenu(this)">
                <a href="${pageContext.request.contextPath}/hospital/list">
	                <div class="sidebar-main">병원찾기</div>
                </a> 
            </div>
            
            <!-- 종합예약 메뉴 -->
            <div class="sidebar-item">
                <div class="sidebar-main">
                    <a href="${pageContext.request.contextPath}/reservation/form">종합예약</a> <!-- 종합예약 링크 -->
                    <button class="submenu-toggle" onclick="toggleSubmenu(this)"></button> <!-- 서브메뉴 토글 버튼 -->
                </div>
                <div class="sidebar-submenu"> <!-- 종합예약의 서브메뉴 -->
                    <a href="${pageContext.request.contextPath}/reservation/form" onclick="checkLogin()">진료예약</a>
                    <a href="${pageContext.request.contextPath}/healthReservation/vaccinepage1">백신예약</a>
                    <a href="${pageContext.request.contextPath}/healthReservation/reservationSearch">예약확인</a>
                </div>
            </div>
            
            <!-- 건강검진 메뉴 -->
            <div class="sidebar-item" onclick="toggleSubmenu(this)">
                <div class="sidebar-main">
                    <a href="${pageContext.request.contextPath}/healthReservation/reservation1">건강검진</a>
                    <button class="submenu-toggle" onclick="toggleSubmenu(this)"></button>
                </div>
                <div class="sidebar-submenu">
                    <a href="${pageContext.request.contextPath}/healthReservation/reservation1">국가검진예약</a>
                    <a href="${pageContext.request.contextPath}/healthReservation/guide">검진예약안내</a>
                    <a href="${pageContext.request.contextPath}/healthReservation/infoNomal">검진절차예약</a>
                    <a href="${pageContext.request.contextPath}/healthReservation/result">검진결과 조회</a>
                    <a href="${pageContext.request.contextPath}/healthReservation/itemsInfo">검사항목 정보</a>
                	<a href="${pageContext.request.contextPath}/healthReservation/search">검진 예약 조회</a>
                </div>
            </div>
            
            <!-- 커뮤니티 메뉴 -->
            <div class="sidebar-item" onclick="toggleSubmenu(this)">
                <div class="sidebar-main">
                    <a href="${pageContext.request.contextPath}/community/sideBarToBoard">커뮤니티</a>
                    <button class="submenu-toggle" onclick="toggleSubmenu(this)"></button>
                </div>
                <div class="sidebar-submenu">
                    <a href="${pageContext.request.contextPath}/community/sideBarToBoard">인기 게시글</a>

                    <a href="${pageContext.servletContext.contextPath}/community/sideBarToBoard?categoryId=CAT01"
                        id="free">자유게시판</a>
                    <a href="${pageContext.servletContext.contextPath}/community/sideBarToBoard?categoryId=CAT02"
                        id="meditalk">메디톡</a>
                    <a href="${pageContext.servletContext.contextPath}/community/sideBarToBoard?categoryId=CAT03"
                        id="event">이벤트게시판</a>
                </div>
            </div>
            
            <!-- 고객문의 메뉴 -->
            <div class="sidebar-item" onclick="toggleSubmenu(this)">
                <div class="sidebar-main">
                    <a href="${pageContext.request.contextPath}/inquiry/notification">고객문의</a>
                    <button class="submenu-toggle" onclick="toggleSubmenu(this)"></button>
                </div>
                <div class="sidebar-submenu">
                    <a href="${pageContext.request.contextPath}/inquiry/notification">공지사항</a>
                    <a href="${pageContext.request.contextPath}/inquiry/notice">알림판</a>
                    <a href="${pageContext.request.contextPath}/inquiry/faq">FAQ</a>
                    <a href="${pageContext.request.contextPath}/inquiry/qna">Q&A</a>
                </div>
            </div>
            
            <!-- 관리자 메뉴 (관리자 계정일 경우에만 보임) -->
            <c:choose>
                <c:when test="${loginUser != null && loginUser.isAdmin == 'Y'}">
                    <div class="sidebar-item">
                        <a href="${pageContext.request.contextPath}/admin/main">
                            <div class="sidebar-main">관리자</div>
                        </a>
                    </div>
                </c:when>
            </c:choose>
        </div>
    </div>

    <script>
        // 서브메뉴 토글 함수
        function toggleSubmenu(button) {
    const submenu = button.parentElement.nextElementSibling; // 서브메뉴 요소 찾기
    console.log(submenu);
    
    // submenu가 null이 아닌지 확인
    if (submenu) {
        submenu.classList.toggle('active'); // 서브메뉴 활성화/비활성화
        button.classList.toggle('active'); // 화살표 회전
    } else {
        console.error("submenu not found!");
    }
}


        // 로그인 페이지 이동
        function navigateToLogin() {
            window.location.href = "${pageContext.request.contextPath}/member/login";
        }

        // 로그아웃 처리
        function navigateToLogout() {
            window.location.href = "${pageContext.request.contextPath}/member/logout";
        }
    </script>

</body>
</html>
