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
                검진 예약 안내
            </div>
            <div id="reservation_container1">
                <div id="reservation_content_title">
                    1. 예약 방법 안내
                </div>
                <div id="reservation_container1_content">
                    온라인 예약
                    <p>
                        상단 메뉴에서 '검진 예약'을 선택하여 예약을 진행할 수 있습니다.
                    </p>
                </div>
                <div id="reservation_container1_content">
                    전화 예약
                    <p>
                        고객센터 번호(예: 123-456-7890)로 전화하시면 친절한 상담을 통해 예약을 도와드립니다.
                    </p>
                </div>
            </div>
            <div  id="reservation_container2">
                <div id="reservation_content_title">
                    2. 검진 예약 절차
                </div>
                <div id="reservation_container2_content">
                    <img src="${ pageContext.servletContext.contextPath }/resources/img/health_reservation_guide1.png" alt="">
                    <p>
                        성함, 생년월일, 연락처 등 기본 정보를 입력해주세요.
                    </p>
                </div>
                <div id="reservation_container2_content">
                    <img src="${ pageContext.servletContext.contextPath }/resources/img/health_reservation_guide2.png" alt="">
                    <p>
                        원하는 건강검진 항목을 선택합니다.
                    </p>
                </div>
                <div id="reservation_container2_content">
                    <img src="${ pageContext.servletContext.contextPath }/resources/img/health_reservation_guide3.png" alt="">
                    <p>
                        선택한 항목과 예약 일정을 확인한 후 예약을 완료하세요.
                    </p>
                </div>
            </div>
            <div class="reservation_btn_area">
                <button id="reservation_btn" type="button" onclick="location.href='${pageContext.request.contextPath}/healthReservation/reservation1'">예약하기</button>
            </div>
            <div  id="reservation_container3">
                <h4 id="reservation_content_title">3. 유의 사항</h4>
                <div id="reservation_container3_content">
                    <p>
                    예약 당일 신분증을 꼭 지참해 주세요. <br>
                    건강검진 전날에는 금식을 권장합니다. <br>
                    예약 변경 및 취소는 최소 24시간 전에 가능합니다. <br>
                    문의는 고객센터로 연락 주시거나 홈페이지의 '문의하기'를 통해 상담받으실 수 있습니다.
                    </p>
                </div>
            </div>
            <div class="reservation_btn_area">
                <button id="reservation_btn" onclick="location.href='${pageContext.request.contextPath}/healthReservation/guideEven'" type="button">문의하기</button>
            </div>
        </div>
    </div>
    <!-- footer -->
	<jsp:include page="../common/main_footer.jsp"/>
</body>
</html>