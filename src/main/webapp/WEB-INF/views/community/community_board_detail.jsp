<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html lang="ko">

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>게시글 상세 페이지</title>
			<!-- jQuery -->
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<!-- Bootstrap CSS -->
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
			<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
			<link href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_dropdown.css"
				rel="stylesheet">

			<link href="${ pageContext.servletContext.contextPath }/resources/css/community/community_board_detail.css"
				rel="stylesheet">
			<link href="${ pageContext.servletContext.contextPath }/resources/css/common/comments.css" rel="stylesheet">
			<script
				src="${ pageContext.servletContext.contextPath }/resources/js/community/community_board_detail.js"></script>

		</head>


		<body>
			<!-- EL 데이터를 JavaScript 변수로 전달 -->
			<script>
				const contextPath = "${pageContext.servletContext.contextPath}";
				const boardNo = "${b.boardNo}";
				const categoryId = "${b.categoryId}";  // categoryId 값을 JavaScript 변수로 전달
				const loginUserNo = "${loginUser != null ? loginUser.userNo : b.hosAcNo}";
				const loginUserId = "${loginUser != null ? loginUser.userId : b.hosName}";
			</script>

			<!-- Header Section -->
			<c:choose>
				<c:when test="${not empty loginHosAccount }">
					<header>
						<jsp:include page="/WEB-INF/views/hospital_detail/hospital_account_header.jsp" />
					</header>
				</c:when>
				<c:otherwise>
					<header>
						<%@ include file="/WEB-INF/views/common/main_header.jsp" %>
					</header>
				</c:otherwise>
			</c:choose>


			<main id="main-content">
				<!-- Sidebar Menu -->
				<div id="side-menu">
					<%@ include file="/WEB-INF/views/community/community_sidemenu.jsp" %>
				</div>

				<!-- Board Container -->
				<div id="main-wrapper">
					<div class="navigation-buttons">
						<!-- 왼쪽 섹션: 수정, 삭제 -->
						<div class="left-section">
							<c:if test="${loginUser != null && loginUser.userId eq b.boardWriter}">
								<!-- 수정 버튼 -->
								<button class="white-button"
									onclick="location.href='${pageContext.request.contextPath}/community/edit?bno=${b.boardNo}'">수정</button>
								<!-- 삭제 버튼 -->
								<button class="white-button"
									onclick="deleteBoard('${b.boardNo}', '${b.categoryId}')">삭제</button>
							</c:if>
						</div>

						<!-- 오른쪽 섹션: 목록 보기, 이전글, 다음글 -->
						<div class="right-section">
							<!-- 목록 보기 버튼 -->
							<a href="${pageContext.request.contextPath}/community/main?categoryId=${b.categoryId}"
								class="round-button">
								목록 보기
							</a>
							<div class="nav-links-group">
								<!-- 이전글 -->
								<c:choose>
									<c:when test="${prevBoard != null}">
										<a href="${pageContext.request.contextPath}/community/boardDetail?bno=${prevBoard.boardNo}"
											class="nav-text">
											&laquo; 이전글
										</a>
									</c:when>
								</c:choose>
								<!-- 다음글 -->
								<c:choose>
									<c:when test="${nextBoard != null}">
										<a href="${pageContext.request.contextPath}/community/boardDetail?bno=${nextBoard.boardNo}"
											class="nav-text">
											다음글 &raquo;
										</a>
									</c:when>
								</c:choose>
							</div>
						</div>
					</div>

					<div class="board-container">
						<!-- 게시글 상세 정보 -->
						<table class="board-detail">
							<tr>
								<td><span>게시판 &nbsp</span> &gt;
									<div class="custom-dropdown">
										<div class="selected-container">
											<div class="selected-option">${categoryName}</div>
											<!-- 컨트롤러에서 넘겨준 첫 번째 카테고리 이름 -->
											<div class="dropdown-arrow">▼</div>
										</div>
										<div class="option-list" id="community-options">
											<c:forEach var="category" items="${categories}">
												<div class="option-item" data-url="${category.categoryId}">				
													${category.categoryName}									
												</div>
											</c:forEach>
										</div>
									</div>
								</td>
							</tr>

							<tr>
								<td class="board-title">${b.boardTitle}</td>
								<td class="board-user-info">
									<span
										class="${sessionScope.loginUser != null && sessionScope.loginUser.userId == b.boardWriter ? 'highlight-user' : ''}">
										${b.boardWriter} </span>
								</td>
								<td class="board-meta">
									<span>${b.enrollDate}</span> |
									<span>조회 ${b.boardViews}</span>
								</td>
							</tr>
						</table>

						<div class="board-content-wrapper">
							<div class="board-content">
								<!-- 게시글 내용 -->
								${b.boardContent}
							</div>

							<!-- 첨부파일 섹션 include -->
							<c:if test="${not empty fileList}">
								<%@ include file="/WEB-INF/views/common/attached_files.jsp" %>
							</c:if>

							<div>
								<!-- 메디톡 카테고리에서만 답변하기 버튼 표시 -->
								<c:if test="${categoryName eq '메디톡' && loginUser != null && loginUser.medKey != null}">
									<div class="request-content">
										<p class="request-message">
											<span class="request-title">
												<span class="highlighted-user-id">${loginUser.userId}</span>님,
											</span><br>
											정보를 공유해 주세요.
										</p>

										<!-- 답변 버튼 -->
										<a class="round-button" href="#"
											onclick="handleAnswerClick('${pageContext.request.contextPath}/community/medAnswer?bno=${b.boardNo}')">
											답변하기
										</a>
									</div>
								</c:if>
							</div>
							<div id="answer-list">
								<c:forEach var="a" items="${ans}">
									<div class="board-content answer-item">
										<div class="answer-content">
											<div class="doctor-card">
												<div class="doctor-photo">
													<img src="${pageContext.servletContext.contextPath}/resources/img/doctor.jpg"
														alt="의사아이콘">
												</div>
												<div class="doctor-info">
													<div class="answer-author">작성자 : ${a.doctorName}</div>
													<div class="answer-field">${a.medicalFieldId}</div>
													<div class="answer-date">작성일 : ${a.enrollDate}</div>
												</div>
											</div>
											<div class="answer-text">${a.answerContent}</div>
											<!--좋아요 싫어요 버튼 -->
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>

					<%@ include file="/WEB-INF/views/common/comments.jsp" %>
				</div>
				<div class="empty-space"></div>
			</main>

			<footer>
				<%@ include file="/WEB-INF/views/common/main_footer.jsp" %>
			</footer>

		</body>

		</html>