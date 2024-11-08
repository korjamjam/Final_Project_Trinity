<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctoring Admin Header</title>

    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/defalut.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/admin_header_style.css">
</head>
<body>
    <header class="header">
        <div class="logo">
            <img src="${ pageContext.servletContext.contextPath }/resources/img/Doctoring.png" alt="주사기 아이콘" class="icon">
            <a href="#" class="logo-text">닥터링</a>
        </div>

        <!-- a태그 클릭시 페이지 이동 -->
        <nav class="nav-links">
            <a href="">회원관리</a>
            <a href="#">병원관리</a>
            <a href="#">예약관리</a>
            <a href="#">게시글관리</a>
        </nav>
        <div class="login-menu">
        	<div class="right-rect"></div>
            <div class="menu-icon">&#9776;</div>
        </div>
    </header>
</body>
</html>