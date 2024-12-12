<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약확인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/account/reservationconfirmation.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
	<!-- Header -->
	<%@ include file="../common/main_header.jsp"%>

	<div class="layout-container">
		<!-- Sidebar -->
		<aside class="profile-sidemenu">
			<%@ include file="../account/mysidebar.jsp"%>
		</aside>

		<!-- Main Content -->
		<main class="profile-container">
			<h2>예약확인</h2>
			<!-- 예약 데이터 처리 -->
			<c:choose>
				<c:when test="${not empty reservations}">
					<c:forEach var="reservation" items="${reservations}">
						<div class="reservation-item">
							<h3>예약 번호: ${reservation.resNo}</h3>
							<div class="input-group">
								<label>병원이름</label> 
								<input type="text" name="hosName" value="${reservation.hosName}" disabled>
							</div>
							<div class="input-group">
								<label>병원 주소</label> 
								<input type="text" name="hosAddress" value="${reservation.hosAddress}" disabled>
							</div>
							<div class="input-group">
								<label>진료자명</label> 
								<input type="text" name="patientName" value="${reservation.patientName}" disabled>
							</div>
							<div class="input-group">
								<label>진료자 생년월일</label> 
								<input type="text" name="patientBirthday" value="${reservation.patientBirthday}" disabled>
							</div>
							<div class="input-group">
								<label>진료 날짜</label> 
								<input type="text" name="resDate" value="${reservation.resDate}" disabled>
							</div>
							<div class="input-group">
								<label>진료 시간</label>
								<input type="text" name="resTime" value="${reservation.resTime}" disabled>
							</div>
							<div class="input-group">
								<label>예약 내용</label>
								<textarea name="resContent" disabled>${reservation.resContent}</textarea>
							</div>
							<button class="cancel-btn" onclick="cancelReservation('${reservation.resNo}')">예약 취소</button>
						</div>
						<br><br>
						<hr>
						<br><br>
					</c:forEach>


					<script>
						function cancelReservation(resNo) {
							if (confirm("예약을 취소하시겠습니까?")) {
								// 예약 취소 요청 전송
								console.log("취소 요청 - 예약 번호: " + resNo); // 디버깅용
								location.href = `${pageContext.request.contextPath}/reservation/cancel?resNo=` + resNo;
							}
						}
					</script>

				</c:when>
				<c:otherwise>
					<div class="reservation-item">
						<h3>예약 데이터가 없습니다.</h3>
						<div class="input-group">
							<label>병원이름</label> 
							<input type="text" name="hosName" value="-" disabled>
						</div>
						<div class="input-group">
							<label>병원 주소</label> 
							<input type="text" name="hosAddress" value="-" disabled>
						</div>
						<div class="input-group">
							<label>진료자명</label> 
							<input type="text" name="patientName" value="-" disabled>
						</div>
						<div class="input-group">
							<label>진료자 생년월일</label> 
							<input type="text" name="patientBirthday" value="-" disabled>
						</div>
						<div class="input-group">
							<label>진료 날짜</label> 
							<input type="text" name="resDate" value="-" disabled>
						</div>
						<div class="input-group">
							<label>진료 시간</label>
							<input type="text" name="resTime" value="-" disabled>
						</div>
						<div class="input-group">
							<label>예약 내용</label>
							<textarea name="resContent" disabled>-</textarea>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</main>
	</div>

	<!-- Footer -->
	<%@ include file="../common/main_footer.jsp"%>

</body>
</html>
