<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>생년월일 업데이트</title>
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/account/birthdayupdate.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>

<!-- Header -->
	<%@ include file="../common/FinalHeader.jsp"%>
    <div class="birthday-update-container">
        <h2>생년월일 업데이트</h2>
        <p class="info-text">생일은 다양한 닥터링 서비스에서 계정 보안 및 맞춤설정 목적으로사용될 수 있습니다.<br>회사 또는 조직을 Google 계정인 경우,<br>계정 관리자의 생년월일을 입력하세요.</p>
        <form class="birthday-update-form">
            <div class="input-group">
                <input type="text" id="birthday" placeholder="생년월일 ex) 20041211">
            </div>
            <button type="submit" class="update-button">수정하기</button>
        </form>
    </div>
    
 <!-- Footer -->
	<%@ include file="../common/FinalFooter.jsp"%>
    
</body>
</html>
