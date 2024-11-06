<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>복구 이메일 추가</title>
  <<link rel="stylesheet" href="<%=path %>/resources/css/account/repairemail.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
</head>
<body>

<!-- Header -->
	<%@ include file="./WEB-INF/views/common/FinalHeader.jsp"%>
	<div class="recovery-email-container">
		<h2>복구 이메일 추가</h2>
		<form class="recovery-email-form">
			<div class="input-group">
				<input type="text" id="current-email" value="ckc980515@gmail.com"
					placeholder="이메일" readonly>
			</div>
			<div class="input-group">
				<input type="text" id="recovery-email" placeholder="복구이메일">
			</div>
			<button type="submit" class="add-button">추가하기</button>
			<p class="info-text">사용자 계정에서 비정상적인 활동이 감지되거나 사용자가 계정에 액세스할 수 없는
				경우 닥터링에서 사용자에게 연락하기 위해 사용하는 이메일 주소입니다.</p>
		</form>
	</div>
	
	<!-- Footer -->
	<%@ include file="./WEB-INF/views/common/FinalFooter.jsp"%>
	
</body>
</html>
