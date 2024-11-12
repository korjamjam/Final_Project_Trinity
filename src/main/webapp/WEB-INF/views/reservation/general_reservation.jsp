<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>닥터링</title>
    
    <!-- searchBar icon -->
    <link rel="favicon" href="${ pageContext.servletContext.contextPath }/resources/img/favicon.ico" />
    <link rel="icon" href="${ pageContext.servletContext.contextPath }/resources/img/favicon.ico" type="image/x-icon" />

    <!-- font style -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- icon -->
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

    <!-- css -->
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/reservation/general_reservation.css">

    <!-- jQuery -->
    <script 
        src="https://code.jquery.com/jquery-3.7.1.js" 
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" 
        crossorigin="anonymous">
    </script>
    <script 
        src="https://code.jquery.com/ui/1.14.0/jquery-ui.js" 
        integrity="sha256-u0L8aA6Ev3bY2HI4y0CAyr9H8FRWgX4hZ9+K7C2nzdc=" 
        crossorigin="anonymous">
    </script>

    <!-- Calander -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- JS -->
    <script src="${ pageContext.servletContext.contextPath }/resources/js/reservation/general_reservation.js"></script>

</head>
<body>

    <!-- Header -->
	<%@ include file="/WEB-INF/views/common/main_header.jsp"%>

    <br><br>
    
    <!-- Caution -->
    <div class="reservation_caution_wrapper">
        <div class="reservation_caution">
            <p class="reservation_word1">유의사항</p>
            <br>
            <p class="reservation_word2">* 본 예약은 확정 예약이 아닙니다.</p>
            <p class="reservation_word3">병원으로부터 예약안내 연락을 받아야 확정되오니, 착오 없으시길 바랍니다.</p>
            <br>
            <p class="reservation_word">* 진료 예약취소는 예약일 3일전까지 가능합니다.</p>
        </div>
    </div>

    <!-- Subject Select -->
    <div class="reservation_subject_select">
        <div class="reservation_subject_select_title " onclick="openContent(this)">
            <p>예약 과목 선택</p>
            <img src="${ pageContext.servletContext.contextPath }/resources/img/down_arrow.png" alt="down_arrow">
        </div>
        <div class="reservation_subject_select_content">
            <p>진료 과목</p>
            <button>소아과</button>
            <br><br>
            <input type="text" placeholder="증상을 입력해주세요">
        </div>
        <div class="reservation_subject_select_title" onclick="openContent(this)">
            <p>예약 날짜 선택</p>
            <img src="${ pageContext.servletContext.contextPath }/resources/img/down_arrow.png" alt="down_arrow">
        </div>
        <div class="reservation_subject_select_content">
            <div id="datepicker"></div>
        </div>
        <div class="reservation_subject_select_title" onclick="openContent(this)">
            <p>예약 시간 선택</p>
            <img src="${ pageContext.servletContext.contextPath }/resources/img/down_arrow.png" alt="down_arrow">
        </div>
        <div class="reservation_subject_select_content">
            <p>오전</p>
            <div class="reservation_time">
                <button>10:00</button>
                <button>10:30</button>
                <button>11:00</button>
                <button>11:30</button>
            </div>
            <p>오후</p>
            <div class="reservation_time">
                <button>12:00</button>
                <button>12:30</button>
                <button>13:00</button>
                <button>13:30</button>
                <button>14:00</button>
                <button>15:00</button>
                <button>16:00</button>
                <button>16:30</button>
            </div>
        </div>
        <div class="reservation_subject_select_title" onclick="openContent(this)">
            <p>예약자 선택</p>
            <img src="${ pageContext.servletContext.contextPath }/resources/img/down_arrow.png" alt="down_arrow">
        </div>
        <div class="reservation_subject_select_content">
            <div class="reservation_isyou">
                <label for="isyou">
                    회원 정보와 동일
                    <input type="checkbox" id="isyou">
                </label>
            </div>
            <br><br>
            <input type="text" placeholder="이름을 입력해주세요">
            <br><br>
            <input type="text" placeholder="생년월일을 입력해주세요">
        </div>
    </div>

    <div class="reservation_button">
        <button>예약 신청하기</button>
    </div>

    <!-- Footer -->
    <%@ include file="/WEB-INF/views/common/main_footer.jsp"%>

</body>
</html>