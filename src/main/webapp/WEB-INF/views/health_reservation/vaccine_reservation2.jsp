<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>백신 예약</title>

<!-- jQuery 및 jQuery UI 스타일 및 스크립트 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 프로젝트의 공통 CSS -->
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/common/default.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/health_reservation/health_reservation2.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/common/custom_datepicker.css">
</head>
<body>
	<!-- Header 포함 -->
	<jsp:include page="../common/main_header.jsp" />

	<div class="health_reservation1_wrap">
		<div class="health_reservation1_container">
			<!-- 페이지 타이틀 -->
			<div class="health_reservation1_title">백신 예약</div>
			<!-- 예약 폼 시작 -->
			<form id="reservationForm"
				action="${pageContext.request.contextPath}/vaccineReservation/submitReservation"
				method="post">
				
				<!-- 백신 예약 1단계에서 전달된 데이터들 (숨김 필드로 유지) -->
				<input type="hidden" name="patientName" value="${vaccineReservation.patientName}">
				<input type="hidden" name="patientBirthday" value="${vaccineReservation.patientBirthday}">
				<input type="hidden" name="userNo" value="${vaccineReservation.userNo}">
				<input type="hidden" name="gender" value="${vaccineReservation.gender}">
				<input type="hidden" name="phonCode" id="phoneCode" value="${vaccineReservation.phoneCode}">
				<input type="hidden" name="phoneNumber" id="phoneNumber" value="${vaccineReservation.phoneNumber}">
				<input type="hidden" name="emailLocal" id="emailLocal" value="${vaccineReservation.emailLocal}">
				<input type="hidden" name="emailDomain" id="emailDomain" value="${vaccineReservation.emailDomain}">

				<!-- 백신 종류 선택 -->
				<div class="health_reservation2_content">
					<div id="health_reservation1_content_title">3. 백신 종류</div>
					<div class="health_reservation_normal_select">
						<select name="vType" required>
							<option value="" disabled hidden selected>백신 종류</option>
							<option value="독감">독감</option>
							<option value="코로나">코로나</option>
							<option value="A형간염">A형간염</option>
							<option value="일본뇌염">일본뇌염</option>
						</select>
					</div>
				</div>

				<!-- 접종받을 기관 선택 -->
				<div class="health_reservation2_content">
					<div id="health_reservation1_content_title">4. 접종받을 기관</div>
					<div class="health_reservation_normal_select">
						<select name="hosNo" required>
							<c:forEach var="hospital" items="${hospitalList}">
								<!-- 병원 목록 동적 렌더링 -->
								<option value="${hospital.hosNo}">${hospital.hosName}</option>
							</c:forEach>
						</select>
					</div>
				</div>

				<!-- 특이사항 입력 -->
				<div class="health_reservation2_content">
					<div id="health_reservation1_content_title">5. 특이사항</div>
					<div id="health_reservation_inputText">
						<textarea name="resContent" placeholder="알레르기, 부작용 반응 등 작성"></textarea>
					</div>
				</div>

				<!-- 날짜 및 시간 선택 -->
				<div class="health_reservation2_content">
					<div id="health_reservation1_content_title">6. 날짜 및 시간</div>
					<div class="health_reservation_normal_date">
						<div id="datepicker">
							<input type="date" name="vresDate" class="styled-date-input"
								placeholder="예약 날짜를 선택하세요" required>
						</div>
					</div>

					<div class="health_reservation_normal_select">
						<select name="timeOfDay" id="timeOfDaySelect" required>
							<option value="" disabled hidden selected>시간 선택</option>
							<option value="morning">오전</option>
							<option value="afternoon">오후</option>
						</select>
					</div>
					<div class="health_reservation_normal_select" id="specificTimeSelectContainer">
						<select name="vresTime" id="specificTimeSelect" required>
							<option value="" disabled hidden selected>구체적인 시간 선택</option>
						</select>
					</div>
				</div>

				<!-- 예약 버튼 -->
				<div class="reservation_btn_area">
					<button id="reservation_btn" type="submit">예약</button>
				</div>
			</form>
		</div>
	</div>

	<!-- Script -->
	<script>
	$(function() {
	    // 오늘 날짜 가져오기
	    const today = new Date();

	    // jQuery UI의 날짜 선택기 설정
	    $("#datepicker").datepicker({
	        dateFormat: "yy-mm-dd", // 날짜 포맷 설정
	        minDate: today, // 오늘 이후 날짜만 선택 가능
	        onSelect: function(dateText) {
	            $('input[name="vresDate"]').val(dateText); // 선택한 날짜를 입력 필드에 설정
	        }
	    });

	    // 오전/오후 선택 시 시간 옵션 동적 업데이트
	    $('#timeOfDaySelect').on('change', function() {
	        const timeOfDay = $(this).val();
	        const specificTimeSelect = $('#specificTimeSelect');
	        specificTimeSelect.empty(); // 기존 옵션 제거

	        if (timeOfDay === 'morning') {
	            specificTimeSelect.append(new Option('9:00', '09:00'));
	            specificTimeSelect.append(new Option('9:30', '09:30'));
	            specificTimeSelect.append(new Option('10:00', '10:00'));
	            specificTimeSelect.append(new Option('10:30', '10:30'));
	            specificTimeSelect.append(new Option('11:00', '11:00'));
	            specificTimeSelect.append(new Option('11:30', '11:30'));
	        } else if (timeOfDay === 'afternoon') {
	            specificTimeSelect.append(new Option('1:00', '13:00'));
	            specificTimeSelect.append(new Option('1:30', '13:30'));
	            specificTimeSelect.append(new Option('2:00', '14:00'));
	            specificTimeSelect.append(new Option('2:30', '14:30'));
	            specificTimeSelect.append(new Option('3:00', '15:00'));
	            specificTimeSelect.append(new Option('3:30', '15:30'));
	            specificTimeSelect.append(new Option('4:00', '16:00'));
	            specificTimeSelect.append(new Option('4:30', '16:30'));
	            specificTimeSelect.append(new Option('5:00', '17:00'));
	            specificTimeSelect.append(new Option('5:30', '17:30'));
	        }

	        // 시간 선택 필드 표시
	        $('#specificTimeSelectContainer').show();
	    });
	});

	// 폼 제출 시 데이터 검증 및 AJAX 요청 처리
	$("#reservationForm").submit(function (event) {
	    event.preventDefault(); // 기본 폼 제출 방지

	    // 성별 값 검증
	    const gender = $("input[name='gender']").val();
	    if (!gender || !["1", "2", "3", "4"].includes(gender)) {
	        alert("올바른 성별을 입력하세요.");
	        return;
	    }

	    // 이메일 값 검증
	    const emailLocal = $('#emailLocal').val();
	    const emailDomain = $('#emailDomain').val();
	    const email = emailLocal + "@" + emailDomain;

	    if (!emailLocal || !emailDomain) {
	        alert("이메일을 입력하세요.");
	        return;
	    }
	    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
	        alert("올바른 이메일 형식을 입력하세요.");
	        return;
	    }

	    // 전화번호 값 검증
	    const phoneCode = $("#phoneCode").val();
	    const phoneNumber = $("#phoneNumber").val();
	    const fullPhoneNumber = phoneCode + phoneNumber;
	    if (!/^\d{10,11}$/.test(fullPhoneNumber)) {
	        alert("올바른 전화번호 형식을 입력하세요 (예: 01012345678).");
	        return;
	    }

	    // 서버로 보낼 데이터 구성
	    const formData = $(this).serializeArray();
	    formData.push({ name: "fullPhoneNumber", value: fullPhoneNumber });
	    formData.push({ name: "email", value: email });

	    // AJAX 요청
	    $.ajax({
	        type: "POST",
	        url: "/trinity/vaccineReservation/submitReservationAjax",
	        data: formData,
	        success: function (response) {
	            if (response === "success") {
	                alert("예약이 완료되었습니다.");
	                window.location.href = "/trinity/main";
	            } else {
	                alert("예약 중 문제가 발생했습니다: " + response);
	            }
	        },
	        error: function (xhr) {
	            alert("서버와의 통신 중 오류가 발생했습니다.");
	        }
	    });
	});
	</script>

	<!-- Footer 포함 -->
	<jsp:include page="../common/main_footer.jsp" />
</body>
</html>
