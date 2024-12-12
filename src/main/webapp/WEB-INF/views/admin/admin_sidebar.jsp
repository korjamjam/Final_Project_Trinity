<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 사이드바</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/admin/admin_sidebar.css">
</head>
<body>
	<script>
		const contextPath = '${pageContext.servletContext.contextPath}';
		</script>

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
				<a href="member">
					<p>회원관리</p>
				</a>
			</div>
			<!-- 병원관리 -->
			<div class="sidebar-item">
				<a href="hospital">
					<p>병원관리</p>
				</a>
			</div>
			<!-- 예약관리 -->
			<div class="sidebar-item">
				<a href="reservation">
					<p>예약관리</p>
				</a>
			</div>
			<!-- 게시글관리 -->
			<div class="sidebar-item">
				<a href="post">
					<p>게시글관리</p>
				</a>
			</div>
			<!-- 메인페이지 -->
			<div class="sidebar-item">
				<a href="${pageContext.servletContext.contextPath}/main">
				<p>메인페이지</p>
				</a>
			</div>
		</div>
	</div>

	<!-- JavaScript -->
	<script src="${pageContext.servletContext.contextPath}/resources/js/admin/admin_sidebar.js"></script>
		
</body>
</html>
