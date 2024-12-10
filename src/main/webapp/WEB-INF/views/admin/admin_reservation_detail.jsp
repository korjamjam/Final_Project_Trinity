<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Reservation Management Detail</title>
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/admin/reservation_management_detail.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/admin_header.jsp" />

	<div class="reservation-management-detail">
		<h2>예약관리</h2>

		<div class="reservation-info">
			<table>
				<tr>
					<th>예약번호</th>
					<td>${reservationDetail.RESERVATION_NO}</td>
				</tr>
				<tr>
					<th>예약자명</th>
					<td>${reservationDetail.NAME}</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>${reservationDetail.BIRTHDAY}</td>
				</tr>
				<tr>
					<th>예약날짜</th>
					<td>${reservationDetail.RES_DATE}</td>
				</tr>
				<tr>
					<th>예약시간</th>
					<td>${reservationDetail.RES_TIME}</td>
				</tr>
				<tr>
					<th>특이사항</th>
					<td>${reservationDetail.NOTES}</td>
				</tr>
			</table>
			<button class="save-button">저장하기</button>
		</div>
	</div>

</body>
</html>
