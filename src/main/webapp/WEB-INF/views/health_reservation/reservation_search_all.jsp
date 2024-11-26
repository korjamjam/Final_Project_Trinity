<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>건강검진 예약 조회</title>
     <!-- css -->
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/health_reservation/health_reservation.css">
    
</head>
<body>
	<!-- header -->
	<jsp:include page="../common/main_header.jsp"/>
	<div class="health_reservation_wrap">
        <div class="health_reservation_container">
            <div id="health_reservation_title">
                예약 내역 조회
            </div>
            <form action="reservationSearchAll">
            <div class="health_reservation_select">
                <select name="reservationCategory" id="" required="required">
                    <option value="general">일반진료 예약</option>
                    <option value="vaccine">백신 예약</option>
                    <option value="health">건강검진 예약</option>
                </select>
            </div>
            <div class="health_reservation1_content">
                <div id="reservation_content_title">
                    예약 번호로 검색
                </div>
                <p>예약번호</p>
                <div class="health_reservation1_content">
                    <input type="text" name="resNo">
                </div>
            </div>
            <div class="reservation_btn_area">
                <button id="reservation_btn">조회하기</button>
            </div>
            </form>
        </div>
    </div>
    <!-- footer -->
	<jsp:include page="../common/main_footer.jsp"/>
</body>
</html>