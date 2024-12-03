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
		<div id="context-path" data-base-url="${pageContext.request.contextPath}"></div>

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
					<!-- 선택한 카테고리 ID를 전송하기 위한 hidden input 추가 -->
					<input type="hidden" id="categoryId" name="categoryId" value="${categoryId}">
					<!-- 여기서 ${categoryId}는 서버에서 받아오는 카테고리 ID -->

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
			
			<textarea id="summernote" name="boardContent" class="post-textarea form-control mt-3"></textarea>
			<div class="mt-4">
				<label for="upfile" class="form-label">첨부파일</label> <input type="file" id="upfile" name="upfiles"
					class="form-control" multiple onchange="checkFileValidation(this)"> <small id="fileHelp"
					class="form-text">최대 3개의 파일만 업로드할 수 있습니다. (각 파일 최대 5MB)</small>
				<!-- 선택된 파일 리스트 표시 -->
				<div id="file-list-container">
					<div id="file-list"></div>
				</div>
			</div>
			</div>
		

		<div class="button-container">
			<!-- 작성완료 버튼 -->
			<button type="submit" class="round-button">작성완료</button>
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
			<script src="${pageContext.servletContext.contextPath}/resources/js/community/summernote.js"></script>
	</body>

	</html>