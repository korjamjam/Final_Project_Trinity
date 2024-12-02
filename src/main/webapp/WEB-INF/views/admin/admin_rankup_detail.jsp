<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>등업 신청 상세</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/common/default.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/admin/rankup_management_detail.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/admin_header.jsp" />

	<script>
		const alertMsg = '${alertMsg}';
		if (alertMsg) {
			alert(alertMsg);
		}
	</script>
	<div class="rankup-management">
		<h2>등업 신청 상세</h2>
		<div class="rankup-info">
			<form action="${pageContext.request.contextPath}/admin/updateRankup"
				method="post">
				<table>
					<tr>
						<th>이름</th>
						<td>${rankupDetail.userName}</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${rankupDetail.userId}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${rankupDetail.email}</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${rankupDetail.phone}</td>
					</tr>
					<tr>
						<th>신청 제목</th>
						<td>${rankupDetail.resTitle}</td>
					</tr>
					<tr>
						<th>신청과목</th>
						<td>${rankupDetail.subject}</td>
					</tr>
					<tr>
						<th>등업 신청 상태</th>
						<td><select name="status">
								<option value="W"
									${rankupDetail.status == 'W' ? 'selected' : ''}>대기</option>
								<option value="A"
									${rankupDetail.status == 'A' ? 'selected' : ''}>승인</option>
								<option value="D"
									${rankupDetail.status == 'D' ? 'selected' : ''}>거부</option>
						</select></td>
					</tr>
					<tr>
						<th>증명 파일</th>
						<td><a href="${rankupDetail.licPicture}" target="_blank">파일
								확인</a></td>
					</tr>
				</table>
				<input type="hidden" name="seqNo" value="${rankupDetail.seqNo}" />
				<input type="hidden" name="userNo" value="${rankupDetail.userNo}" />
				<button type="submit" class="save-button">저장하기</button>
			</form>
		</div>
	</div>

</body>
</html>