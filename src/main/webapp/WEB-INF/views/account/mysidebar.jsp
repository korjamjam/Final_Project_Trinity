<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/account/mysidebar.css">
<title>Profile Sidebar</title>
<style>
.profile-sidemenu .menu-table a.active {
	color: #6cc24a; /* 연두색 */
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="profile-sidemenu">
		<table class="menu-table">

			<tr>
				<th><a
					href="${pageContext.request.contextPath}/member/repair_email"
					id="recoveryEmail">복구 이메일 추가</a></th>

			</tr>

			<tr>
				<th><a
					href="${pageContext.request.contextPath}/member/profile_edit"
					id="profileEdit">내 정보 수정</a></th>

			</tr>
			<tr>
				<th><a
					href="${pageContext.request.contextPath}/member/repair_email"
					id="reservation_check">예약 확인</a></th>

			</tr>
			<tr>
				<th><a
					href="${pageContext.request.contextPath}/member/apply_doctor"
					id="apply_doctor">의사 신청</a></th>

			</tr>
			<tr>
				<th><a
					href="${pageContext.request.contextPath}/member/reset_pwd"
					id="reset_pwd">비밀번호 변경</a></th>

			</tr>
		</table>
		<div class="support-box">
			<p class="support-text">도움이 필요하신가요?</p>
			<a href="${pageContext.request.contextPath}/support/contact"
				class="support-link">1:1 문의하기</a>
		</div>
	</div>

	<script>
        // 현재 URL에서 type 파라미터 값을 추출하여 활성화된 메뉴 표시
        const currentPath = window.location.pathname;
        document.querySelectorAll('.menu-table a').forEach(link => {
            if (link.href.endsWith(currentPath)) {
                link.classList.add('active');
            }
        });
    </script>
</body>
</html>