<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>등업 관리</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/common/default.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/admin/rankup_management.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/admin_header.jsp" />

	<div class="rankup-management">
		<div class="content">
			<h2>등업 관리</h2>
			<p class="total-rankups">등업 신청수: ${rankupList.size()}</p>

			<c:if test="${empty rankupList}">
				<p>등업 신청 정보가 없습니다.</p>
			</c:if>
			<div class="rankup-list">
				<c:forEach var="rankup" items="${rankupList}">
					<a href="rankupDetail" class="rankup-item">
						<p>
							<span>신청자:</span> <span>${rankup.userName}</span>
						</p>
						<p>
							<span>신청 제목:</span> <span>${rankup.resTitle}</span>
						</p>
						<p>
							<span>등업 신청:</span> <span> <c:choose>
									<c:when test="${rankup.status == 'W'}">대기</c:when>
									<c:when test="${rankup.status == 'A'}">승인</c:when>
									<c:when test="${rankup.status == 'D'}">거부</c:when>
									<c:otherwise>알 수 없음</c:otherwise>
								</c:choose>
							</span>
						</p>
					</a>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>
