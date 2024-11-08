<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>백신 예약</title>
        
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- css -->
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/health_reservation/health_reservation2.css">
 
</head>
<body>
	<!-- header -->
	<jsp:include page="../common/main_header.jsp"/>
	<div class="health_reservation1_wrap">
        <div class="health_reservation1_container">
            <div class="health_reservation1_title">
                백신 예약
            </div>
            <div class="health_reservation2_content">
                <div id="health_reservation1_content_title">
                    3. 백신 종류
                </div>
                <div class="health_reservation_normal_select">
                    <select name="" id="">
                        <option value="" disabled hidden selected>검진 종류</option>
                        <option value="">1</option>
                        <option value="">2</option>
                        <option value="">3</option>
                    </select>
                </div>
            </div>
            <div class="health_reservation2_content" style="display: none;">
                <div id="health_reservation1_content_title">
                    3-1. 선택 검사 항목
                </div>
                <div class="health_reservation_normal_select">
                    <select name="" id="">
                        <option value="" disabled hidden selected>검진 종류</option>
                        <option value="">일반건강검진</option>
                        <option value="">암검진</option>
                        <option value="">생애주기전환검진</option>
                    </select>
                </div>
            </div>
            <div class="health_reservation2_content">
                <div id="health_reservation1_content_title">
                    4. 접종받을기관
                </div>
                <div class="health_reservation_normal_select">
                    <select name="" id="">
                        <option value="" disabled hidden selected>기관을 선택해주세요</option>
                        <option value="">1</option>
                        <option value="">2</option>
                        <option value="">3</option>
                    </select>
                </div>
            </div>
            <div class="health_reservation2_content">
                <div id="health_reservation1_content_title">
                    5. 특이사항
                </div>
                <div id="health_reservation_inputText">
                    <textarea name="" id="" placeholder="알레르기, 부작용 반응 등 작성"></textarea>
                </div>
            </div>
            <div class="health_reservation2_content">
                <div id="health_reservation1_content_title">
                    6. 날짜 및 시간
                </div>
                <div class="health_reservation_normal_date">
                    <div id="datepicker"></div>
                </div>
                <div class="health_reservation_normal_select">
                    <select name="" id="">
                        <option value="" disabled hidden selected>시간 선택</option>
                        <option value="">오전</option>
                        <option value="">오후</option>
                    </select>
                </div>
            </div>
            <div class="reservation_btn_area">
                <button id="reservation_btn">예약</button>
            </div>
        </div>
    </div>
    <script>
        $(function() {
          // 페이지에 바로 달력이 보이도록 설정
          $("#datepicker").datepicker({
            closeText: "닫기",
            currentText: "오늘",
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            weekHeader: "주",
            yearSuffix: '년',
            inline: true
          });
        });
    </script>
    <!-- footer -->
	<jsp:include page="../common/main_footer.jsp"/>
</body>
</html>