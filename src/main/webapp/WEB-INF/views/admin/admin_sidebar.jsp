<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>사이드바 메뉴</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/admin/admin_sidebar.css">
</head>
<body>
	<!-- 사이드바 -->
	<div class="hamburger-sidebar" id="sidebar">
		<div class="hamburger-sidebar-header">
			<span class="hamburger-login-text" onclick="navigateToLogin()">로그인</span>
			<button class="hamburger-close-btn" onclick="toggleSidebar()">✕</button>
		</div>
		<div class="hamburger-sidebar-menu">
			<div class="sidebar-item" onclick="toggleSubmenu(this)">
				<a href="member"><p>회원관리</p></a>
			</div>
			<div class="sidebar-item" onclick="toggleSubmenu(this)">
				<a href="hospital"><p>병원관리</p></a>
			</div>
			<div class="sidebar-item" onclick="toggleSubmenu(this)">
				<a href="reservation"><p>예약관리</p></a>
			</div>
			<div class="sidebar-item" onclick="toggleSubmenu(this)">
				<a href="post"><p>게시글관리</p></a>
			</div>
			<div class="sidebar-item">
    		<a href="${pageContext.servletContext.contextPath}/main"><p>메인페이지</p></a>
			</div>
		</div>
	</div>

	<!-- JavaScript for Sidebar Toggle and Accordion Menu -->
	<script>
    function toggleSidebar() {
        var sidebar = document.getElementById('sidebar');
        sidebar.classList.toggle('hamburger-show-sidebar');
    }

    function toggleSubmenu(element) {
        var allSubmenus = document.querySelectorAll('.sidebar-submenu');
        for (var i = 0; i < allSubmenus.length; i++) {
            allSubmenus[i].style.display = 'none';
        }

        var submenu = element.querySelector('.sidebar-submenu');
        if (submenu) {
            submenu.style.display = 'block';
        }
    }

    function navigateToLogin() {
        window.location.href = "login_main.me"; // 로그인 페이지로 이동
    }
</script>

</body>
</html>
