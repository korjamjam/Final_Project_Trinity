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
                        <td>${hResNo }</td>
                    </tr>
                    <tr>
                        <td>이름</td>
                        <td>${healthReservation.patientName }</td>
                    </tr>
                    <tr>
                        <td>병원</td>
                        <td>${healthReservation.hosName }</td>
                    </tr>
                    <tr>
                        <td>검진 내용</td>
                        <td>${healthReservation.resCategory }</td>
                    </tr>
                    <tr>
                        <td>특이사항</td>
                        <td>${healthReservation.resComment }</td>
                    </tr>
                    <tr>
                        <td>병원 주소</td>
                        <td>${healthReservation.hosAddress }</td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td>${healthReservation.patientEmail }</td>
                    </tr>
                    <tr>
                        <td>수령방법</td>
                        <td>${healthReservation.patientResult }</td>
                    </tr>
                    <tr>
                        <td>날짜</td>
                        <td>${healthReservation.resDate }</td>
                    </tr>
                    <tr>
                        <td>시간</td>
                        <td>${healthReservation.resTime }</td>
                    </tr>
                </table>    
            </div>
        </div>
    </div>
    
    <!-- footer -->
	<jsp:include page="../common/main_footer.jsp"/>
</body>
</html>