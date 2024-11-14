<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
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
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/main.css">

	<!-- JS -->
	<script src="${ pageContext.servletContext.contextPath }/resources/js/main.js"></script>

</head>
<body>
	
	<!-- Header -->
	<%@ include file="/WEB-INF/views/common/main_header.jsp"%>

	<div class="wrapper">
		<br>

		<!-- SearchBar -->
		<div class="searchBar_wrapper">
			<div class="searchBar">
				<input type="text" placeholder="검색어를 입력하세요.">
				<div class="searchBar_img">
					<a href=""><img src="${ pageContext.servletContext.contextPath }/resources/img/search.png"
						alt="search" width="15" height="15"></a>
				</div>
			</div>
		</div>

		<br>
		<br>

		<!-- 3 Button -->
		<div class="shortCutButton">
			<button class="reservation" onclick="location.href='${pageContext.request.contextPath}/hospital/list'">예약하기</button>
			<div class="find">
				<button class="findHos" onclick="location.href='${pageContext.request.contextPath}/hospital/list'">병원찾기</button>
				<button class="findPh">가까운 약국 찾기</button>
			</div>
		</div>

		<br>
		<br>

		<!-- 6 Icon -->
		<div class="shortCutIcon">
			<div class="icon">
				<a href=""> <img
					src="${ pageContext.servletContext.contextPath }/resources/img/checkReservation.png"
					alt="checkReservation">
					<p>예약 정보 확인</p>
				</a>
			</div>
			<div class="icon">
				<a href="hospital_list"> <img src="${ pageContext.servletContext.contextPath }/resources/img/openHospital.png"
					alt="openHospital">
					<p>열린 병원</p>
				</a>
			</div>
			<div class="icon">
				<a href=""> <img src="${ pageContext.servletContext.contextPath }/resources/img/checkHistory.png"
					alt="checkHistory">
					<p>진료기록 확인</p>
				</a>
			</div>
			<div class="icon">
				<a href=""> <img
					src="${ pageContext.servletContext.contextPath }/resources/img/checkHealthChart.png"
					alt="checkHealthChart">
					<p>건강검진기록</p>
				</a>
			</div>
			<div class="icon">
				<a href=""> <img
					src="${ pageContext.servletContext.contextPath }/resources/img/reservationVaccine.png"
					alt="reservationVaccine">
					<p>백신예약</p>
				</a>
			</div>
			<div class="icon">
				<a href="health.guide"> <img
					src="${ pageContext.servletContext.contextPath }/resources/img/reservationHealthCheck.png"
					alt="reservationHealthCheck">
					<p>건강검진 예약</p>
				</a>
			</div>
		</div>

		<br>
		<br>

		<!-- Board -->
		<div class="board">
			<div class="board_category">
				<div>
					<a href="">공지사항</a>
				</div>
				<div>
					<a href="">이벤트</a>
				</div>
			</div>
			<div class="board_content_wrapper">
				<div class="board_content">
					<div class="board_content1">공단 노후 장비 교체 작업 안내</div>
					<div class="board_content2">2024-11-01</div>
				</div>
				<div class="board_content">
					<div class="board_content1">챗봇 상담</div>
					<div class="board_content2">2024-11-01</div>
				</div>
				<div class="board_content">
					<div class="board_content1">모바일 신분증</div>
					<div class="board_content2">2024-11-01</div>
				</div>
			</div>
			<div class="board_more">
				<a href="">더보기<img src="${ pageContext.servletContext.contextPath }/resources/img/arrow.png"
					alt=""></a>
			</div>
		</div>

		<br>
		<br>

		<!-- Commercial -->
		<div class="commercial">광고판</div>

		<br>
		<br>

		<div class="advertise_wrapper">
			<div class="advertise_wrapper_1">
				<!-- advertise1 -->
				<div class="advertise1">
					<div class="advertiseLeft">
						<div>
							<p>인증된 리뷰</p>
							<p>0개</p>
						</div>
						<div>
							<p>회원 수</p>
							<p>0명</p>
						</div>
						<div>
							<p>의사 수</p>
							<p>0명</p>
						</div>
					</div>
					<div class="advertiseRight">그림</div>
				</div>

				<br>
				<br>

				<!-- advertise2 -->
				<div class="advertise2">
					<div class="advertise2_1">
						<p class="p1">혹시 의사, 병원관계자이신가요?</p>
						<p class="p2">무료로 병원 광고하세요!</p>
					</div>
					<div class="advertise2_2">
						<a href=""><img src="${ pageContext.servletContext.contextPath }/resources/img/go.png" alt=""></a>
					</div>
				</div>
			</div>
		</div>


		<br>
		<br>

		<!-- information -->
		<div class="inform">
			<div class="inform_title">상담 및 안내</div>
			<div class="inform_content">상담/문의</div>
			<div class="inform_content">국민제안</div>
			<div class="inform_content">칭찬해요/속상해요</div>
			<div class="inform_content">자주묻는 질문</div>
			<div class="inform_content">고객센터(1577-0000)</div>
		</div>

		<br>
		<br>
	</div>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/common/main_footer.jsp"%>
	
</body>
</html>
