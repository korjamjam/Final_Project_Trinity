<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>건강검진 예약안내</title>
    <!-- css -->
    <link rel="stylesheet" href="<%=path%>/resources/css/common/defalut.css">
    <link rel="stylesheet" href="<%=path%>/resources/css/healthReservation/healthReservation.css">
</head>
<body>
    <div class="health_reservation_guide_wrap">
        <div class="health_reservation_guide">
            <div id="reservation_title">
                <h3>검진 예약 안내</h3>
            </div>
            <div id="reservation_container1">
                <div id="reservation_content_title">
                    1. 예약 방법 안내
                </div>
                <div id="reservation_container1_content">
                    <h5>온라인 예약</h5>
                    <p>
                        상단 메뉴에서 '검진 예약'을 선택하여 예약을 진행할 수 있습니다.
                    </p>
                    <br><br>
                    <h5>전화 예약</h5>
                    <p>
                        고객센터 번호(예: 123-456-7890)로 전화하시면 친절한 상담을 통해 예약을 도와드립니다.
                    </p>
                </div>
            </div>
            <div  id="reservation_container2">
                <div id="reservation_content_title">
                    2. 검진 예약 절차
                </div>
                <form action="">
                    <div id="reservation_container2_content">
                        <img src="./예약안내.png" alt="">
                        <p>
                            성함, 생년월일, 연락처 등 기본 정보를 입력해주세요.
                        </p>
                    </div>
                    <div id="reservation_container2_content">
                        <img src="./검진항목.png" alt="">
                        <p>
                            원하는 건강검진 항목을 선택합니다.
                        </p>
                    </div>
                    <div id="reservation_container2_content">
                        <img src="./예약완료.png" alt="">
                        <p>
                            선택한 항목과 예약 일정을 확인한 후 예약을 완료하세요.
                        </p>
                    </div>
                    <button id="reservation_btn" type="submit">예약하기</button>
                </form>
            </div>
            <div  id="reservation_container3">
                <form action="">
                    <h4 id="reservation_content_title">3. 유의 사항</h4>
                    <div id="reservation_container3_content">
                       <p>
                        예약 당일 신분증을 꼭 지참해 주세요. <br>
                        건강검진 전날에는 금식을 권장합니다. <br>
                        예약 변경 및 취소는 최소 24시간 전에 가능합니다. <br>
                        문의는 고객센터로 연락 주시거나 홈페이지의 '문의하기'를 통해 상담받으실 수 있습니다.
                       </p>
                    </div>
                    <button id="reservation_btn">문의하기</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>