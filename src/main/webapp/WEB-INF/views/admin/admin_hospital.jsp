<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Hospital Management</title>
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/admin/hospital_management.css">

</head>
<body>

	<jsp:include page="/WEB-INF/views/admin/admin_header.jsp" />

	<div class="hospital-management">

		<div class="content">
			<h2>병원관리</h2>
			<p class="total-hospitals">등록된 병원수: ${hospitalList.size()}개</p>
			<div class="sort-dropdown">
				<form action="hospital" method="get">
					<select name="department" onchange="this.form.submit()">
            			<option value="전체" ${selectedDepartment == '전체' ? 'selected' : ''}>전체</option>
            			<option value="소아청소년과" ${selectedDepartment == '소아청소년과' ? 'selected' : ''}>소아청소년과</option>
            			<option value="산부인과" ${selectedDepartment == '산부인과' ? 'selected' : ''}>산부인과</option>
					</select>
				</form>
			</div>


			<div class="hospital-list">
				<c:forEach var="hospital" items="${hospitalList}">
					<a href="hospitalDetail?hosNo=${hospital.hosNo}"
						class="hospital-item">
						<p>
							<span>${hospital.hosName}</span> <span>${hospital.department}</span>
						</p>
						<p>주소: ${hospital.hosAddress}</p>
						<p>전화번호: ${hospital.hosTel}</p>
					</a>
				</c:forEach>
			</div>
		</div>
	</div>

</body>
</html>