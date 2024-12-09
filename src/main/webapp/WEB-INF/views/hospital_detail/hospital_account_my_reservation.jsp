<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>병원 예약 현황</title>
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/reservation_management.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/hospital_detail/hospital_account_header.jsp" />

<div class="reservation-management">

    <div class="content">
        <h2>예약관리</h2>
        <p class="total-reservation">총 예약자 수: ${resList.size()}명</p>
        <div class="sort-dropdown">
            <select>
                <option value="전체">전체</option>
                <option value="아이디">아이디</option>
                <option value="예약상태">예약상태</option>
            </select>
        </div>
        <div class="reservation-list">
            <c:forEach var="myRes" items="${resList}">
            <a href="myReservation/detail?resNo=${myRes.resNo}" class="reservation-item">
                <p>
                    <span>${myRes.patientName}</span> 
                    <span>${myRes.patientBirthday}</span> 
                    <span>예약일: ${myRes.resDate}</span>
                </p>
                <p class="time-style">${myRes.resTime}</p>
                <p>
                    <span>예약상태:</span>
                    <span class="status pending">대기</span>
                </p>
            </a>
            </c:forEach>
        </div>
    </div>
</div>

</body>
</html>