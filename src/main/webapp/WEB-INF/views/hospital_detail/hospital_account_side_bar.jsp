<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>기업 회원 사이드바</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/admin/admin_sidebar.css">
</head>
<body>
	<!-- 사이드바 -->
	<div class="hamburger-sidebar" id="sidebar">
		<div class="hamburger-sidebar-header">
			<!-- 로그인된 상태라 로그아웃 버튼만 표시 -->
			<span class="hamburger-login-text" onclick="navigateToLogout()">로그아웃</span>
			<button class="hamburger-close-btn" onclick="toggleSidebar()">✕</button>
		</div>
		<div class="hamburger-sidebar-menu">
			<!-- 회원관리 -->
			<div class="sidebar-item">
				<a href="${pageContext.servletContext.contextPath}/hospital/account/doctor">
					<p>의사관리</p>
				</a>
			</div>
			<!-- 병원관리 -->
			<div class="sidebar-item">
				<a href="${pageContext.servletContext.contextPath}/hospital/account/myHospital">
					<p>병원관리</p>
				</a>
			</div>
			<!-- 예약관리 -->
			<div class="sidebar-item">
				<a href="${pageContext.servletContext.contextPath}/hospital/account/myReservation">
					<p>예약관리</p>
				</a>
			</div>
			<!-- 게시글관리 -->
			<div class="sidebar-item">
				<a href="${pageContext.servletContext.contextPath}/hospital/account/myPost">
					<p>게시글관리</p>
				</a>
			</div>
		</div>
	</div>

	<!-- JavaScript -->
	<script>
		// 사이드바 열고 닫기
		function toggleSidebar() {
			var sidebar = document.getElementById('sidebar');
			sidebar.classList.toggle('hamburger-show-sidebar');
		}

		// 로그아웃 처리
		function navigateToLogout() {
			// 로그아웃 요청
			window.location.href = "${pageContext.servletContext.contextPath}/hospital/account/logout";
		}
	</script>
</body>
</html>
