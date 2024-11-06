<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctoring Header</title>

    <link rel="stylesheet" href="<%=path %>/resources/css/default/defalut.css">
    <link rel="stylesheet" href="<%=path %>/resources/css/admin/Admin-header-style.css">

</head>
<body>
    <header class="header">
        <div class="logo">
            <img src="<%=path %>/resources/img/Doctoring.png" alt="주사기 아이콘" class="icon">
            <a href="#" class="logo-text">닥터링</a>
        </div>

        <!-- a태그 클릭시 페이지 이동 -->
        <nav class="nav-links">
            <a href="#">회원관리</a>
            <a href="#">병원관리</a>
            <a href="#">예약관리</a>
            <a href="#">게시글관리</a>
        </nav>
        <div class="login-menu">
            <a href="#">로그인</a>
            <div class="menu-icon">&#9776;</div>
        </div>
    </header>
</body>
</html>