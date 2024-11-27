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
			<h2>등업관리</h2>
			<p class="total-members">등업 신청수: ${memberList.size()}</p>

			<c:if test="${empty memberList}">
				<p>회원 정보가 없습니다.</p>
			</c:if>
			<div class="member-list">
				<c:forEach var="member" items="${memberList}">
					<a href="rankupDetail" class="member-item">
						<p>
							<span>${member.userName}</span>
							<span>${member.userId}</span>
						    <span>신청일: <fmt:formatDate value="${member.enrollDate}"
									pattern="yyyy-MM-dd" /></span>
						</p>
						<p>
							<span>등업신청:</span> <span class="status"> <c:choose>
									<c:when test="${member.status == 'Y'}">
										<span class="active">승인</span>
									</c:when>
									<c:otherwise>
										<span class="pending">대기</span>
									</c:otherwise>
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
