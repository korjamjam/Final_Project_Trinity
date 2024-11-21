<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>백신 예약</title>
<!-- css -->
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/health_reservation/health_reservation.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../common/main_header.jsp" />
	<div class="health_reservation_wrap">
		<div class="health_reservation_container">
			<div id="health_reservation_title">백신 예약</div>
			<div class="health_reservation1_content">
				<div id="reservation_content_title">1. 접종자 정보</div>
				<form action="${pageContext.request.contextPath}/vaccineReservation/vaccinepage2" method="post">
					<p>접종자(성명)</p>
					<div class="health_reservation1_content input_name">
						<input type="text" name="patientName" required>
					</div>
					<p>주민번호</p>
					<div class="health_reservation1_content input_id_num">
						<input type="text" name="patientBirthday" maxlength="6" placeholder="yymmdd"required>
						<!-- YYMMDD 형식으로 입력 -->
						- <input type="text" name="gender" maxlength="1">
						<p>******</p>
					</div>
					<p>핸드폰</p>
					<div class="health_reservation1_content input_phone">
						<select name="phoneNumber">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="012">012</option>
							<option value="013">013</option>
						</select> <input type="text" name="phoneNumber" maxlength="8" required
							placeholder=" -없이 입력하세요">
					</div>
					<p>이메일</p>
					<div class="health_reservation1_content input_email">
						<input type="text" name="email" required> @ <select
							name="emailDomain">
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hanmail.com">hanmail.com</option>
						</select>
					</div>
					<!-- 기타 정보둘 -->
					<input type="hidden" name="userNo" value="${sessionScope.userNo}">
					
					<div class="health_reservation1_content2">
						<div id="reservation_content_title">2. 개인정보 수집 및 이용 동의</div>
						<div class="health_reservation1_tos">
							<table>
								<thead>
									<tr>
										<td>이용목적</td>
										<td>수집항목</td>
										<td>보유 및 이용 기간</td>
									</tr>
								</thead>
								<tr>
									<td>검진예약</td>
									<td>*필수항목: 성명, 성별, 생년 월일, 휴대폰 번호, 결과받을 주소 <br> *선택항목:
										이메일
									</td>
									<td>계약 및 청약철회 등에 관한 기록 : 5년 <br> 대금결제 및 재화 등의 공급에 관한
										기록 : 5년 <br> 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년
									</td>
								</tr>
							</table>
						</div>
						<div class="reservation_btn_area">
							<button id="reservation_btn" type="submit">다음</button>
						</div>
					</div>
				</form>

			</div>
		</div>
		<script>
			function sample6_execDaumPostcode() {
				new daum.Postcode(
						{
							oncomplete : function(data) {
								var addr = '';
								var extraAddr = '';

								if (data.userSelectedType === 'R') {
									addr = data.roadAddress;
								} else {
									addr = data.jibunAddress;
								}

								if (data.userSelectedType === 'R') {
									if (data.bname !== ''
											&& /[동|로|가]$/g.test(data.bname)) {
										extraAddr += data.bname;
									}
									if (data.buildingName !== ''
											&& data.apartment === 'Y') {
										extraAddr += (extraAddr !== '' ? ', '
												+ data.buildingName
												: data.buildingName);
									}
									if (extraAddr !== '') {
										extraAddr = ' (' + extraAddr + ')';
									}
									document
											.getElementById("sample6_extraAddress").value = extraAddr;

								} else {
									document
											.getElementById("sample6_extraAddress").value = '';
								}

								document.getElementById('sample6_postcode').value = data.zonecode;
								document.getElementById("sample6_address").value = addr;
								document
										.getElementById("sample6_detailAddress")
										.focus();
							}
						}).open();
			}
		</script>
		<!-- footer -->
		<jsp:include page="../common/main_footer.jsp" />
</body>
</html>