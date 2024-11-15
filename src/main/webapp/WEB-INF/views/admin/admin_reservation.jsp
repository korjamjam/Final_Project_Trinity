<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Reservation Management</title>
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/reservation_management.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/admin_header.jsp"/>

<div class="reservation-management">

    <div class="content">
        <h2>예약관리</h2>
        <p class="total-reservation">총 예약자 수: 2명</p>
        <div class="sort-dropdown">
            <select>
                <option value="전체">전체</option>
                <option value="아이디">아이디</option>
                <option value="예약상태">예약상태</option>
            </select>
        </div>

        <div class="reservation-list">
            <a href="#" class="reservation-item">
                <p>
                    <span>홍길동</span> 
                    <span>User01</span> 
                    <span>예약일: 2024-10-28</span>
                </p>
                <p class="time-style">PM 3:00</p>
                <p>
                    <span>예약상태:</span>
                    <span class="status pending">대기</span>
                </p>
            </a>

            <a href="#" class="reservation-item">
                <p>
                    <span>김철수</span> 
                    <span>User02</span> 
                    <span>예약일: 2024-10-29</span>
                </p>
                <p class="time-style">PM: 2:00</p>
                <p>
                    <span>예약상태:</span>
                    <span class="status active">확인중</span>
                </p>
            </a>
        </div>
    </div>
</div>

</body>
</html>