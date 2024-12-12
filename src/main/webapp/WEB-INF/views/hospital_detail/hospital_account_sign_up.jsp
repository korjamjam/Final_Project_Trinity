<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/account/sign_up.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

	<!-- 회원가입 성공 또는 실패 메시지 출력 스크립트 -->
	<script>
        const message = "${message}";
        if (message) {
            alert(message); // 안내 문구를 띄움
        }
    </script>

	<!-- Header -->
    <jsp:include page="/WEB-INF/views/common/main_header.jsp" />

	<div class="signup-container">
		<h2>기업 회원 가입</h2>
		<form action="${pageContext.request.contextPath}/hospital/account/insert"
			method="post" onsubmit="return validateForm()">
			<!-- 기본 정보 입력 -->
			<div class="input-group">
				<label for="userId">아이디</label> <input type="text" id="hosId"
					name="hosId" placeholder="아이디 입력" required>
				<button type="button" class="check-button" onclick="checkId()">중복확인</button>
			</div>
			<div class="input-group">
				<label for="userPwd">비밀번호</label> <input type="password"
					id="userPwd" name="hosPwd" placeholder="비밀번호 입력" required>
			</div>
			<div class="input-group">
				<label for="userPwdConfirm">비밀번호 확인</label> <input type="password"
					id="userPwdConfirm" name="userPwdConfirm" placeholder="비밀번호 재입력"
					required>
			</div>
			
			<!--병원 연결-->
            <div class="input-group">
				<label for="userName">병원 코드 입력</label> <input type="text" id="userName"
					name="hosNo" placeholder="병원 코드 입력 미등록 병원은 관리자에게 문의" required>
			</div>

            <!--병원 소개-->
            <div class="input-group">
                <label for="hosInfo">병원 소개</label>
                <input type="text" id="hosInfo" name="hosInfo" placeholder="병원 정보 입력">
            </div>

            <!--응급실 운영 여부-->
            <div class="input-group">
                <label for="hosOnduty">응급실 운영</label>
                <label>
                    운영<input type="radio" name="hosOnduty" value="Y" placeholder="병원 정보 입력">  
                </label>
                <label>
                    미운영 <input type="radio" name="hosOnduty" value="N" placeholder="병원 정보 입력">
                </label>
            </div>

            <!--주차장 관련-->
            <div class="input-group">
				<label for="userName">주차 안내</label> <input type="text" id="hosParking"
					name="hosParking" placeholder="주차 안내">
			</div>

			<button type="submit" class="signup-button">기업 회원 가입</button>
		</form>
	</div>

	<script>
    // 폼 유효성 검사 함수
    function validateForm() {
        const userPwd = document.getElementById("userPwd").value.trim();
        const userPwdConfirm = document.getElementById("userPwdConfirm").value.trim();

        if (userPwd !== userPwdConfirm) {
            alert("비밀번호가 일치하지 않습니다.");
            return false; // 제출 중단
        }

        return true;
    }

    // 주소 검색 기능
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                const addr = data.userSelectedType === 'R' ? data.roadAddress : data.jibunAddress;
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById('sample6_address').value = addr;
                document.getElementById('sample6_detailAddress').focus();
            }
        }).open();
    }

    // 아이디 중복 확인
   function checkId() {
    const userId = $('#hosId').val().trim();
    if (!userId) {
        alert('아이디를 입력해주세요.');
        return;
    }

    $.ajax({
        url: '${pageContext.request.contextPath}/hospital/idCheck',
        type: 'GET',
        data: { userId: userId },
        success: function(result) {
            const isAvailable = parseInt(result, 10); // 숫자로 변환
            if (isAvailable === 0) {
                alert('사용 가능한 아이디입니다.');
            } else {
                alert('이미 사용 중인 아이디입니다.');
            }
        },
        error: function(xhr, status, error) {
            console.error('AJAX Error:', status, error);
            alert('아이디 중복 확인 중 오류가 발생했습니다.');
        }
    });
}

</script>

	<%@ include file="../common/main_footer.jsp"%>
</body>
</html>
