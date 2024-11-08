<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/account/sign_up.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap"
	rel="stylesheet">
</head>
<body>

<!-- Header -->
<%@ include file="../common/main_header.jsp"%>


	<div class="signup-container">
		<h2>회원 가입</h2>
		<div class="input-group">
			<label for="username">아이디</label> <input type="text" id="username"
				placeholder="아이디 입력">
			<button class="check-button">중복확인</button>
		</div>
		<div class="input-group">
			<label for="password">비밀번호</label> <input type="password"
				id="password" placeholder="비밀번호 입력">
		</div>
		<div class="input-group">
			<label for="password-confirm">비밀번호 확인</label> <input type="password"
				id="password-confirm" placeholder="비밀번호 재입력">
		</div>
		<div class="input-group email-group">
			<label for="email">이메일 주소</label> <input type="text" id="email"
				placeholder="이메일입력"> <span>@</span> <input type="text"
				id="email-domain" placeholder="직접입력"> <select>
				<option>직접입력</option>
				<option>gmail.com</option>
				<option>naver.com</option>
				<option>daum.net</option>
			</select>
		</div>
		<div class="input-group">
			<label for="name">이름</label> <input type="text" id="name"
				placeholder="이름 입력">
		</div>
		<div class="input-group">
			<label for="birthdate">생년월일</label> <input type="text" id="birthdate"
				placeholder="생년월일 입력">
		</div>
		<div class="input-group">
			<label for="phone">전화번호</label> <input type="text" id="phone"
				placeholder="전화번호 입력">
		</div>
		<div class="input-group">
			<label for="gender">성별</label> <input type="text" id="gender"
				placeholder="성별 입력">
		</div>
		<button class="signup-button">회원 가입</button>
	</div>

<!-- Footer -->
	<%@ include file="../common/main_footer.jsp"%>

</body>
</html>