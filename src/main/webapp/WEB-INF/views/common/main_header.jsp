<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="sidebar.jsp" %> <!-- 사이드바 포함 -->
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctoring Header</title>
    
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/main_header_style.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/sidebar.css">
</head>
<body>
    <header class="header">
        <div class="logo">
            <img src="${ pageContext.servletContext.contextPath }/resources/img/Doctoring.png" alt="주사기 아이콘" class="icon"> 
            <a href="main" class="logo-text">닥터링</a>
        </div>
        <nav class="nav-links">
            <div class="dropdown"><a href="#">병원찾기</a></div>
            <div class="dropdown"><a href="#">종합예약</a></div>
            <div class="dropdown"><a href="#">건강검진</a></div>
            <div class="dropdown"><a href="community_main.me">커뮤니티</a></div>
            <div class="dropdown"><a href="inquiry_notification.me">고객문의</a></div>
        </nav>
        <div class="login-menu">
            <a href="login_main.me">로그인</a>
            <div class="menu-icon" onclick="toggleSidebar()">&#9776;</div>
        </div>
    </header>

    <!-- 사이드바 스크립트 -->
    <script>
        function toggleSidebar() {
            document.querySelector('.sidebar').classList.toggle('show-sidebar');
        }
        document.querySelector('.close-btn').addEventListener('click', toggleSidebar);
    </script>
</body>
</html>
