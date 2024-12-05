<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>${categoryName}글쓰기</title>
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
		<!-- Summernote CSS -->
		<link href="${pageContext.servletContext.contextPath}/resources/css/community/summernote/summernote-bs5.min.css"
			rel="stylesheet">
		<!-- Custom CSS -->
		<link href="${pageContext.servletContext.contextPath}/resources/css/common/custom_public.css" rel="stylesheet">
		<link href="${pageContext.servletContext.contextPath}/resources/css/community/custom_summernote.css"
			rel="stylesheet">
	</head>

	<body>
<script>
				// JSP에서 전달된 데이터를 JavaScript 변수로 전달
				const contextPath = "${pageContext.servletContext.contextPath}";
				const boardNo = "${b.boardNo}";
				const categoryId = "${b.categoryId}"; // categoryId 값을 JavaScript 변수로 전달
				const loginUserNo = "${loginUser != null ? loginUser.userNo : ''}";
				const loginUserId = "${loginUser != null ? loginUser.userId : ''}";
			</script>
		<header>
			<%@ include file="/WEB-INF/views/common/main_header.jsp" %>
		</header>

		<div class="content-container">
			<div class="top-bar">
				<div class="left-section">
					<h1>${categoryName}
						<span>글쓰기</span>
					</h1>
				</div>
				<div class="right-section">
					<button class="white-button">임시등록 | 0</button>
					<button type="submit" form="postForm" class="round-button">등록</button>
				</div>
			</div>
			<hr>
			<div class="post-wrapper">
				<form id="postForm" method="post" action="${pageContext.request.contextPath}/community/write"
					class="post-form" enctype="multipart/form-data">
					<input type="hidden" name="userId" value="${loginUser.userId}">
					<input type="hidden" id="categoryId" name="categoryId" value="${categoryId}">

					<div class="post-form-container">
						<select class="form-select" name="categoryName" onchange="changeCategory(this.value)">
							<option value="자유게시판" ${categoryName=='자유게시판' ? 'selected' : '' }>자유게시판</option>
							<option value="메디톡" ${categoryName=='메디톡' ? 'selected' : '' }>메디톡</option>
							<option value="이벤트게시판" ${categoryName=='이벤트게시판' ? 'selected' : '' }>이벤트게시판</option>
						</select>
						<select class="form-select" name="tag">
							<option>말머리 선택</option>
						</select>
					</div>
					<input type="text" name="boardTitle" placeholder="제목을 입력해 주세요." class="form-control mt-3" required>
					
					    <%@ include file="/WEB-INF/views/common/summernote.jsp" %>
					<div class="button-container">
						<!-- 작성완료 버튼 -->
						<button type="submit" class="round-button">작성완료</button>
					</div>
				</form>
			</div>
		</div>
			<!-- Footer -->
			<%@ include file="/WEB-INF/views/common/main_footer.jsp" %>
				<!-- JavaScript (at the end of the body) -->
				<!-- jQuery -->
				<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
				<!-- Bootstrap JS -->
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
				<!-- Summernote JS -->
				<script
					src="${pageContext.servletContext.contextPath}/resources/css/community/summernote/summernote-bs5.min.js"></script>
				<!-- Custom JS -->
					<script src="${pageContext.servletContext.contextPath}/resources/js/common/summernote.js"></script>
				<script src="${pageContext.servletContext.contextPath}/resources/js/community/board_Write_Form.js"></script>
	</body>

	</html>