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
</head>

<body>
	<!-- Header Section -->
	<header>
		<%@ include file="/WEB-INF/views/common/main_header.jsp"%>
	</header>
	<div class="content-container">
		<div class="top-bar">
			<div class="left-section">
				<h1>
					${boardCategory} <span>글쓰기</span>
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
			<!-- form ID 추가 -->
			<form id="postForm" method="post"
				action="${pageContext.request.contextPath}/community/write"
				class="post-form">
				<!-- Hidden input for USER_ID -->
				<input type="hidden" name="userId" value="${loginUser.userId}">
				<!-- 카테고리, 제목, 내용 등 게시글 관련 정보 입력 -->
				<div class="post-form-container">
					<div class="post-form-header">
						<select class="post-category-select" name="boardCategory"
							onchange="changeCategory(this.value)">
							<option>자유게시판</option>
							<option>메디톡</option>
							<option>이벤트게시판</option>
						</select> <select class="post-tag-select" name="tag">
							<option>말머리 선택</option>
						</select>
					</div>
					<input type="text" name="boardTitle" placeholder="제목을 입력해 주세요."
						class="post-title-input">
				</div>

				<div class="spacer"></div>
				<!-- 여백을 추가하기 위한 요소 -->
				<!-- 내용 입력(Summernote) -->
				<textarea id="summernote" name="boardContent" class="post-textarea"
					required></textarea>
				<div class="button-container">
					<!-- 작성완료 버튼 -->
					<input type="submit" value="작성완료" class="round-button">
				</div>
			</form>
		</div>
	</div>
	<script>
	$(document).ready(function () {
	    function initializeSummernote() {
	        $('#summernote').summernote({
	            minHeight: 400, // 최소 높이 설정
	            maxHeight: null, // 최대 높이 제한 없음
	            placeholder: '글을 입력하세요.',
	            tabsize: 2,
	            toolbar: [
	                ['style', ['style']],
	                ['font', ['bold', 'underline', 'clear']],
	                ['color', ['color']],
	                ['para', ['ul', 'ol', 'paragraph']],
	                ['table', ['table']],
	                ['insert', ['link', 'picture', 'video']],
	                ['view', ['fullscreen', 'codeview', 'help']]
	            ],
	            callbacks: {
	                onImageUpload: fileUpload,
	                onChange: adjustHeight // 글 내용 변경 시 높이 자동 조정
	            }
	        });

	        syncSummernoteWidth();
	    }

	    function syncSummernoteWidth() {
	        const wrapperWidth = $('.post-wrapper').width();
	        $('.note-editor').css('width', wrapperWidth); // .note-editor의 너비 동기화
	    }

	    // 글 내용에 따라 Summernote 높이 조정
	    function adjustHeight(contents) {
	        const editableArea = $('.note-editable'); // 텍스트 입력 영역
	        const scrollHeight = editableArea.prop('scrollHeight'); // 입력 영역의 전체 높이
	        editableArea.css('height', `${scrollHeight}px`); // 높이를 스크롤 높이에 맞춤
	    }

	    initializeSummernote();

	    // 창 크기 변경 시 Summernote 크기 재조정
	    $(window).on('resize', syncSummernoteWidth);
	});

	function fileUpload(files) {
	    const fd = new FormData();
	    for (let file of files) {
	        fd.append("fileList", file);
	    }

	    insertFile(fd, function (nameList) {
	        for (let name of nameList) {
	            $("#summernote").summernote("insertImage", "/etc/resources/img/" + name);
	        }
	    });
	}

	function insertFile(data, callback) {
	    $.ajax({
	        url: "${pageContext.request.contextPath}/upload",
	        type: "POST",
	        data: data,
	        processData: false,
	        contentType: false,
	        dataType: "json",
	        success: function (res) {
	            callback(res);
	        },
	        error: function () {
	            alert("이미지 업로드 실패! 다시 시도해주세요.");
	        }
	    });
	}

    </script>
	



	<!-- Footer -->
	<%@ include file="/WEB-INF/views/common/main_footer.jsp"%>
</body>

</html>
