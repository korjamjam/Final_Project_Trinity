<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인정보 수정</title>
      <<link rel="stylesheet" href="<%=path %>/resources/css/account/profile-edit.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>

<!-- Header -->
	<%@ include file="./WEB-INF/views/common/FinalHeader.jsp"%>
    <div class="profile-container">
        <h2>개인정보</h2>
        <div class="profile-picture">
            <img src="10.png" alt="프로필 사진">
            <button class="upload-button">수정</button>
        </div>
        <div class="input-group">
            <label>이름</label>
            <input type="text" value="최경채" disabled>
            <button class="edit-button">✏️</button>
        </div>
        <div class="input-group">
            <label>생년월일</label>
            <input type="text" value="20051205" disabled>
            <button class="edit-button">✏️</button>
        </div>
        <div class="input-group">
            <label>이메일</label>
            <input type="text" value="ckc980515@gmail.com" disabled>
            <button class="edit-button">✏️</button>
        </div>
        <div class="input-group">
            <label>성별</label>
            <input type="text" value="남" disabled>
            <button class="edit-button">✏️</button>
        </div>
        <div class="input-group">
            <label>직업</label>
            <input type="text" value="메이플용사" disabled>
            <button class="edit-button">✏️</button>
        </div>
        <button class="password-change">비밀번호 변경하기</button>
        <button class="submit-button">수정하기</button>
    </div>
    
    <!-- Footer -->
	<%@ include file="./WEB-INF/views/common/FinalFooter.jsp"%>
    
</body>
</html>
