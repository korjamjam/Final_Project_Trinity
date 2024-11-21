<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사이드바 메뉴</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/common/sidebar.css">
</head>
<body>
	<!-- 사이드바 -->
	<div class="hamburger-sidebar" id="sidebar">
		<div class="hamburger-sidebar-header">
		<c:choose>

            <c:when test="${empty loginUser}">
			<span class="hamburger-login-text" onclick="navigateToLogin()">로그인</span>
			<button class="hamburger-close-btn" onclick="toggleSidebar()">✕</button>
			</c:when>
			
			<c:otherwise>
			<span class="hamburger-login-text" onclick="navigateToLogout()">로그아웃</span>
			<button class="hamburger-close-btn" onclick="toggleSidebar()">✕</button>
			</c:otherwise>
        </c:choose>
		</div>
		<div class="hamburger-sidebar-menu">
			<div class="sidebar-item" onclick="toggleSubmenu(this)">
				<div class="sidebar-main" >병원찾기</div>
			</div>
			<div class="sidebar-item">
    <div class="sidebar-main">
        <a href="${pageContext.request.contextPath}/reservation/form">종합예약</a>
        <button class="submenu-toggle" onclick="toggleSubmenu(this)"></button>
    </div>
    <div class="sidebar-submenu">
        <a href="${pageContext.request.contextPath}/reservation/form" onclick="checkLogin()">진료예약</a>
        <a href="${pageContext.request.contextPath}/healthReservation/vaccinepage1">백신예약</a>
        <a href="#">예약확인</a>
    </div>
</div>
			<div class="sidebar-item" onclick="toggleSubmenu(this)">
				<div class="sidebar-main">
					<a href="${pageContext.request.contextPath}/healthReservation/reservation1">건강검진</a>
					<button class="submenu-toggle" onclick="toggleSubmenu(this)"></button></div>
				<div class="sidebar-submenu">
					<a href="${pageContext.request.contextPath}/healthReservation/reservation1">국가 검진 예약</a>
					<a href="${pageContext.request.contextPath}/healthReservation/guide">검진예약 안내</a>
					<a href="${pageContext.request.contextPath}/healthReservation/infoNomal">검진 절차 예약</a> 
					<a href="${pageContext.request.contextPath}/healthReservation/result">검진 결과 조회</a>
					<a href="${pageContext.request.contextPath}/healthReservation/itemsInfo">검사 항목 정보</a>
				</div>
			</div>
			<div class="sidebar-item" onclick="toggleSubmenu(this)">
				<div class="sidebar-main">
					<a href="${pageContext.request.contextPath}/community/main?type=popular">커뮤니티</a>
				<button class="submenu-toggle" onclick="toggleSubmenu(this)"></button></div>
				<div class="sidebar-submenu">
					<a href="${pageContext.request.contextPath}/community/main?type=popular">인기</a>
					<a href="${pageContext.request.contextPath}/community/main?type=free">자유</a>
					<a href="${pageContext.request.contextPath}/community/main?type=meditalk">의료 소통</a>
					<a href="${pageContext.request.contextPath}/community/main?type=event">이벤트</a>
				</div>
			</div>
			<div class="sidebar-item" onclick="toggleSubmenu(this)">
				<div class="sidebar-main">
				<a href="${pageContext.request.contextPath}/inquiry/notification">고객문의</a>
				<button class="submenu-toggle" onclick="toggleSubmenu(this)"></button></div>
				<div class="sidebar-submenu">
					<a href="${pageContext.request.contextPath}/inquiry/notification">공지사항</a>
					<a href="${pageContext.request.contextPath}/inquiry/notice">알림판</a>
					<a href="${pageContext.request.contextPath}/inquiry/faq">FAQ</a>
					<a href="${pageContext.request.contextPath}/inquiry/qna">Q&A</a>
				</div>
			</div>
			<div class="sidebar-item">
    		<a href="${pageContext.servletContext.contextPath}/admin/main">
    		<div class="sidebar-main">관리자</div></a>
			</div>
		</div>
	</div>

<script>
function toggleSubmenu(button) {
    const submenu = button.parentElement.nextElementSibling; // 서브메뉴 요소 찾기

    // 서브메뉴 열고 닫기
    submenu.classList.toggle('active');

    // 화살표 회전
    button.classList.toggle('active');
}

    function navigateToLogin() {
        window.location.href = "${pageContext.request.contextPath}/member/login";
    }

    function navigateToLogout() {
        window.location.href = "${pageContext.request.contextPath}/member/logout";
    }
</script>

</body>
</html>