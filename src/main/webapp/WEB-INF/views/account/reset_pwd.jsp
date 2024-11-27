<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 재설정</title>
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/account/reset_pwd.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>

<!-- Header -->
<%@ include file="../common/main_header.jsp"%>

<div class="container">
    <!-- 비밀번호 재설정 제목 -->
    <h2 class="title">비밀번호 재설정</h2>
    <p class="subtitle">비밀번호를 변경해 주세요.</p>

    <!-- 비밀번호 재설정 폼 -->
    <div class="reset-form">
        <!-- 유저 아이디를 동적으로 표시 -->
        <p class="user-id">닥터링 아이디 : <span class="highlight">${loginUser.userId}</span></p>
        <form>
            <input type="password" name="newPassword" placeholder="새 비밀번호" required>
            <input type="password" name="confirmPassword" placeholder="새 비밀번호 확인" required>
            <p class="password-hint">* 영문 숫자 특수문자를 함께 사용해야 하며, 8자 이상 16자 이하만 가능합니다.</p>
            <p class="password-hint">* 다른 사이트와 다른 닥터링 아이디만의 비밀번호를 만들어 주세요.</p>
            <button type="submit" class="submit-button">확인</button>
        </form>
    </div>
</div>

<!-- Footer -->
<%@ include file="../common/main_footer.jsp"%>

</body>
</html>
