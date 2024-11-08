<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
            <link rel="stylesheet"
                href="${ pageContext.servletContext.contextPath }/resources/css/community/community_detail.css">
            <link href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_public.css"
                rel="stylesheet">
            <title>Customer Center</title>
        </head>
<div class="expert-card">
    <div class="expert-header">
        <h2>김민한<span class="expert-role">[약사]</span></h2>
        <p>총답변: <span class="total-answers">2158</span> | <span class="score">별별별</span></p>
    </div>
    <div class="expert-details">
        <div class="expert-photo">
            <img src="${pageContext.servletContext.contextPath}/resources/img/doctor.jpg" alt="의사아이콘">
        </div>
        <div class="expert-info">
            <p><strong>소속기관:</strong> <a href="#">사원약국</a></p>
            <p><strong>전문분야:</strong> 약학, 의약외품, 영양제/건강보조식품, 약 효능/성분</p>     
        </div>
    </div>
    <div class="expert-actions">
        <button class="white-button">상담</button>
        <button class="white-button">추천</button>
    </div>
</div>
</body>

</html>