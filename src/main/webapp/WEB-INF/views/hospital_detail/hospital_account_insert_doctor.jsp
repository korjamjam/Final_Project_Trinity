<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>병원 의사 등록</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/common/default.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/admin/rankup_management_detail.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/hospital_detail/hospital_account_header.jsp" />

	<script>
		const message = '${message}';
		if (message) {
			alert(message);
		}
	</script>
	<div class="rankup-management">
		<h2>의사 등록 상세</h2>
		<div class="rankup-info">
			<form action="${pageContext.request.contextPath}/hospital/account/insert/doctor"
				method="post">
				<table>
					<tr>
						<th>사용자 아이디 입력</th>
						<td>
                            <input type="text" name="userId">
                        </td>
					</tr>
                    <tr>
                        <th>미등록 회원 의사 추가</th>
                        <td>아직 개발중입니다</td>
                    </tr>
				</table>
				<button type="submit" class="save-button">추가 하기</button>
			</form>
		</div>
	</div>

</body>
</html>