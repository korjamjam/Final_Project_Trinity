<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기</title>
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/account/searchpwd.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">

</head>
<body>

	<!-- Header -->
	<%@ include file="../common/FinalHeader.jsp"%>
	<div class="container">
		<div class="title">비밀번호 찾기</div>
		<div class="subtitle">비밀번호 찾는 방법을 선택해 주세요.</div>

		<div class="radio-group">
			<input type="radio" id="emailVerification" name="method" checked>
			<label for="emailVerification">본인 확인 이메일로 인증</label>
		</div>
		<div class="input-group">
			<label for="id">아이디</label> <input type="text" id="id"
				placeholder="아이디">
		</div>
		<div class="input-group">
			<label for="name">이름</label> <input type="text" id="name"
				placeholder="이름">
		</div>
		<div class="input-group">
			<label for="email">이메일 주소</label>
			<div class="select-group">
				<input type="text" id="email" placeholder="이메일 입력"> <span>@</span>
				<input type="text" placeholder="직접입력"> <select>
					<option>직접입력</option>
					<option>gmail.com</option>
					<option>naver.com</option>
					<option>daum.net</option>
				</select>
			</div>
		</div>

		<div class="radio-group">
			<input type="radio" id="phoneVerification" name="method"> <label
				for="phoneVerification">회원정보에 등록한 휴대전화 인증</label>
		</div>
		<div class="input-group">
			<label for="phoneId">아이디</label> <input type="text" id="phoneId"
				placeholder="아이디">
		</div>
		<div class="input-group">
			<label for="phoneName">이름</label> <input type="text" id="phoneName"
				placeholder="이름">
		</div>
		<div class="input-group">
			<label for="phone">휴대전화</label> <input type="text" id="phone"
				placeholder="휴대전화">
		</div>

		<button class="submit-btn">다음</button>

		<div class="help-link">
			비밀번호 찾기 시 문제가 있나요? <a href="#">바로가기</a>
		</div>
	</div>
	
	<!-- Footer -->
	<%@ include file="../common/FinalFooter.jsp"%>
	
</body>
</html>
