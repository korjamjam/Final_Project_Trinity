<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>${boardCategory}글쓰기</title>
<head>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">


<!-- Summernote -->
<link
	href="${pageContext.servletContext.contextPath}/resources/css/community/summernote/summernote-bs5.min.css"
	rel="stylesheet">
<script
	src="${pageContext.servletContext.contextPath}/resources/css/community/summernote/summernote-bs5.min.js"></script>

<!-- Custom CSS -->
<link
	href="${pageContext.servletContext.contextPath}/resources/css/common/custom_public.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources/css/community/custom_summernote.css"
	rel="stylesheet">

<!-- Custom JS -->
<script
	src="${pageContext.servletContext.contextPath}/resources/js/community/summernote.js"></script>
</head>

<body>
	<body>
    <!-- Base URL을 data-* 속성으로 전달 -->
    <div id="context-path" data-base-url="${pageContext.request.contextPath}"></div> <!-- 여기에 baseUrl을 전달 -->

    <!-- Header Section -->
    <header>
        <%@ include file="/WEB-INF/views/common/main_header.jsp"%>
    </header>

    <div class="content-container">
        <div class="top-bar">
            <div class="left-section">
                <h1>${boardCategory}
                    <span>글쓰기</span>
                </h1>
            </div>
            <div class="right-section">
                <!-- 임시등록 버튼 -->
                <button class="white-button">임시등록 | 0</button>
                <!-- 등록 버튼 -->
                <button type="submit" form="postForm" class="round-button">등록</button>
            </div>
        </div>
        <hr>

        <div class="post-wrapper">
            <form id="postForm" method="post"
                action="${pageContext.request.contextPath}/community/write"
                class="post-form" enctype="multipart/form-data">

                <!-- Hidden input for USER_ID -->
                <input type="hidden" name="userId" value="${loginUser.userId}">

                <!-- 카테고리와 제목 입력 -->
                <div class="post-form-container">
                    <div class="post-form-header">
                        <select class="form-select" name="boardCategory"
                            onchange="changeCategory(this.value)">
                            <option>자유게시판</option>
                            <option>메디톡</option>
                            <option>이벤트게시판</option>
                        </select> 
                        <select class="form-select" name="tag">
                            <option>말머리 선택</option>
                        </select>
                    </div>
                    <input type="text" name="boardTitle" placeholder="제목을 입력해 주세요."
                        class="form-control mt-3" required>
                </div>

                <!-- 내용 입력(Summernote) -->
                <textarea id="summernote" name="boardContent"
                    class="post-textarea form-control mt-3"></textarea>

                <!-- 첨부파일 입력 -->
                <div class="mt-4">
                    <!-- 첨부파일 필드 -->
                    <div class="form-group">
                        <label for="upfile" class="form-label">첨부파일</label> 
                        <input
                            type="file" id="upfile" name="upfiles" class="form-control"
                            aria-describedby="fileHelp" multiple
                            onchange="checkFileValidation(this)"> 
                        <small id="fileHelp" class="form-text">최대 3개의 파일만 업로드할 수 있습니다.
                            (각 파일 최대 5MB)</small><br> <br> <br>

                    </div>
                    <!-- 선택된 파일 리스트 표시 -->
                    <div id="file-list-container">
                        <div id="file-list"></div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- Footer -->
    <%@ include file="/WEB-INF/views/common/main_footer.jsp"%>
</body>
</html>