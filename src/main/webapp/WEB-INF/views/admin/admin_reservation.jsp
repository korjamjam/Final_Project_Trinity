<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Reservation Management</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/common/default.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/admin/reservation_management.css">
    <script>
        // JavaScript를 사용하여 필터링 기능 구현
        function filterReservations() {
            const filter = document.getElementById('filterSelect').value; // 선택한 필터 값
            const items = document.querySelectorAll('.reservation-item'); // 모든 예약 아이템

            items.forEach(item => {
                const type = item.getAttribute('data-type'); // 예약 종류 (진료, 백신, 검진)
                if (filter === '전체' || type === filter) {
                    item.style.display = ''; // 필터에 맞는 항목 표시
                } else {
                    item.style.display = 'none'; // 필터에 맞지 않는 항목 숨김
                }
            });
        }
    </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/admin_header.jsp" />

<div class="reservation-management">
    <div class="content">
        <h2>예약 관리</h2>
        <p class="total-reservation">총 예약자 수: ${reservations.size()}명</p>

        <!-- 필터 선택 드롭다운 -->
        <div class="sort-dropdown">
            <select id="filterSelect" onchange="filterReservations()">
                <option value="전체">전체</option>
                <option value="진료예약">진료예약</option>
                <option value="백신예약">백신예약</option>
                <option value="검진예약">검진예약</option>
            </select>
        </div>

        <!-- 예약 리스트 -->
        <div class="reservation-list">
            <c:forEach var="reservation" items="${reservations}">
                <!-- 예약 종류를 data-type 속성으로 저장 -->
                <a href="reservationDetail?reservationNo=${reservation.gresNo != null ? reservation.gresNo : (reservation.vresNo != null ? reservation.vresNo : reservation.healthResNo)}"
                   class="reservation-item"
                   data-type="${reservation.gresNo != null ? '진료예약' : (reservation.vresNo != null ? '백신예약' : '검진예약')}">
                    <p>
                        <span>${reservation.patientName}</span>
                        <span>${reservation.gstNo == null ? "회원" : "비회원"}</span>
                        <span>예약일: ${fn:substring(reservation.resDate, 0, 10)}</span>
                    </p>
                    <p class="time-style">${reservation.resTime}</p>
                    <p>
                        <span>
                            <c:choose>
                                <c:when test="${reservation.gresNo != null}">진료예약</c:when>
                                <c:when test="${reservation.vresNo != null}">백신예약</c:when>
                                <c:when test="${reservation.healthResNo != null}">검진예약</c:when>
                            </c:choose>
                        </span>
                    </p>
                </a>
            </c:forEach>
        </div>
    </div>
</div>

</body>
</html>
