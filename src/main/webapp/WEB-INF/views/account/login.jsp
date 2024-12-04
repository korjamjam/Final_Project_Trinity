<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<%@ include file="../common/main_header.jsp"%>

<!-- 메시지 알림 -->
<script>
    <% if (request.getAttribute("message") != null) { %>
        alert("<%= request.getAttribute("message") %>");
    <% } %>
</script>

<div class="login-page">
    <div class="login-container">
        <form action="${pageContext.request.contextPath}/member/login" method="post">
            <div class="login-input-group">
                <input type="text" name="userId" placeholder="아이디" required>
                <span class="login-clear-icon" onclick="clearInput('userId')">✖</span>
            </div>
            <div class="login-input-group">
                <input type="password" name="userPwd" placeholder="비밀번호" id="password-input" required>
                <span class="login-toggle-password" onclick="togglePassword()">👁</span>
            </div>
            <div class="login-checkbox-group">
                <input type="checkbox" id="keep-logged-in" name="keepLoggedIn">
                <label for="keep-logged-in">로그인 유지</label>
            </div>
            <button type="submit" class="login-button">로그인</button>
        </form>
        <div class="login-footer-links">
            <a href="${pageContext.request.contextPath}/member/search_id">아이디 찾기</a> | 
            <a href="${pageContext.request.contextPath}/member/search_pwd">비밀번호 찾기</a> |
            <a href="${pageContext.request.contextPath}/member/sign_up">회원가입</a> |
            <a href="${pageContext.request.contextPath}/hospital/account/login">기업 사용자</a> <!-- 병원 로그인 연결 -->
        </div>
    </div>
</div>

<script>
    // 비밀번호 표시/숨기기
    function togglePassword() {
        const passwordInput = document.getElementById('password-input');
        const eyeIcon = document.querySelector('.login-toggle-password');
        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            eyeIcon.textContent = '🙈';
        } else {
            passwordInput.type = 'password';
            eyeIcon.textContent = '👁';
        }
    }

    // 입력 필드 초기화
    function clearInput(inputName) {
        const input = document.querySelector(`input[name="${inputName}"]`);
        if (input) {
            input.value = '';
        }
    }
</script>

<!-- Footer -->
<%@ include file="../common/main_footer.jsp"%>

</body>
</html>
