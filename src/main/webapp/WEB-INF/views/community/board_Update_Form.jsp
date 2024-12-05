<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 수정</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- Summernote CSS -->
<link
	href="${pageContext.servletContext.contextPath}/resources/css/community/summernote/summernote-bs5.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link
	href="${pageContext.servletContext.contextPath}/resources/css/common/custom_public.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources/css/community/custom_summernote.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources/css/community/custom_summernoteUpdateForm.css"
	rel="stylesheet">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- jQuery를 Head에 추가 -->
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
		<%@ include file="/WEB-INF/views/common/main_header.jsp"%>
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

		<!-- Post Form -->
		<div class="post-wrapper">
			<form id="postForm" method="post"
				action="${pageContext.request.contextPath}/community/update"
				class="post-form" enctype="multipart/form-data">
				<input type="hidden" name="boardNo" value="${b.boardNo}"> 
				<input type="hidden" name="userId" value="${loginUser.userId}">

				<!-- Post Form Header -->
				<div class="post-form-container">
					<div class="post-form-header">
						<select class="form-select" name="categoryId"
							onchange="changeCategory(this.value)">
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

				<%@ include file="/WEB-INF/views/common/summernote.jsp"%>
				<div class="button-container">
					<!-- 작성완료 버튼 -->
					<button type="submit" class="round-button">작성완료</button>
				</div>
			</form>
		</div>
	</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/common/main_footer.jsp"%>
	<!-- Body Content -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/css/community/summernote/summernote-bs5.min.js"></script>

	<script
		src="${pageContext.servletContext.contextPath}/resources/js/community/board_Update_Form.js"></script>
</body>

</html>