<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctoring Admin Header</title>

    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/common/default.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/admin_header_style.css">
</head>
<body>
    <header class="header">
        <div class="logo">
            <img src="${pageContext.servletContext.contextPath}/resources/img/Doctoring.png" alt="주사기 아이콘" class="icon">
            <a href="main" class="logo-text">닥터링</a>
        </div>

        <!-- a태그 클릭시 페이지 이동 -->
        <nav class="nav-links">
            <a href="member">회원관리</a>
            <a href="hospital">병원관리</a>
            <a href="reservation">예약관리</a>
            <a href="post">게시글관리</a>
        </nav>
        <div class="login-menu">
            <div class="right-rect"></div>
            <div class="menu-icon" onclick="toggleSidebar()">&#9776;</div>
        </div>
    </header>

    <!-- admin_sidebar.jsp를 포함 -->
    <jsp:include page="admin_sidebar.jsp" />

    <!-- 분리된 JavaScript 파일 로드 -->
    <script src="${pageContext.servletContext.contextPath}/resources/js/admin/admin_header.js"></script>
</body>
</html>
