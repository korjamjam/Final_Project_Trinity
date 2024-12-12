<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Reservation Management Detail</title>
     <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/reservation_management_detail.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/hospital_detail/hospital_account_header.jsp" />

<div class="reservation-management-detail">
    <h2>예약관리</h2>

    <div class="reservation-info">
        <table>
            <tr>
                <th>예약번호</th>
                <td>${myReservation.resNo}</td>
            </tr>
            <tr>
                <th>예약자명</th>
                <td>${myReservation.patientName}</td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td>010-1234-5678</td>
            </tr>
            <tr>
                <th>생년월일</th>
                <td>${myReservation.patientBirthday}</td>
            </tr>
            <tr>
                <th>예약병원</th>
                <td>밝은소아청소년과의원</td>
            </tr>
            <tr>
                <th>예약날짜</th>
                <td>
                    ${myReservation.resDate}
                </td>
            </tr>
            <tr>
                <th>진료시간</th>
                <td>
                    ${myReservation.resTime}
                </td>
            </tr>
            <tr>
                <th>진료과목</th>
                <td>${myReservation.resCategory}</td>
            </tr>
            <tr>
                <th>증상</th>
                <td>${myReservation.resContent}</td>
            </tr>
        </table>
    </div>
</div>

</body>
</html>
