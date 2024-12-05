<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
	const fileUploadUrl = "${pageContext.servletContext.contextPath}/community/upload";
	</script>
	
	
	<!-- /WEB-INF/views/common/form_file_upload.jsp -->
	<div class="summernote-wrapper">
		
		  <textarea id="summernote" name="boardContent" class="post-textarea form-control mt-3"></textarea>
        <div class="mt-4">
            <label for="upfile" class="form-label">첨부파일</label>
            <input type="file" id="upfile" name="upfiles" class="form-control" multiple onchange="checkFileValidation(this)">
            <small id="fileHelp" class="form-text">최대 3개의 파일만 업로드할 수 있습니다. (각 파일 최대 5MB)</small>
             <!-- 파일 개수 표시 -->
          
            <div id="file-list-container">
                <div id="file-list"></div>
            </div>
        </div>
    
	<!-- JavaScript (at the end of the body) -->
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Summernote JS -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/css/community/summernote/summernote-bs5.min.js"></script>
	<!-- Custom JS -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/js/common/summernote.js"></script>
</body>
</html>