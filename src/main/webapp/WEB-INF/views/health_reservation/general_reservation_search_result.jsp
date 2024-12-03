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
	
	<!-- 메시지 확인 및 이전 화면으로 이동 -->
    <script>
        const message = "${rmessage}";
        if (message) {
            alert(message); // 안내 문구를 띄움
            history.back(); // 이전 화면으로 돌아감
        }
    </script>
	<div class="health_reservation_wrap">
        <div class="health_reservation_container">
            <div id="health_reservation_title">
                검진 예약 조회
            </div>
            <div class="health_reservation_result">
                <table>
                	<tr>
                        <td>예약번호</td>
                        <td>${resNo }</td>
                    </tr>
                    <tr>
                        <td>이름</td>
                        <td>${generealReservation.gpatientName }</td>
                    </tr>
                    <tr>
                        <td>병원</td>
                        <td>${generealReservation.hosNo }</td>
                    </tr>
                    <tr>
                        <td>진료 종류</td>
                        <td>${generealReservation.gresSubject}</td>
                    </tr>
                    <tr>
                        <td>특이사항</td>
                        <td>${generealReservation.gresContent }</td>
                    </tr>
                    <tr>
                        <td>생년월일</td>
                        <td>${generealReservation.gpatientBirthday }</td>
                    </tr>
                    <tr>
                        <td>날짜</td>
                        <td>${generealReservation.gresDate }</td>
                    </tr>
                    <tr>
                        <td>시간</td>
                        <td>${generealReservation.gresTime }</td>
                    </tr>
                </table>    
            </div>
        </div>
    </div>
    <!-- footer -->
	<jsp:include page="../common/main_footer.jsp"/>
</body>
</html>