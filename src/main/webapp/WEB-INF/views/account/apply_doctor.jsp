<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>의사 신청</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/account/apply_doctor.css">
</head>
<body>

	<!-- Header -->
	<%@ include file="../common/main_header.jsp"%>

	<div class="container">
		<h2>의사 신청</h2>
	
	
		<!-- 의사 신청 폼 -->
		<form action="${pageContext.request.contextPath}/doctor/apply"
			method="post" enctype="multipart/form-data" id="doctorApplyForm">
			<div class="form-group">
				<label for="userName">이름</label> <input type="text" id="userName"
					name="userName" value="${loginUser.userName}" readonly>
			</div>
			<div class="form-group">
				<label for="userEmail">이메일</label> <input type="email"
					id="userEmail" name="userEmail" value="${loginUser.email}" readonly>
			</div>
			<div class="form-group">
				<label for="rTitle">신청 제목</label> <input type="text" id="rTitle"
					name="rTitle" placeholder="신청 제목을 입력해주세요" required>
			</div>
			<div class="form-group">
				<label for="subject">전문 과목</label> <select id="subject"
					name="subject" required>
					<option value="">전문 과목을 선택해주세요</option>
					<option value="소아청소년과">소아청소년과</option>
					<option value="이비인후과">이비인후과</option>
					<option value="산부인과">산부인과</option>
					<option value="안과">안과</option>
					<option value="내과">내과</option>
					<option value="치과">치과</option>
					<option value="비뇨의학과">비뇨의학과</option>
					<option value="정신건강의학과">정신건강의학과</option>
				</select>
			</div>

			<div class="form-group">
				<label for="licPicture">의사 인증 사진</label> <input type="file"
					id="licPicture" name="licPicture" accept="image/*" required>
			</div>
			<button type="submit" class="submit-button">신청하기</button>
		</form>
	</div>

	<!-- Footer -->
	<%@ include file="../common/main_footer.jsp"%>

</body>
</html>
