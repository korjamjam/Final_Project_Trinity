<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link rel="stylesheet"
    href="${ pageContext.servletContext.contextPath }/resources/css/account/sign_up.css">
<link
    href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap"
    rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<!-- 성공 또는 실패 메시지 출력 스크립트 -->
<% if (request.getAttribute("message") != null) { %>
    <script>
        alert("<%= request.getAttribute("message") %>");
        <% if (request.getAttribute("message").toString().contains("완료")) { %>
            window.location.href = "${pageContext.request.contextPath}/member/login";
        <% } %>
    </script>
<% } %>

<!-- Header -->
<%@ include file="../common/main_header.jsp"%>

<div class="signup-container">
    <h2>회원 가입</h2>
    <form action="${pageContext.request.contextPath}/member/insert" method="post">
        <div class="input-group">
            <label for="userId">아이디</label>
            <input type="text" id="userId" name="userId" placeholder="아이디 입력" required>
            <button type="button" class="check-button">중복확인</button>
        </div>
        <div class="input-group">
            <label for="userPwd">비밀번호</label>
            <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호 입력" required>
        </div>
        <div class="input-group">
            <label for="userPwdConfirm">비밀번호 확인</label>
            <input type="password" id="userPwdConfirm" name="userPwdConfirm" placeholder="비밀번호 재입력" required>
        </div>
        <div class="input-group email-group">
            <label for="emailLocal">이메일 주소</label>
            <input type="text" id="emailLocal" name="emailLocal" placeholder="이메일 입력">
            <span>@</span>
            <input type="text" id="emailDomain" name="emailDomain" placeholder="직접 입력">
            <select id="emailSelect">
                <option value="">직접 입력</option>
                <option value="gmail.com">gmail.com</option>
                <option value="naver.com">naver.com</option>
                <option value="daum.net">daum.net</option>
            </select>
        </div>
        <div class="input-group">
            <label for="userName">이름</label>
            <input type="text" id="userName" name="userName" placeholder="이름 입력" required>
        </div>
        <div class="input-group">
            <label for="birthday">생년월일</label>
            <input type="date" id="birthday" name="birthday" placeholder="생년월일 입력">
        </div>
        <div class="input-group">
            <label for="phone">전화번호</label>
            <input type="text" id="phone" name="phone" placeholder="전화번호 입력">
        </div>
        <div class="input-group">
            <label for="gender">성별</label>
            <select id="gender" name="gender">
                <option value="">선택</option>
                <option value="M">남성</option>
                <option value="F">여성</option>
            </select>
        </div>
        <button type="submit" class="signup-button">회원 가입</button>
    </form>
</div>

<!-- 아이디 중복 확인 AJAX 스크립트 -->
<script>
    $(document).ready(function(){
        $('.check-button').click(function(){
            var userId = $('#userId').val();
            if(userId){
            	$.ajax({
            	    url: '${pageContext.request.contextPath}/member/idCheck', 
            	    type: 'GET',
            	    data: { userId: userId },
            	    success: function(result){
            	        if(result == 0){
            	            alert('사용 가능한 아이디입니다.');
            	        } else {
            	            alert('이미 사용 중인 아이디입니다.');
            	        }
            	    },
            	    error: function(xhr, status, error){
            	        console.log("Error:", error); 
            	        alert('아이디 중복 확인에 실패했습니다.');
            	    }
            	});
            } else {
                alert('아이디를 입력해주세요.');
            }
        });
    });
</script>

<!-- Footer -->
<%@ include file="../common/main_footer.jsp"%>

</body>
</html>
