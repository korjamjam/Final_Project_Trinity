<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>백신 예약</title>

<!-- jQuery 및 jQuery UI 스타일 및 스크립트 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 프로젝트의 공통 CSS -->
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/common/default.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/health_reservation/health_reservation2.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/common/custom_datepicker.css">
</head>
<body>
	<!-- Header 포함 -->
	<jsp:include page="../common/main_header.jsp" />

	<div class="health_reservation1_wrap">
		<div class="health_reservation1_container">
			<!-- 페이지 타이틀 -->
			<div class="health_reservation1_title">백신 예약</div>
			<!-- 예약 폼 시작 -->
			<form id="reservationForm"
				action="${pageContext.request.contextPath}/vaccineReservation/submitReservation"
				method="post">
				
				<!-- 백신 예약 1단계에서 전달된 데이터들 (숨김 필드로 유지) -->
				<input type="hidden" name="patientName" value="${vaccineReservation.patientName}">
				<input type="hidden" name="patientBirthday" value="${vaccineReservation.patientBirthday}">
				<input type="hidden" name="userNo" value="${vaccineReservation.userNo}">
				<input type="hidden" name="gender" value="${vaccineReservation.gender}">
				<input type="hidden" name="phonCode" id="phoneCode" value="${vaccineReservation.phoneCode}">
				<input type="hidden" name="phoneNumber" id="phoneNumber" value="${vaccineReservation.phoneNumber}">
				<input type="hidden" name="emailLocal" id="emailLocal" value="${vaccineReservation.emailLocal}">
				<input type="hidden" name="emailDomain" id="emailDomain" value="${vaccineReservation.emailDomain}">

				<!-- 백신 종류 선택 -->
				<div class="health_reservation2_content">
					<div id="health_reservation1_content_title">3. 백신 종류</div>
					<div class="health_reservation_normal_select">
						<select name="vaccineType" required>
							<option value="" disabled hidden selected>백신 종류</option>
							<option value="독감">독감</option>
							<option value="코로나">코로나</option>
							<option value="A형간염">A형간염</option>
							<option value="일본뇌염">일본뇌염</option>
						</select>
					</div>
				</div>

				<!-- 접종받을 기관 선택 -->
				<div class="health_reservation2_content">
					<div id="health_reservation1_content_title">4. 접종받을 기관</div>
					<div class="health_reservation_normal_select">
						<select name="hosNo" required>
							<c:forEach var="hospital" items="${hospitalList}">
								<!-- 병원 목록 동적 렌더링 -->
								<option value="${hospital.hosNo}">${hospital.hosName}</option>
							</c:forEach>
						</select>
					</div>
				</div>

				<!-- 특이사항 입력 -->
				<div class="health_reservation2_content">
					<div id="health_reservation1_content_title">5. 특이사항</div>
					<div id="health_reservation_inputText">
						<textarea name="resContent" placeholder="알레르기, 부작용 반응 등 작성"></textarea>
					</div>
				</div>

				<!-- 날짜 및 시간 선택 -->
				<div class="health_reservation2_content">
					<div id="health_reservation1_content_title">6. 날짜 및 시간</div>
					<div class="health_reservation_normal_date">
						<div id="datepicker">
							<input type="date" name="vresDate" class="styled-date-input"
								placeholder="예약 날짜를 선택하세요" required>
						</div>
					</div>

					<div class="health_reservation_normal_select">
						<select name="timeOfDay" id="timeOfDaySelect" required>
							<option value="" disabled hidden selected>시간 선택</option>
							<option value="morning">오전</option>
							<option value="afternoon">오후</option>
						</select>
					</div>
					<div class="health_reservation_normal_select" id="specificTimeSelectContainer">
						<select name="vresTime" id="specificTimeSelect" required>
							<option value="" disabled hidden selected>구체적인 시간 선택</option>
						</select>
					</div>
				</div>

				<!-- 예약 버튼 -->
				<div class="reservation_btn_area">
					<button id="reservation_btn" type="submit">예약</button>
				</div>
			</form>
		</div>
	</div>

	<script src="${pageContext.servletContext.contextPath}/resources/js/reservation/vaccine_reservation.js"></script>

	<!-- Footer 포함 -->
	<jsp:include page="../common/main_footer.jsp" />
</body>
</html>
