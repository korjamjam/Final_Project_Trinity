<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
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
	<% 
    if (session.getAttribute("message") != null) { 
%>
	<script>
        alert("<%= session.getAttribute("message") %>");
    </script>
	<%
        session.removeAttribute("message");
    }
%>

	<!-- Header -->
	<%@ include file="../common/main_header.jsp"%>

	<div class="signup-container">
		<h2>회원 가입</h2>
		<form action="${pageContext.request.contextPath}/member/insert"
			method="post" onsubmit="return validateForm()">
			<!-- 기본 정보 입력 -->
			<div class="input-group">
				<label for="userId">아이디</label> <input type="text" id="userId"
					name="userId" placeholder="아이디 입력" required>
				<button type="button" class="check-button" onclick="checkId()">중복확인</button>
			</div>
			<div class="input-group">
				<label for="userPwd">비밀번호</label> <input type="password"
					id="userPwd" name="userPwd" placeholder="비밀번호 입력" required>
			</div>
			<div class="input-group">
				<label for="userPwdConfirm">비밀번호 확인</label> <input type="password"
					id="userPwdConfirm" name="userPwdConfirm" placeholder="비밀번호 재입력"
					required>
			</div>

			<!-- 이메일 입력 -->
			<div class="input-group email-group">
				<label for="emailLocal">이메일 주소</label>
				<div class="email-input-container">
					<input type="text" id="emailLocal" name="emailLocal"
						placeholder="이메일 입력" required> <span>@</span> <input
						type="text" id="emailDomain" name="emailDomain"
						placeholder="직접 입력" required> <select id="emailSelect">
						<option value="">직접 입력</option>
						<option value="gmail.com">gmail.com</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
					</select>
				</div>
			</div>

			<!-- 주소 입력 -->
			<div class="input-group">
				<label for="sample6_postcode">우편번호</label> <input type="text"
					id="sample6_postcode" name="postcode" placeholder="우편번호" required>
				<button type="button" class="address-button"
					onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
			</div>
			<div class="input-group">
				<label for="sample6_address">주소</label> <input type="text"
					id="sample6_address" name="address" placeholder="주소" required>
			</div>
			<div class="input-group">
				<label for="sample6_detailAddress">상세주소</label> <input type="text"
					id="sample6_detailAddress" name="detailAddress" placeholder="상세주소">
			</div>

			<div class="input-group">
				<input type="text" id="sample6_extraAddress" name="extraAddress"
					placeholder="참고항목">
			</div>

			<!-- 추가 정보 입력 -->
			<div class="input-group">
				<label for="userName">이름</label> <input type="text" id="userName"
					name="userName" placeholder="이름 입력" required>
			</div>
			<div class="input-group">
				<label for="birthday">생년월일</label> <input type="date" id="birthday"
					name="birthday" placeholder="생년월일 입력" required>
			</div>
			<div class="input-group">
				<label for="phone">전화번호</label> <input type="text" id="phone"
					name="phone" placeholder="전화번호 입력" required>
			</div>
			<div class="input-group">
				<label for="gender">성별</label> <select id="gender" name="gender"
					required>
					<option value="">선택</option>
					<option value="M">남성</option>
					<option value="F">여성</option>
				</select>
			</div>

			<button type="submit" class="signup-button">회원 가입</button>
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

    // 이메일 도메인 선택 시 값 설정
    $(document).ready(function() {
        $('#emailSelect').change(function() {
            const selectedDomain = $(this).val();
            $('#emailDomain').val(selectedDomain).prop('readonly', !!selectedDomain);
        });
    });

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
    const userId = $('#userId').val().trim();
    if (!userId) {
        alert('아이디를 입력해주세요.');
        return;
    }

    $.ajax({
        url: '${pageContext.request.contextPath}/member/idCheck',
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
