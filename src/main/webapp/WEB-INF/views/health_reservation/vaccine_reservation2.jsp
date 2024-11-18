<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>백신 예약</title>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- css -->
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_datepicker.css">
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/health_reservation/health_reservation2.css">

</head>
<body>
	<!-- header -->
	<jsp:include page="../common/main_header.jsp" />
	<div class="health_reservation1_wrap">
		<div class="health_reservation1_container">
			<div class="health_reservation1_title">백신 예약</div>
			<form
				action="${pageContext.request.contextPath}/healthReservation/submitReservation"
				method="post">
				<input type="hidden" name="resDate" value="${param.resDate}">
				<input type="hidden" name="userNo" value="${param.userNo}">
				<input type="hidden" name="patientName" value="${param.patientName}">
				<input type="hidden" name="patientBirthday"
					value="${param.patientBirthday}"> <input type="hidden"
					name="phone" value="${param.phoneCode}-${param.phoneNumber}">
				<input type="hidden" name="email"
					value="${param.email}@${param.emailDomain}"> <input
					type="hidden" name="address" value="${param.address}">
				<div class="health_reservation2_content">
					<div id="health_reservation1_content_title">3. 백신 종류</div>
					<div class="health_reservation_normal_select">
						<!-- 백신 종류 선택 -->
						<select name="vaccineCategory" required>
							<option value="" disabled hidden selected>백신 종류</option>
							<option value="1">백신 1</option>
							<option value="2">백신 2</option>
							<option value="3">백신 3</option>
						</select>
					</div>
				</div>
				<div class="health_reservation2_content" style="display: none;">
					<div id="health_reservation1_content_title">3-1. 선택 검사 항목</div>
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
					<div id="health_reservation1_content_title">4. 접종받을기관</div>
					<div class="health_reservation_normal_select">
						<select name="hosNo" required>
							<option value="" disabled hidden selected>기관 선택</option>
							<option value="1">기관 1</option>
							<option value="2">기관 2</option>
							<option value="3">기관 3</option>
						</select>
					</div>
				</div>
				<div class="health_reservation2_content">
					<div id="health_reservation1_content_title">5. 특이사항</div>
					<div id="health_reservation_inputText">
						<textarea name="specialNotes" placeholder="알레르기, 부작용 반응 등 작성"></textarea>
					</div>
				</div>
				<div class="health_reservation2_content">
					<div id="health_reservation1_content_title">6. 날짜 및 시간</div>
					<div class="health_reservation_normal_date">
						<div id="datepicker"></div>
					</div>
					<div class="health_reservation_normal_select">
						<select name="timeOfDay" id="timeOfDaySelect">
							<option value="" disabled hidden selected>시간 선택</option>
							<option value="morning">오전</option>
							<option value="afternoon">오후</option>
						</select>
					</div>
					<div class="health_reservation_normal_select"
						id="specificTimeSelectContainer">
						<select name="resTime" id="specificTimeSelect" required>
							<option value="" disabled hidden selected>구체적인 시간 선택</option>
						</select>
					</div>
				</div>
				<!--
				<div class="reservation_btn_area">
					<button id="reservation_btn" type="submit">예약</button>
				</div>
				 -->

				<div class="reservation_btn_area">
    <button id="reservation_btn" type="button" onclick="submitReservation()">예약</button>
</div>
			</form>
		</div>
	</div>

	<script>
    function submitReservation() {
        // 예약 완료 메시지 표시
        alert("예약이 완료되었습니다.");

        // 폼 전송
        const form = document.querySelector("form");
        form.action = "${pageContext.request.contextPath}/healthReservation/submitReservation";
        form.method = "post";
        form.submit();

        // 메인 페이지로 이동
        window.location.href = "${pageContext.request.contextPath}/main";
    }
		$(function() {
			// 날짜 선택 달력 설정
			$("#datepicker").datepicker(
					{
						closeText : "닫기",
						currentText : "오늘",
						prevText : '이전 달',
						nextText : '다음 달',
						monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
						dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
						dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
						weekHeader : "주",
						yearSuffix : '년',
						inline : true
					});

			// 오전/오후 선택에 따른 시간대 표시
			$('#timeOfDaySelect').on('change', function() {
				const timeOfDay = $(this).val();
				const specificTimeSelect = $('#specificTimeSelect');
				specificTimeSelect.empty(); // 기존 옵션 제거

				if (timeOfDay === 'morning') {
					specificTimeSelect.append(new Option('9:00', '9:00'));
					specificTimeSelect.append(new Option('9:30', '9:30'));
					specificTimeSelect.append(new Option('10:00', '10:00'));
					specificTimeSelect.append(new Option('10:30', '10:30'));
					specificTimeSelect.append(new Option('11:00', '11:00'));
					specificTimeSelect.append(new Option('11:30', '11:30'));
				} else if (timeOfDay === 'afternoon') {
					specificTimeSelect.append(new Option('1:00', '1:00'));
					specificTimeSelect.append(new Option('1:30', '1:30'));
					specificTimeSelect.append(new Option('2:00', '2:00'));
					specificTimeSelect.append(new Option('2:30', '2:30'));
					specificTimeSelect.append(new Option('3:00', '3:00'));
					specificTimeSelect.append(new Option('3:30', '3:30'));
					specificTimeSelect.append(new Option('4:00', '4:00'));
					specificTimeSelect.append(new Option('4:30', '4:30'));
					specificTimeSelect.append(new Option('5:00', '5:00'));
					specificTimeSelect.append(new Option('5:30', '5:30'));
				}

				// 구체적인 시간 선택 박스를 보여줌
				$('#specificTimeSelectContainer').show();
			});
		});
	</script>

	<jsp:include page="../common/main_footer.jsp" />
</body>
</html>