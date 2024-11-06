<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/account/login.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>

<!-- Header -->
<%@ include file="../common/FinalHeader.jsp"%>

<div class="login-container">
    <div class="input-group">
        <input type="text" placeholder="아이디">
        <span class="clear-icon" onclick="document.querySelector('.input-group input[type=text]').value = '';">✖</span>
    </div>
    <div class="input-group">
        <input type="password" placeholder="비밀번호">
        <span class="toggle-password" onclick="togglePassword()">👁</span>
    </div>
    <div class="checkbox-group">
        <input type="checkbox" id="keep-logged-in">
        <label for="keep-logged-in">로그인 상태 유지</label>
    </div>
    <button class="login-button">로그인</button>
    <div class="footer-links">
        <a href="#">아이디 찾기</a> | 
        <a href="#">비밀번호 찾기</a> |
        <a href="#">회원가입</a>
    </div>
</div>

<script>
    function togglePassword() {
        const passwordInput = document.querySelector('.input-group input[type=password]');
        const eyeIcon = document.querySelector('.toggle-password');
        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            eyeIcon.textContent = '🙈';
        } else {
            passwordInput.type = 'password';
            eyeIcon.textContent = '👁';
        }
    }
</script>

<!-- Footer -->
<%@ include file="../common/FinalFooter.jsp"%>

</body>
</html>
