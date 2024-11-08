<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>개인정보 수정</title>
<link rel="stylesheet" 
    href="${ pageContext.servletContext.contextPath }/resources/css/account/profile_edit.css">
<link
    href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
    rel="stylesheet">
</head>
<body>

<!-- Header -->
    <%@ include file="../common/main_header.jsp"%>
    <div class="profile-container">
        <h2>개인정보</h2>
        
        <!-- 프로필 수정 폼 시작 -->
        <form>
            <div class="profile-picture">
                <img src="10.png" alt="프로필 사진">
                <button type="button" class="upload-button">수정</button>
            </div>
            <div class="input-group">
                <label>이름</label> 
                <input type="text" name="name" value="최경채" disabled>
                <button type="button" class="edit-button" onclick="location.href='name_update_main.me'">✏️</button>
            </div>
            <div class="input-group">
                <label>생년월일</label> 
                <input type="text" name="birthdate" value="20051205" disabled>
                <button type="button" class="edit-button" onclick="location.href='birthday_update_main.me'">✏️</button>
            </div>
            <div class="input-group">
                <label>이메일</label> 
                <input type="text" name="email" value="ckc980515@gmail.com" disabled>
                <button type="button" class="edit-button" onclick="location.href='email_update_main.me'">✏️</button>
            </div>
            <div class="input-group">
                <label>성별</label> 
                <input type="text" name="gender" value="남" disabled>
                <button type="button" class="edit-button">✏️</button>
            </div>
            <div class="input-group">
                <label>직업</label> 
                <input type="text" name="job" value="메이플용사" disabled>
                <button type="button" class="edit-button">✏️</button>
            </div>
            <button type="button" class="password-change">비밀번호 변경하기</button>
            <button type="submit" class="submit-button">수정하기</button>
        </form>
        <!-- 프로필 수정 폼 끝 -->
    </div>

 <!-- Footer -->
    <%@ include file="../common/main_footer.jsp"%>

</body>
</html>
