<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>${categoryName}글쓰기</title>
	
		<!-- jQuery -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
	
		<!-- Summernote CSS -->
		<link href="${pageContext.servletContext.contextPath}/resources/css/community/summernote/summernote-bs5.min.css" rel="stylesheet">
	
		<!-- Custom CSS -->
		<link href="${pageContext.servletContext.contextPath}/resources/css/common/custom_public.css" rel="stylesheet">
		<link href="${pageContext.servletContext.contextPath}/resources/css/community/custom_summernote.css" rel="stylesheet">
	
		<!-- Summernote JS -->
		<script src="${pageContext.servletContext.contextPath}/resources/css/community/summernote/summernote-bs5.min.js"></script>
	
		<!-- Bootstrap JS -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	
		<!-- Custom JS -->
		<script src="${pageContext.servletContext.contextPath}/resources/js/community/board_Write_Form.js"></script>
	</head>
	


	<body>
		<script>
			// JSP에서 전달된 데이터를 JavaScript 변수로 전달
			const contextPath = "${pageContext.servletContext.contextPath}";
			const boardNo = "${b.boardNo}";
			const categoryId = "${b.categoryId}"; // categoryId 값을 JavaScript 변수로 전달
			const loginUserNo = "${loginHosAccount != null ? loginHosAccount.hosAcNo : ''}";
			const loginUserId = "${loginHosAccount != null ? loginUser.hosId : ''}";
			
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
				<form id="postForm" method="post" action="${pageContext.request.contextPath}/hospital/account/myPost/write/enroll"
					class="post-form" enctype="multipart/form-data">
					<input type="hidden" name="hosAcNo" value="${loginHosAccount.hosAcNo}">
					<input type="hidden" id="categoryId" name="categoryId" value="CAT03">

					<div class="post-form-container">
						<select class="form-select" name="categoryName" onchange="changeCategory(this.value)">
							<option value="이벤트게시판" ${categoryName=='이벤트게시판' ? 'selected' : '' }>이벤트게시판</option>
						</select> <select class="form-select" name="tag">
							<option>말머리 선택</option>
						</select>
					</div>
					<input type="text" name="boardTitle" placeholder="제목을 입력해 주세요." class="form-control mt-3" required>


					<textarea id="summernote" name="boardContent" class="post-textarea form-control mt-3"></textarea>
					<div class="mt-4">
						<label for="upfile" class="form-label">첨부파일</label> <input type="file" id="upfile"
							name="upfiles" class="form-control" multiple onchange="checkFileValidation(this)">
						<small id="fileHelp" class="form-text">최대 3개의 파일만 업로드할 수 있습니다. (각 파일 최대 5MB)</small>
						<!-- 파일 개수 표시 -->

						<div id="file-list-container">
							<div id="file-list"></div>
						</div>
					</div>
					<div class="button-container">
						<!-- 작성완료 버튼 -->
						<button type="submit" class="round-button">작성완료</button>
					</div>
				</form>
			</div>
		</div>
	</body>

	</html>