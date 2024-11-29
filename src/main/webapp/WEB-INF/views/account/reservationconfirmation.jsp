<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약확인</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/account/reservationconfirmation.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
</head>
<body>
	<!-- Header -->
	<%@ include file="../common/main_header.jsp"%>

	<!-- Flash 메시지가 있을 경우 alert 표시 -->
	<c:if test="${not empty errorMessage}">
		<script>
            alert("${errorMessage}");
        </script>
	</c:if>
	<c:if test="${not empty successMessage}">
		<script>
            alert("${successMessage}");
        </script>
	</c:if>

	<div class="layout-container">
		<!-- Sidebar -->
		<aside class="profile-sidemenu">
			<%@ include file="../account/mysidebar.jsp"%>
		</aside>

		<!-- Main Content -->
		<main class="profile-container">
			<h2>예약확인</h2>





			<div class="input-group">
				<label>병원이름</label> <input type="text" name="userName"
					value="${generealReservation.hosNo}" disabled>
			</div>
			<div class="input-group">
				<label>병원 주소</label> <input type="text" name="userName"
					value="${loginUser.userName}" disabled>
			</div>
			<div class="input-group">
				<label>진료자명</label> <input type="text" name="userName"
					value="${generealReservation.gpatientName}" disabled>
			</div>
			<div class="input-group">
				<label>진료자 생년월일</label> <input type="date" name="birthday"
					value="${generealReservation.gpatientBirthday}" disabled>
			</div>
			<div class="input-group">
				<label>진료 날짜</label> <input type="email" name="email"
					value="${generealReservation.gresDate}" disabled>
			</div>
			<div class="input-group">
				<label>진료시간</label> <input type="text" name="gender"
					value="${generealReservation.gresTime}" disabled>
			</div>
			

			<!-- 수정 활성화/저장 버튼 -->
			<button type="button" id="edit-save-button" class="edit-button"
				onclick="toggleEditSave()">수정 활성화</button>
			</form>

			<!-- 회원탈퇴 버튼 -->
			<button type="button" class="password-change"
				onclick="confirmWithdrawal()">예약변경요청</button>
		</main>
	</div>

	<!-- Footer -->
	<%@ include file="../common/main_footer.jsp"%>


</body>
</html>
