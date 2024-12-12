<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />

<title>닥터링</title>

<!-- searchBar icon -->
<link rel="favicon"
	href="${ pageContext.servletContext.contextPath }/resources/img/favicon.ico" />
<link rel="icon"
	href="${ pageContext.servletContext.contextPath }/resources/img/favicon.ico"
	type="image/x-icon" />

<!-- font style -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<!-- icon -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<!-- css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/main.css">
<!-- <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" /> -->

<!-- JS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script
	src="${ pageContext.servletContext.contextPath }/resources/js/main.js"></script>
<!-- <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script> -->
</head>
<body>
	<c:if test="${ not empty message}">
		<script>
			alert("${message}");
		</script>
		<c:remove var="message" scope="session" />
	</c:if>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/common/main_header.jsp"%>
	<input type="hidden" id="general_reservation_ok" value="${message}">


	<div class="wrapper">
		<br>

		<!-- SearchBar -->
		<div class="searchBar_wrapper">
			<div class="searchBar">
				<form action="hospital/list" class="searchBar_form">
					<input type="text" placeholder="검색어를 입력하세요." name="keyword">
					<button type="submit" id="main_search_btn">
						<div class="searchBar_img">
							<img
								src="${ pageContext.servletContext.contextPath }/resources/img/search.png"
								alt="search" width="15" height="15">
						</div>
					</button>
				</form>
			</div>
		</div>

		<br> <br>

		<!-- 3 Button -->
		<div class="shortCutButton">
			<button class="reservation"
				onclick="location.href='${pageContext.request.contextPath}/hospital/list'">예약하기</button>
			<div class="find">
				<button class="findHos"
					onclick="location.href='${pageContext.request.contextPath}/hospital/list'">병원찾기</button>
				<button class="findPh"
					onclick="location.href='${pageContext.request.contextPath}/community/main'">커뮤니티 바로가기</button>
			</div>
		</div>

		<br> <br>

		<!-- 6 Icon -->
		<div class="shortCutIcon">
			<div class="icon">
				<a
					href="${pageContext.request.contextPath}/healthReservation/reservationSearch">
					<img
					src="${ pageContext.servletContext.contextPath }/resources/img/checkReservation.png"
					alt="checkReservation">
					<p>예약 정보 확인</p>
				</a>
			</div>
			<div class="icon">
				<a href="${pageContext.request.contextPath}/hospital/list/openHos">
					<img
					src="${ pageContext.servletContext.contextPath }/resources/img/openHospital.png"
					alt="openHospital">
					<p>열린 병원</p>
				</a>
			</div>
			<div class="icon">
				<a href="${pageContext.request.contextPath}/member/reservationconfirmation"> 
					<img
					src="${ pageContext.servletContext.contextPath }/resources/img/checkHistory.png"
					alt="checkHistory">
					<p>예약 확인</p>
				</a>
			</div>
			<div class="icon">
				<a href="https://www.nhis.or.kr/nhis/index.do"> <img
					src="${ pageContext.servletContext.contextPath }/resources/img/checkHealthChart.png"
					alt="checkHealthChart">
					<p>건강검진기록</p>
				</a>
			</div>
			<div class="icon">
				<a href="${pageContext.request.contextPath}/healthReservation/vaccinepage1"> <img
					src="${ pageContext.servletContext.contextPath }/resources/img/reservationVaccine.png"
					alt="reservationVaccine">
					<p>백신예약</p>
				</a>
			</div>
			<div class="icon">
				<a
					href="${pageContext.request.contextPath}/healthReservation/reservation1">
					<img
					src="${ pageContext.servletContext.contextPath }/resources/img/reservationHealthCheck.png"
					alt="reservationHealthCheck">
					<p>건강검진 예약</p>
				</a>
			</div>
		</div>

		<br> <br>

		<!-- Board -->
		<div class="board">
			<div class="board_category">
				<div>
					<a href="${pageContext.request.contextPath}/notice">공지사항</a>
				</div>
				<div>
					<a href="${pageContext.request.contextPath}/event">이벤트</a>
				</div>
			</div>
			<div class="board_content_wrapper">
				<!-- 공지사항 -->
				<div class="board_content">
					<c:forEach var="notice" items="${latestNoticePosts}">
						<div class="board_content-detail">
							<div class="board_content1">
								<a href="${pageContext.request.contextPath}/inquiry/inquiryDetail?ino=${notice.inquiryNo}">
									${notice.inquiryTitle}
								</a>
							</div>
							<div class="board_content2">${notice.enrollDate}</div>
						</div>
					</c:forEach>
				</div>
			
				<!-- 이벤트 -->
				<div class="board_content">
					<c:forEach var="event" items="${latestEventPosts}">
						<div class="board_content-detail">
							<div class="board_content1">
								<a href="${pageContext.request.contextPath}/community/boardDetail?bno=${event.boardNo}">
									${event.boardTitle}
								</a>
							</div>
							<div class="board_content2">${event.enrollDate}</div>
						</div>
					</c:forEach>
				</div>
			</div>
				<!-- 실시간 인기글로 이동하는 더보기 버튼 -->
				<div class="more-button">
					<a href="${pageContext.request.contextPath}/community/main">더보기 ></a>
				</div>
			</div>
			
		

		<br> <br>

		<!-- Commercial -->
		<!-- Slider main container -->
		<div class="swiper mySwiper">
			<!-- Additional required wrapper -->
			<div class="swiper-wrapper">
				<!-- Slides -->
				<div class="swiper-slide">
					<img
						src="${ pageContext.servletContext.contextPath }/resources/img/ad6.jpg"
						alt="ad6" id="ad1">
				</div>
				<div class="swiper-slide">
					<img
						src="${ pageContext.servletContext.contextPath }/resources/img/ad3.jpg"
						alt="ad3" id="ad2">
				</div>
				<div class="swiper-slide">
					<img
						src="${ pageContext.servletContext.contextPath }/resources/img/ad4.jpg"
						alt="ad4" id="ad3">
				</div>
				<div class="swiper-slide">
					<img
						src="${ pageContext.servletContext.contextPath }/resources/img/ad5.jpg"
						alt="ad5" id="ad4">
				</div>
			</div>

			<!-- Pagination -->
			<div class="swiper-pagination"></div>

			<!-- If we need navigation buttons -->
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
		</div>

		<br> <br>

		<div class="advertise_wrapper">
			<div class="advertise_wrapper_1">
				<!-- advertise1 -->
				<div class="advertise1">
					<div class="advertiseLeft">
						<div>
							<p>인증된 리뷰</p>
							<p>${amountCount[0]}개</p>
						</div>
						<div>
							<p>회원 수</p>
							<p>${amountCount[1]}명</p>
						</div>
						<div>
							<p>의사 수</p>
							<p>${amountCount[2]}명</p>
						</div>
					</div>
					<div class="advertiseRight"><img src="${ pageContext.servletContext.contextPath }/resources/img/reviewSkeleton.png" alt="reviewSkeleton"></div>
				</div>

				<br> <br>

				<!-- advertise2 -->
				<div class="advertise2">
					<div class="advertise2_1">
						<p class="p1">혹시 의사, 병원관계자이신가요?</p>
						<p class="p2">무료로 병원 광고하세요!</p>
					</div>
					<div class="advertise2_2">
						<a href=""><img
							src="${ pageContext.servletContext.contextPath }/resources/img/go.png"
							alt=""></a>
					</div>
				</div>
			</div>
		</div>


		<br> <br>

		<!-- information -->
		<div class="inform">
			<div class="inform_title">상담 및 안내</div>
			<div class="inform_content" onclick="location.href='${pageContext.servletContext.contextPath}/inquiry/main?categoryId=CAT04'">공지사항</div>
			<div class="inform_content" onclick="location.href='${pageContext.servletContext.contextPath}/inquiry/main?categoryId=CAT05'">알림판</div>
			<div class="inform_content" onclick="location.href='${pageContext.servletContext.contextPath}/inquiry/main?categoryId=CAT06'">FAQ</div>
			<div class="inform_content" onclick="location.href='${pageContext.servletContext.contextPath}/inquiry/main?categoryId=CAT07'">Q&A</div>
			<div class="inform_content">고객센터(1577-0000)</div>
		</div>

		<br> <br>
	</div>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/common/main_footer.jsp"%>
</body>
</html>
