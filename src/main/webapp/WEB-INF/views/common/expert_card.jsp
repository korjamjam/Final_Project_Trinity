<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Doctoring Footer</title>

            <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
            <link rel="stylesheet"
                href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_public.css">
            <link rel="stylesheet"
                href="${ pageContext.servletContext.contextPath }/resources/css/common/expert_card.css">
        </head>

        <body>
            <div class="expert-card">
                <div class="expert-photo">
                    <img src="${pageContext.servletContext.contextPath}/resources/img/doctor.jpg" alt="의사아이콘">
                </div>
                <div class="expert-info-summary">
                    <div class="expert-name">
                        <h2>김민한</h2>
                        <p class="small-text">사원약국</p>
                    </div>
                    <div class="expert-name">
                        <h6>전문분야 : &nbsp;</h6>
                        <p class="small-text"> 내과, 편도염</p>
                    </div>
                    <p>
                        총답변: <span class="total-answers">2158</span> | <span class="score">⭐⭐⭐</span>
                    </p>
                </div>
                <!-- Action Buttons -->
                <div class="action-buttons">
                    <button class="white-button">상담</button>
                </div>
            </div>
        </body>

        </html>