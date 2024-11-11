<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>건강검진 결과 조회</title>
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
                검진 결과 조회
            </div>
            <div class="health_reservation1_content">
                <div id="reservation_content_title">
                    1. 검진자 정보
                </div>
                <p>검진자(성명)</p>
                    <div class="health_reservation1_content input_name">
                        <input type="text">
                    </div>
                <p>주민번호</p>
                <div class="health_reservation1_content input_id_num">
                    <input type="text"> - <input type="password" maxlength="1">
                    <p>******</p>
                </div>
            </div>
            <div class="health_reservation1_content">
                <div id="reservation_content_title">
                    2. 검사 항목
                </div>
                <div class="health_reservation_select">
                    <select name="" id="">
                        <option value="" disabled hidden selected>검사항목</option>
                        <option value="" >1번</option>
                        <option value="" >2번</option>
                        <option value="" >3번</option>
                        <option value="" >4번</option>
                    </select>
                </div>
            </div>
            <div class="health_reservation1_content">
                <div id="reservation_content_title">
                    3. 검사 받았던 기관
                </div>
                <div class="health_reservation_select">
                    <select name="" id="">
                        <option value="" disabled hidden selected>검사 받은 기관</option>
                        <option value="" >1번</option>
                        <option value="" >2번</option>
                        <option value="" >3번</option>
                        <option value="" >4번</option>
                    </select>
                </div>
            </div>
            <div class="reservation_btn_area">
                <button id="reservation_btn"  type="button" onclick="location.href=''">조회하기</button>
            </div>
        </div>
    </div>
    <!-- footer -->
	<jsp:include page="../common/main_footer.jsp"/>
</body>
</html>