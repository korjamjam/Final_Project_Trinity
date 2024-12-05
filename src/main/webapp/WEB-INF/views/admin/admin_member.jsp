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
					<form id="filterForm"
						action="${pageContext.servletContext.contextPath}/admin/member"
						method="get">
						<select name="role"
							onchange="document.getElementById('filterForm').submit();">
							<option value="전체" ${param.role == '전체' ? 'selected' : ''}>전체
								보기</option>
							<option value="의사" ${param.role == '의사' ? 'selected' : ''}>의사</option>
							<option value="관리자" ${param.role == '관리자' ? 'selected' : ''}>관리자</option>
							<option value="일반" ${param.role == '일반' ? 'selected' : ''}>일반</option>
						</select>
					</form>
				</div>
				<a href="rankup" class="rankup-button">등업신청</a>
			</div>

			<div class="member-list">
				<c:forEach var="member" items="${memberList}">
					<a href="memberDetail?userNo=${member.userNo}" class="member-item">
						<p>
							<span>${member.userName}</span> <span>${member.userId}</span> <span>
								<c:choose>
									<c:when
										test="${not empty member.medKey && member.isAdmin == 'N'}">의사</c:when>
									<c:when test="${member.isAdmin == 'Y'}">관리자</c:when>
									<c:otherwise>일반</c:otherwise>
								</c:choose>
							</span> <span>등록일: <fmt:formatDate value="${member.enrollDate}"
									pattern="yyyy-MM-dd" /></span>
						</p>
						<p>${member.phone}</p>
					</a>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>