<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Member Management</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/common/default.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/admin/member_management.css">

</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/admin_header.jsp" />

	<div class="member-management">
		<div class="content">
			<h2>회원관리</h2>
			<p class="total-members">총 회원수: ${memberList.size()}명</p>

			<c:if test="${empty memberList}">
				<p>회원 정보가 없습니다.</p>
			</c:if>

			<div class="button-container">
				<div class="sort-dropdown">
					<select>
						<option value="전체">전체 보기</option>
						<option value="의사">의사</option>
						<option value="관리자">관리자</option>
						<option value="일반">일반</option>
					</select>
				</div>
				<a href="rankup" class="rankup-button">의사 추가</a>
			</div>

			<div class="member-list">
				<c:forEach var="member" items="${memberList}">
					<a href="memberDetail" class="member-item">
						<p>
							<span>${member.userName}</span>
							<span>${member.userId}</span>
							<span>
								<c:choose>
									<c:when test="${member.medKey == '1'}">의사</c:when>
									<c:when test="${member.medKey == '2'}">관리자</c:when>
									<c:otherwise>일반</c:otherwise>
								</c:choose>
							</span>
							<span>등록일: <fmt:formatDate value="${member.enrollDate}" pattern="yyyy-MM-dd" /></span>
						</p>
						<p>${member.phone}</p>						
					</a>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>