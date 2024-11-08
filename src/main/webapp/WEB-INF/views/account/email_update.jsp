<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이메일 업데이트</title>
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/account/email_update.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>

<!-- Header -->
	<%@ include file="../common/main_header.jsp"%>
    <div class="email-update-container">
        <h2>이메일 업데이트</h2>
        <form class="email-update-form">
            <div class="input-group">
                <input type="text" id="email" placeholder="이메일">
            </div>
            <a href="recovery-email.html" class="recovery-email-button">복구이메일 추가</a>
            <button type="submit" class="update-button">수정하기</button>
            <p class="info-text">닥터링 계정에 연동된 이메일 주소를 관리합니다.</p>
        </form>
    </div>
    
  <!-- Footer -->
	<%@ include file="../common/main_footer.jsp"%>
    
</body>
</html>
