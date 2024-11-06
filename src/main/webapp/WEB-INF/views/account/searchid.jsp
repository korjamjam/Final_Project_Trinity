<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/account/searchid.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>

<!-- Header -->
	<%@ include file="../common/main_header.jsp"%>
    <div class="container">
        <h1>아이디 찾기</h1>
        <p>아이디 찾는 방법을 선택해 주세요.</p>

        <div class="method">
            <label>
                <input type="radio" name="method" checked>
                본인 확인 이메일로 인증
            </label>
            <div class="input-group">
                <label for="name">이름</label>
                <input type="text" id="name" placeholder="이름">
            </div>
            <div class="input-group email-group">
                <label for="email">이메일 주소</label>
                <div class="email-inputs">
                    <input type="text" id="email" placeholder="이메일 입력">
                    <span>@</span>
                    <input type="text" placeholder="직접입력">
                    <select>
                        <option>직접입력</option>
                        <option>gmail.com</option>
                        <option>naver.com</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="method">
            <label>
                <input type="radio" name="method">
                회원정보에 등록한 휴대전화로 인증
            </label>
            <div class="input-group">
                <label for="phone-name">이름</label>
                <input type="text" id="phone-name" placeholder="이름">
            </div>
            <div class="input-group">
                <label for="phone">휴대전화</label>
                <input type="text" id="phone" placeholder="휴대전화">
            </div>
        </div>

        <button class="submit-button">다음</button>
        <p class="footer-text">아이디 찾기 시 문제가 있나요? <a href="#">바로가기</a></p>
    </div>
    
 <!-- Footer -->
	<%@ include file="../common/main_footer.jsp"%>
    
</body>
</html>
