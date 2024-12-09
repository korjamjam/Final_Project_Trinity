<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>병원 의사 관리</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/common/default.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/admin/member_management.css">

</head>
<body>
	<jsp:include page="/WEB-INF/views/hospital_detail/hospital_account_header.jsp" />

	<!-- 메시지 알림 -->
	<script>
		const message = "${message}";
		if (message) {
			alert(message); // 안내 문구를 띄움
			console.log(message)
		}
	</script>

	<div class="member-management">
		<div class="content">
			<h2>의사 관리</h2>
			<p class="total-members">총 의사 수: ${hosDrList.size()}명</p>

			<c:if test="${empty hosDrList}">
				<p>의사 정보가 없습니다.</p>
			</c:if>

			<div class="button-container">
				<a href="${pageContext.servletContext.contextPath}/hospital/account/insertDr" class="rankup-button">의사 추가</a>
			</div>

			<div class="member-list">
				<c:forEach var="doctor" items="${hosDrList}">
					<a href="doctor/detail?userId=${doctor.userId}" class="member-item">
						<p>
							<span>${doctor.userName}</span>
							<span>
								<c:choose>
									<c:when test="${doctor.medKey == '1'}">의사</c:when>
									<c:otherwise>일반</c:otherwise>
								</c:choose>
							</span>
							<span>등록일: <fmt:formatDate value="${doctor.enrollDate}" pattern="yyyy-MM-dd" /></span>
						</p>
						<p>${doctor.phone}</p>
						<p>${doctor.address}</p>
						<p>${doctor.email}</p>						
					</a>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>