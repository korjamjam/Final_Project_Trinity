<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${boardCategory} 글쓰기</title>

    <!-- Bootstrap & Summernote -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/community/summernote-bs5.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/common/custom_public.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/css/community/summernote-bs5.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/resources/js/community/summernote.js"></script>
</head>
<body>
<div id="context-path" data-base-url="${pageContext.request.contextPath}"></div> <!-- Base URL 전달 -->

<header>
    <%@ include file="/WEB-INF/views/common/main_header.jsp"%>
</header>

<div class="content-container">
    <div class="top-bar">
        <h1>${boardCategory} 글쓰기</h1>
    </div>
    <hr>

    <form id="postForm" method="post" action="${pageContext.request.contextPath}/community/write" enctype="multipart/form-data">
        <input type="hidden" name="userId" value="${loginUser.userId}">

        <div class="post-form-container">
            <textarea id="summernote" name="boardContent" class="post-textarea form-control mt-3"></textarea>

            <div class="mt-4">
                <label for="upfile" class="form-label">첨부파일</label>
                <input type="file" id="upfile" name="upfiles" class="form-control" multiple onchange="updateFileList(this)">
                <small class="form-text">최대 3개의 파일만 업로드할 수 있습니다.</small>
            </div>

            <div class="file-count-label mt-2">파일 0개</div>
            <div id="file-list" class="mt-3 border p-3"></div>

            <div class="button-container mt-4">
                <input type="submit" value="작성완료" class="btn btn-primary">
            </div>
        </div>
    </form>
</div>
</body>
</html>
