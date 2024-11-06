<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이름 업데이트</title>
     <<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/account/nameupdate.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>

<!-- Header -->
	<%@ include file="../common/main_header.jsp"%>
    <div class="name-update-container">
        <h2>이름 업데이트</h2>
        <form class="name-update-form">
            <div class="input-group">
                <input type="text" id="first-name" value="경채" placeholder="이름">
            </div>
            <div class="input-group">
                <input type="text" id="last-name" value="최" placeholder="성">
            </div>
            <button type="submit" class="update-button">수정하기</button>
            <p class="info-text">이름을 변경하면 닥터링 계정 전체에 반영됩니다.</p>
        </form>
    </div>
    
 <!-- Footer -->
	<%@ include file="../common/main_footer.jsp"%>
    
</body>
</html>
