<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html lang="ko">

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>글 수정</title>
		
			<!-- jQuery -->
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		
			<!-- Bootstrap CSS -->
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
			<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
		
			<link href="${pageContext.servletContext.contextPath}/resources/css/common/custom_public.css" rel="stylesheet">
			<!-- Summernote CSS -->
			<link href="${pageContext.servletContext.contextPath}/resources/css/community/summernote/summernote-bs5.min.css" rel="stylesheet">
		
	
			<link href="${pageContext.servletContext.contextPath}/resources/css/community/custom_summernote.css" rel="stylesheet">
		
			<!-- Summernote JS (이 부분도 jQuery 이후에 로드해야 합니다.) -->
			<script src="${pageContext.servletContext.contextPath}/resources/css/community/summernote/summernote-bs5.min.js"></script>

			<!-- Bootstrap JS (이 부분은 jQuery보다 후에 로드해야 합니다.) -->
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
		
			<!-- Custom JS -->
			<script src="${pageContext.servletContext.contextPath}/resources/js/community/board_Update_Form.js"></script>
		</head>
		


		<body>
			<script>
				// JSP에서 전달된 데이터를 JavaScript 변수로 전달
				const contextPath = "${pageContext.servletContext.contextPath}";
				const boardNo = "${b.boardNo}";
				const categoryId = "${b.categoryId}"; // categoryId 값을 JavaScript 변수로 전달
				const loginUserNo = "${loginUser != null ? loginUser.userNo : ''}";
				const loginUserId = "${loginUser != null ? loginUser.userId : ''}";
				const boardContent = `${b.boardContent}`
				console.log('${b}')
			</script>


			<header>
				<%@ include file="/WEB-INF/views/common/main_header.jsp" %>
			</header>

			<div class="content-container">
				<!-- Top Bar -->
				<div class="top-bar">
					<div class="left-section">
						<h1>${b.categoryName}
							<span>글쓰기</span>
						</h1>
					</div>
					<div class="right-section">
						<button class="white-button">임시등록 | 0</button>
						<button type="submit" form="postForm" class="round-button">등록</button>
					</div>
				</div>
				<hr>
				<p>Context Path: ${pageContext.request.contextPath}</p>
				Post Form -->
				<div class="post-wrapper">
					<form id="postForm" method="post" action="${pageContext.request.contextPath}/community/update"
						class="post-form" enctype="multipart/form-data">
						<input type="hidden" name="boardNo" value="${b.boardNo}">
						<input type="hidden" name="userId" value="${loginUser.userId}">
						<input type="hidden" name="userNo" value="${loginUser.userNo}">
					
						<!-- Post Form Header -->
						<div class="post-form-container">
							<div class="post-form-header">
								<select class="form-select" name="categoryId" onchange="changeCategory(this.value)">
									<option value="CAT01" ${b.categoryId=='CAT01' ? 'selected' : '' }>자유게시판</option>
									<option value="CAT02" ${b.categoryId=='CAT02' ? 'selected' : '' }>메디톡</option>
									<option value="CAT03" ${b.categoryId=='CAT03' ? 'selected' : '' }>이벤트게시판</option>
								</select> <select class="form-select" name="tag">
									<option value="공지" ${b.tag=='공지' ? 'selected' : '' }>공지</option>
									<option value="질문" ${b.tag=='질문' ? 'selected' : '' }>질문</option>
									<option value="정보" ${b.tag=='정보' ? 'selected' : '' }>정보</option>
								</select>
							</div>
							<input type="text" name="boardTitle" value="${b.boardTitle}" placeholder="제목을 입력해 주세요."
								class="form-control mt-3" required>

							<textarea id="summernote" name="boardContent" class="post-textarea form-control mt-3"></textarea>
							
								<div class="mt-4">
								<label for="upfile" class="form-label">첨부파일</label> 
								<input type="file" id="upfile"
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
						</div>
					</form>
				</div>
			</div>
			<!-- Footer -->
			<%@ include file="/WEB-INF/views/common/main_footer.jsp" %>
		</body>

		</html>