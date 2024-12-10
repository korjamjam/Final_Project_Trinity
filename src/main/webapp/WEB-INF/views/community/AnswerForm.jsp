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
		<link href="${pageContext.servletContext.contextPath}/resources/css/community/answerForm.css" rel="stylesheet">

		<!-- Summernote JS (필수 스크립트) -->
		<script
			src="${pageContext.servletContext.contextPath}/resources/css/community/summernote/summernote-bs5.min.js"></script>

		<!-- Bootstrap JS -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

		<!-- Custom JS -->
		<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/expert_card.css">
		<script
			src="${pageContext.servletContext.contextPath}/resources/js/community/community_board_detail.js"></script>
		<script src="${pageContext.servletContext.contextPath}/resources/js/community/answerForm.js"></script>
	</head>

	<body>
		<script>
			const boardNo = "${b.boardNo}";
			const contextPath = "${pageContext.servletContext.contextPath}";
			const loginUserNo = "${loginUser != null ? loginUser.userNo : ''}";
			const loginUserId = "${loginUser != null ? loginUser.userId : ''}";


		</script>
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
						</tr>
						<tr>
							<td class="board-user-info">
								<span
									class="${sessionScope.loginUser != null && sessionScope.loginUser.userId == b.boardWriter ? 'highlight-user' : ''}">
									${b.boardWriter}
								</span> 일반회원&nbsp
							</td>
							<td class="board-meta"><span>${b.enrollDate}</span> | <span>조회 ${b.boardViews}</span></td>
						</tr>
					</table>

					<div class="board-content-wrapper">
						<div class="board-content">
							${b.boardContent}
						</div>

						<c:if test="${not empty fileList}">
							<%@ include file="/WEB-INF/views/common/attached_files.jsp" %>
						</c:if>
					</div>


					<div class="answer-section">
						<!-- 답변 작성 폼 -->
						<form id="answer-form" action="${pageContext.servletContext.contextPath}/community/submitAnswer"
							method="post">
							<input type="hidden" name="boardNo" value="${b.boardNo}" /> <!-- 게시글 번호 -->
							<input type="hidden" name="doctorName" value="${loginUser.userName}" /> <!-- 작성자 이름 -->
							<input type="hidden" name="isMedicalField" value="Y" /> <!-- 의료 전문가 여부 -->

							<!-- Summernote 에디터 -->
							<textarea id="summernote-1" name="answerContent" class="post-textarea form-control mt-3"
								placeholder="답변을 입력하세요."></textarea>

							<!-- 작성 버튼 -->
							<div class="button-container">
								<button type="submit" class="round-button">답변 작성</button>
							</div>
						</form>
					</div>
					<!-- 답변 리스트 -->
					<!-- <div id="answer-list">
						<c:forEach items="${answers}" var="a">
							<div class="board-content answer-item">
								<div class="answer-content">
									<div class="answer-author">작성자: ${a.doctorName}</div>
									<div class="answer-date">작성일: ${a.answerDate}</div>
									${a.answerContent}
								</div>
							</div>
						</c:forEach>
					</div> -->


					<%@ include file="/WEB-INF/views/common/comments.jsp" %>
				</div>
				<div class="empty-space"></div>
		</main>

		<footer>
			<%@ include file="/WEB-INF/views/common/main_footer.jsp" %>
		</footer>

	</body>

	</html>