<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>메디톡 의료진 답글 페이지</title>

		<!-- jQuery (필수, Summernote가 의존) -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

		<!-- Summernote CSS (필수 스타일시트) -->
		<link href="${pageContext.servletContext.contextPath}/resources/css/community/summernote/summernote-bs5.min.css"
			rel="stylesheet">

		<!-- Custom CSS -->
		<link href="${pageContext.servletContext.contextPath}/resources/css/common/custom_public.css" rel="stylesheet">
		<link href="${pageContext.servletContext.contextPath}/resources/css/community/custom_summernote.css"
			rel="stylesheet">
		<link href="${pageContext.servletContext.contextPath}/resources/css/common/custom_dropdown.css"
			rel="stylesheet">
		<link href="${pageContext.servletContext.contextPath}/resources/css/community/community_board_detail.css"
			rel="stylesheet">
		<link href="${pageContext.servletContext.contextPath}/resources/css/common/comments.css" rel="stylesheet">

		<!-- Summernote JS (필수 스크립트) -->
		<script
			src="${pageContext.servletContext.contextPath}/resources/css/community/summernote/summernote-bs5.min.js"></script>

		<!-- Bootstrap JS -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

		<!-- Custom JS -->
		<script
			src="${pageContext.servletContext.contextPath}/resources/js/community/community_board_detail.js"></script>
		<script src="${pageContext.servletContext.contextPath}/resources/js/community/answerForm.js"></script>
	</head>



	<body>
		<!-- EL 데이터를 JavaScript 변수로 전달 -->
		<script>
			const contextPath = "${pageContext.servletContext.contextPath}";
			const boardNo = "${b.boardNo}";
			const categoryId = "${b.categoryId}";  // categoryId 값을 JavaScript 변수로 전달
			const loginUserNo = "${loginUser != null ? loginUser.userNo : ''}";
			const loginUserId = "${loginUser != null ? loginUser.userId : ''}";
			// 로그로 JSP에서 전달된 데이터 확인
			console.log("로그인 유저 : ${loginUser}");
			console.log("boardNo: ${b.boardNo}, categoryId: ${b.categoryId}");
		</script>


		<!-- Header Section -->
		<header>
			<%@ include file="/WEB-INF/views/common/main_header.jsp" %>
		</header>

		<main id="main-content">
			<!-- Sidebar Menu -->
			<div id="side-menu">
				<%@ include file="/WEB-INF/views/community/community_sidemenu.jsp" %>
			</div>


			<!-- Board Container -->
			<div id="main-wrapper">
				<div class="board-container">
					<!-- 게시글 상세 정보 -->
					<table class="board-detail">
						<tr>
							<td class="breadcrumb"><span>게시판 &nbsp</span> &gt;
								<div class="custom-dropdown">
									<div class="selected-container">
										<div class="selected-option">${categoryName}</div>
										<!-- 컨트롤러에서 넘겨준 첫 번째 카테고리 이름 -->
										<div class="dropdown-arrow">▼</div>
									</div>

									<div class="option-list" id="community-options">
										<c:forEach var="category" items="${categories}">
											<div class="option-item" data-url="${category.categoryId}">
												<!-- CATEGORY_ID를 URL로 사용한다면 category.categoryId 사용 -->
												${category.categoryName}
												<!-- CATEGORY_NAME을 표시 -->
											</div>
										</c:forEach>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td class="board-title">${b.boardTitle}</td>
						</tr>
						<tr>
							<td class="board-user-info"><span
									class="${sessionScope.loginUser != null && sessionScope.loginUser.userId == b.boardWriter ? 'highlight-user' : ''}">
									${b.boardWriter} </span> 일반회원&nbsp</td>
							<td class="board-meta"><span>${b.enrollDate}</span> | <span>조회
									${b.boardViews}</span></td>
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

						<!-- 답변 폼 -->
						<div id="answer-section">
							<textarea id="summernote-1" name="boardContent"
								class="post-textarea form-control mt-3"></textarea>
							<button type="button" id="submit-answer-btn" class="round-button">답변 작성</button>
						</div>

						<!-- 답변 리스트 -->
						<div id="answer-list">
							<!-- 동적으로 추가될 답변이 여기에 표시됨 -->
							<c:forEach items="${answers}" var="a">
								<div class="board-content">
									<!-- 답변 내용 -->
									${a.answerContent}
								</div>
							</c:forEach>
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