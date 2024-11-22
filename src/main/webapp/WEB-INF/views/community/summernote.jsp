<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>${boardCategory}글쓰기</title>

<!-- include libraries(jQuery, bootstrap) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- include summernote css/js -->
<link
	href="${pageContext.servletContext.contextPath}/resources/css/community/summernote/summernote-bs5.min.css"
	rel="stylesheet">
<script
	src="${pageContext.servletContext.contextPath}/resources/css/community/summernote/summernote-bs5.min.js"></script>
<link
	href="${pageContext.servletContext.contextPath}/resources/css/common/custom_public.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/resources/css/community/custom_summernote.css"
	rel="stylesheet">
</head>

<body>
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
						</select> <select class="form-select" name="tag">
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
						<label for="upfile" class="form-label">첨부파일</label> <input
							type="file" id="upfile" name="upfiles" class="form-control"
							aria-describedby="fileHelp" multiple
							onchange="checkFileValidation(this)"> <small
							id="fileHelp" class="form-text">최대 3개의 파일만 업로드할 수 있습니다.
							(각 파일 최대 5MB)</small><br> <br> <br>

					</div>

				</div>


				<div class="button-container">
					<!-- 작성완료 버튼 -->
					<input type="submit" value="작성완료" class="round-button">
				</div>
			</form>
		</div>
	</div>

	<script>
			$(document).ready(function () {
				initializeSummernote();

				// 창 크기 변경 시 Summernote 크기 조정
				$(window).on('resize', syncSummernoteWidth);
			});

			// Summernote 초기화
			function initializeSummernote() {
				$('#summernote').summernote({
					minHeight: 400,
					maxHeight: null,
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
						onImageUpload: fileUpload, // 이미지 업로드 콜백
						onChange: adjustHeight // 글 내용 변경 시 높이 자동 조정
					}
				});

				syncSummernoteWidth();
			}

			// Summernote 너비 동기화
			function syncSummernoteWidth() {
				const wrapperWidth = $('.post-wrapper').width();
				$('.note-editor').css('width', wrapperWidth);
			}

			// 글 내용에 따라 Summernote 높이 조정
			function adjustHeight(contents) {
				const editableArea = $('.note-editable');
				const scrollHeight = editableArea.prop('scrollHeight');
				editableArea.css('height', `${scrollHeight}px`);
			}

		
			// 이미지 업로드 처리 (Summernote 연동)
		function fileUpload(imgs) {
		    const fd = new FormData();
		    for (let i = 0; i < imgs.length; i++) {
		        fd.append("fileList", imgs[i]);
		    }
		
		    $.ajax({
		        url: "${pageContext.request.contextPath}/community/upload",
		        type: "POST",
		        data: fd,
		        processData: false,
		        contentType: false,
		        dataType: "json",
		        success: function (response) {
		        	console.log(response)
		    
		            response.forEach(filePath => {
		            	console.log(filePath)
		                $('#summernote').summernote('insertImage', filePath);
		            });
		        },
		        error: function () {
		            alert("이미지 업로드 실패! 다시 시도해주세요.");
		        }
		    });
		}



		// 파일 검증 로직
		function checkFileValidation(input) {
		    const files = input.files;
		    const maxFileSize = 5 * 1024 * 1024; // 5MB
		    const maxFileCount = 3;

		    // 파일 개수 체크
		    if (files.length > maxFileCount) {
		        alert("파일은 최대 3개까지만 선택할 수 있습니다.");
		        input.value = ""; // 선택된 파일 초기화
		        return;
		    }

		    // 파일 크기 체크
		    for (let file of files) {
		        if (file.size > maxFileSize) {
		            alert(`파일 "${file.name}"의 크기가 5MB를 초과합니다.`);
		            input.value = ""; // 선택된 파일 초기화
		            return;
		        }
		    }
		}


		</script>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/common/main_footer.jsp"%>
</body>

</html>