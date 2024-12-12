<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.project.trinity.member.model.vo.Member" %>
<%
    Member loginUser = (Member)session.getAttribute("loginUser");
    String userName = loginUser != null ? loginUser.getUserName() : "";
    String birthday = loginUser != null ? loginUser.getBirthday() : "";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>닥터링</title>

    <!-- Calander -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
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
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_datepicker.css">
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

    <!-- JS -->
    <script src="${ pageContext.servletContext.contextPath }/resources/js/reservation/general_reservation.js"></script>

</head>
<body>

    <!-- Header -->
	<%@ include file="/WEB-INF/views/common/main_header.jsp"%>

    <br><br>
    
    <input type="hidden" id="curTime" value="${curTime}">
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
    <form action="${pageContext.request.contextPath}/reservation/gReservation" class="general_reservation_form" method="POST">
        <div class="reservation_subject_select">
            <div class="reservation_subject_select_title reservation_notNullDate" onclick="openContent(this)">
                <p>예약 과목 선택</p>
                <img src="${ pageContext.servletContext.contextPath }/resources/img/down_arrow.png" alt="down_arrow">
            </div>
            <div class="reservation_subject_select_content" id="reservation_subject_select_content1">
                <p>진료 과목</p>
                <ul>
                <li>${ hInfo.department}</li>
                <input type="hidden" id="hosNo" name="hosNo" value="${hInfo.hosNo}">
                <input type="hidden" id="subject" name="subject" value="${hInfo.department}">
                <br><br>
                <input type="text" id="subject_select_content" name="content" placeholder="증상을 입력해주세요">
            </div>
            <div class="reservation_subject_select_title reservation_datepicker" onclick="openContent(this)">
                <p>예약 날짜 선택</p>
                <img src="${ pageContext.servletContext.contextPath }/resources/img/down_arrow.png" alt="down_arrow">
            </div>
            <div class="reservation_subject_select_content">
                <div id="datepicker"></div>
                <input type="hidden" id="gReservation_date" name="gReservation_date">
            </div>
            <div class="reservation_subject_select_title reservation_notNullDate" onclick="openContent(this)">
                <p>예약 시간 선택</p>
                <img src="${ pageContext.servletContext.contextPath }/resources/img/down_arrow.png" alt="down_arrow">
            </div>
            <div class="reservation_subject_select_content" name="resTime">
                <p>오전</p>
                <ul class="reservation_time">
                    <li data-time="09:00">09:00</li>
                    <li data-time="09:30">09:30</li>
                    <li data-time="10:00">10:00</li>
                    <li data-time="10:30">10:30</li>
                    <li data-time="11:00">11:00</li>
                    <li data-time="11:30">11:30</li>
                </ul>
                <p>오후</p>
                <ul class="reservation_time">
                    <li data-time="13:00">13:00</li>
                    <li data-time="13:30">13:30</li>
                    <li data-time="14:00">14:00</li>
                    <li data-time="14:30">14:30</li>
                    <li data-time="15:00">15:00</li>
                    <li data-time="15:30">15:30</li>
                    <li data-time="16:00">16:00</li>
                    <li data-time="16:30">16:30</li>
                    <li data-time="17:00">17:00</li>
                    <li data-time="17:30">17:30</li>
                </ul>
                <input type="hidden" id="resTime" name="resTime">
            </div>
            <div class="reservation_subject_select_title reservation_notNullDate" onclick="openContent(this)">
                <p>예약자 선택</p>
                <img src="${ pageContext.servletContext.contextPath }/resources/img/down_arrow.png" alt="down_arrow">
            </div>
            <div class="reservation_subject_select_content">
                <div class="reservation_isyou">
                    <label for="isyou">
						회원 정보와 동일
                        <input type="checkbox" id="isyou" onchange="isYouCheckChange(this.checked)">
                    </label>
                    <input type="hidden" id="userNo" name="userNo" data-checkvalue="${loginUser.userNo}">
                </div>
                <br><br>
                <input type="text" placeholder="이름을 입력해주세요" id="userName" name="userName" data-checkvalue="${loginUser.userName}">
                <br><br>
                <input type="text" placeholder="생년월일 ex) 991201" id="birthday" name="birthday" data-checkvalue="${loginUser.birthday}">
                <br><br>
                <div class="reservation_phone">
                    <input type="hidden" id="phone0" value="${loginUser.phone}" data-checkvalue="${loginUser.phone}">
                    <select name="phone1" id="phone1" data-checkvalue="${loginUser.phone}">
                        <option id="010" value="010">010</option>
                        <option id="012" value="012">012</option>
                        <option id="013" value="013">013</option>
                        <option id="015" value="015">015</option>
                    </select>
                    <input type="text" id="phone2" name="phone2" data-checkvalue="${loginUser.phone}" oninput="updateHiddenInput(this.value)">
                    <input type="text" id="phone3" name="phone3" data-checkvalue="${loginUser.phone}" oninput="updateHiddenInput(this.value)">
                    <input type="hidden" id="phone" name="phone">
                </div>
                <br><br>
                <input type="text" placeholder="이메일을 입력해주세요" id="email" name="email" data-checkvalue="${loginUser.email}">
                <br><br>
                <select id="gender" name="gender" data-checkvalue="${loginUser.gender}">
                    <option id="select" selected disabled>성별</option>
                    <option id="male" value="M">남성</option>
                    <option id="female" value="F">여성</option>
                </select>
            </div>
        </div>

        <div class="reservation_button">
            <button>예약 신청하기</button>
        </div>
    </form>

    <!-- Footer -->
    <%@ include file="/WEB-INF/views/common/main_footer.jsp"%>

</body>
</html>