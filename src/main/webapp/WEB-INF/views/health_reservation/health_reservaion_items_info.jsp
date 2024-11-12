<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>건강검진 예약안내</title>
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
                검사 항목 정보
            </div>
            <div class="health_reservation_items_info">
                <div class="health_reservation_item open-modal-btn">
                    신체측정검사
                </div>
                <div class="health_reservation_item">
                    신체측정검사
                </div>
                <div class="health_reservation_item">
                    신체측정검사
                </div>
                <div class="health_reservation_item">
                    신체측정검사
                </div>
                <div class="health_reservation_item">
                    신체측정검사
                </div>
                <div class="health_reservation_item">
                    신체측정검사
                </div>
            </div>
            <div class="reservation_btn_area">
                <button id="reservation_btn"  type="button" onclick="location.href='health.reservation2'">다음</button>
            </div>
        </div>
    </div>
    <!-- footer -->
	<jsp:include page="../common/main_footer.jsp"/>
</body>
</html>