<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>${boardCategory}글쓰기</title>

<!-- include libraries(jQuery, bootstrap) -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- include summernote css/js -->
<link
	href="${pageContext.servletContext.contextPath}/resources/css/community/summernote/summernote-bs5.min.css"
	rel="stylesheet">
<script
	src="${pageContext.servletContext.contextPath}/resources/css/community/summernote/summernote-bs5.min.js"></script>
<link
	href="${pageContext.servletContext.contextPath}/resources/css/common/custom_public.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/community/custom_summernote.css">

<!-- Bootstrap Icons 추가 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Custom JS -->
<script
	src="${pageContext.servletContext.contextPath}/resources/js/community/summernoteUpdate.js"></script>
</head>


<body>
	<div id="context-path"
		data-base-url="${pageContext.request.contextPath}"></div>

	<!-- Header Section -->
	<header>
		<%@ include file="/WEB-INF/views/common/main_header.jsp"%>
	</header>
	<div class="content-container">
		<div class="top-bar">
			<div class="left-section">
				<h1>
					${b.boardCategory} <span>수정하기</span>
				</h1>
			</div>
			<div class="right-section">
				<!-- 임시등록 버튼 -->
				<button class="white-button">임시등록 | 0</button>
				<!-- 등록 버튼 -->
				<button type="submit" form="postForm" class="round-button">수정완료</button>
			</div>
		</div>
		<hr>
		<div class="post-wrapper">
			<!-- form ID 추가 -->
			<form id="postForm" method="post"
				action="${pageContext.request.contextPath}/community/update"
				class="post-form">
				<!-- Hidden input for USER_ID -->
				<input type="hidden" name="boardWriter" value="${b.boardWriter}">
				<input type="hidden" name="boardNo" value="${b.boardNo}">
				<!-- 카테고리, 제목, 내용 등 게시글 관련 정보 입력 -->
				<div class="post-form-container">
					<div class="post-form-header">
						<select class="post-category-select" name="boardCategory">
							<option value="자유게시판"
								${b.boardCategory == '자유게시판' ? 'selected' : ''}>자유게시판</option>
							<option value="메디톡" ${b.boardCategory == '메디톡' ? 'selected' : ''}>메디톡</option>
							<option value="이벤트게시판"
								${b.boardCategory == '이벤트게시판' ? 'selected' : ''}>이벤트게시판</option>
						</select> <select class="post-tag-select" name="tag">
							<option>말머리 선택</option>
						</select>
					</div>
					<input type="text" name="boardTitle" placeholder="제목을 입력해 주세요."
						class="post-title-input" value="${b.boardTitle}">
				</div>

				<div class="spacer"></div>
				<!-- 여백을 추가하기 위한 요소 -->
				<!-- 내용 입력(Summernote) -->
				<textarea id="summernote" name="boardContent" class="post-textarea">${b.boardContent}</textarea>
				<div class="mt-4">
                    <label for="upfile" class="form-label">첨부파일</label>
                    <input type="file" id="upfile" name="upfiles" class="form-control" multiple
                        onchange="checkFileValidation(this)">
                    <small id="fileHelp" class="form-text">최대 3개의 파일만 업로드할 수 있습니다. (각 파일 최대 5MB)</small>
                  	<!-- 선택된 파일 리스트 표시 -->
					<div id="file-list-container">
						<div id="file-list"></div>
					</div>
					

				
				</div>
		</div>

				<div class="button-container">
					<!-- 작성완료 버튼 -->
					<input type="submit" value="작성완료" class="round-button">
				</div>
			</form>
		</div>
	</div>


	<!-- Footer -->
	<%@ include file="/WEB-INF/views/common/main_footer.jsp"%>
	<script>
    var attachedFilesJson = ${attachedFiles != null ? attachedFiles : '[]'};
</script>

	
</body>

</html>

