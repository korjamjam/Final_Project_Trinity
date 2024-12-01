<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	rel="stylesheet"><link href="${pageContext.servletContext.contextPath}/resources/css/community/custom_summernoteUpdateForm.css" rel="stylesheet">
</head>

<body>
  <!-- Context Path -->
    <div id="context-path" data-base-url="${pageContext.servletContext.contextPath}"></div>
    <header>
        <%@ include file="/WEB-INF/views/common/main_header.jsp"%>
    </header>

    <div class="content-container">
        <!-- Top Bar -->
        <div class="top-bar">
            <div class="left-section">
                <h1>${b.boardCategory} <span>글쓰기</span></h1>
            </div>
            <div class="right-section">
                <button class="white-button">임시등록 | 0</button>
                <button type="submit" form="postForm" class="round-button">등록</button>
            </div>
        </div>
        <hr>

        <!-- Post Form -->
        <div class="post-wrapper">
            <form id="postForm" method="post" action="${pageContext.request.contextPath}/community/update"
                class="post-form" enctype="multipart/form-data">
                <input type="hidden" name="boardNo" value="${b.boardNo}">
                <input type="hidden" name="userId" value="${loginUser.userId}">

                <!-- Post Form Header -->
                <div class="post-form-container">
                    <div class="post-form-header">
                        <select class="form-select" name="boardCategory" onchange="changeCategory(this.value)">
                            <option ${b.boardCategory == '자유게시판' ? 'selected' : ''}>자유게시판</option>
                            <option ${b.boardCategory == '메디톡' ? 'selected' : ''}>메디톡</option>
                            <option ${b.boardCategory == '이벤트게시판' ? 'selected' : ''}>이벤트게시판</option>
                        </select>
                        <select class="form-select" name="tag">
                            <option ${b.tag == '공지' ? 'selected' : ''}>공지</option>
                            <option ${b.tag == '질문' ? 'selected' : ''}>질문</option>
                            <option ${b.tag == '정보' ? 'selected' : ''}>정보</option>
                        </select>
                    </div>
                    <input type="text" name="boardTitle" value="${b.boardTitle}" placeholder="제목을 입력해 주세요."
                        class="form-control mt-3" required>
                </div>

                <!-- Summernote -->
                <div class="mb-3">
            
                    <textarea id="summernote" name="boardContent" class="form-control">${b.boardContent}</textarea>
                </div>

                <!-- File Upload Section -->
         <div class="mt-4">
    <label for="upfile" class="form-label">첨부파일</label>
    <input type="file" id="upfile" name="upfiles" class="form-control" multiple onchange="handleFileValidation(this)">
    <small id="fileHelp" class="form-text">최대 3개의 파일만 업로드할 수 있습니다. (각 파일 최대 5MB)</small>

    <!-- 선택된 파일 리스트를 표시할 컨테이너 -->
    <div id="file-list-container" data-attached-files='${attachedFiles}'>

        <div id="file-list"></div>
    </div>
</div>
     

                    </div>
                </div>

                <!-- Form Buttons -->
                <div class="d-flex justify-content-between">
                    <button type="button" class="btn btn-secondary" onclick="location.href='detail.bo?bno=${b.boardNo}'">취소</button>
                    <button type="submit" class="round-button">수정 완료</button>
                </div>
            </form>
        </div>
    </div>

   	<!-- Footer -->
	<%@ include file="/WEB-INF/views/common/main_footer.jsp"%>
	<!-- JavaScript (at the end of the body) -->
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Summernote JS -->
	<script
		src="${pageContext.servletContext.contextPath}/resources/css/community/summernote/summernote-bs5.min.js"></script>
	<!-- Custom JS -->
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/community/summernote.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/community/summernoteUpdateForm.js"></script>
</body>

</html>
