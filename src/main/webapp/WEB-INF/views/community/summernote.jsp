<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>

		<!-- include libraries(jQuery, bootstrap) -->
		<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
		<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />
		<script type="text/javascript"
			src="http://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

		<!-- include summernote css/js-->

		<link href="${ pageContext.servletContext.contextPath }/resources/css/summernote/summernote-bs5.min.css"
			rel="stylesheet">
		<script
			src="${ pageContext.servletContext.contextPath }/resources/css/summernote/summernote-bs5.min.js"></script>
		<link rel="stylesheet"
			href="${ pageContext.servletContext.contextPath }/resources/css/summernote/custom_summernote.css">
		<link href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_public.css"
			rel="stylesheet">
	</head>

	<body>
		<!-- Header Section -->
		<header class="header">
			<%@ include file="/WEB-INF/views/common/main_header.jsp" %>
		</header>
		<div class="content-container">
			<div class="top-bar">
				<div class="post-title-section">
					<h1>카페 글쓰기</h1>
				</div>
				<div class="post-action-section" s>
					<button class="white-button">임시등록 | 0</button>
					<button class="round-button">등록</button>
				</div>
			</div>
			<hr>
			<div class="post-wrapper">
				<div class="post-form-container">
					<div class="post-form-header">
						<select class="post-category-select">
							<option>자유게시판</option>
							<option>메디톡</option>
							<option>이벤트게시판</option>
						</select>
						<select class="post-tag-select">
							<option>말머리 선택</option>
							<option>말머리 선택</option>
							<option>말머리 선택</option>
							<option>말머리 선택</option>
						</select>
					</div>
					<input type="text" placeholder="제목을 입력해 주세요." class="post-title-input">
				</div>

				<div class="spacer"></div> <!-- 여백을 추가하기 위한 요소 -->

				<form method="post" action="write">
					<textarea id="summernote" name="content"></textarea>
					<div style="display: flex; justify-content: flex-end; margin-top: 10px;">
						<input type="submit" value="작성완료" class="round-button">
					</div>
				</form>

			</div>
		</div>
		<script>
			$(document).ready(function () {
				function initializeSummernote() {
					if (window.matchMedia("(max-width: 768px)").matches) {
						$('#summernote').summernote({
							height: 400, // 모바일 버전 높이
							width: '100%', // 모바일 버전 너비
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
								onImageUpload: fileUpload
							}
						});
					} else {
						$('#summernote').summernote({
							height: 500, // 웹 버전 높이
							width: 800, // 웹 버전 너비
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
								onImageUpload: fileUpload
							}
						});
					}
				}

				initializeSummernote();
				$(window).resize(initializeSummernote); // 창 크기 변경 시 다시 초기화
			});

			// 이미지 업로드 처리 함수
			function fileUpload(files) {
				console.log(files);
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
					url: "upload",
					type: "POST",
					data: data,
					processData: false,
					contentType: false,
					dataType: "json",
					success: function (res) {
						callback(res);
					},
					error: function () {
						console.log("파일업로드 api요청 실패");
					}
				});
			}
			$(document).ready(function () {
				$('.post-category-select').change(function () {
					let selectedCategory = $(this).val().trim(); // 공백 제거를 추가
					console.log("Selected category:", selectedCategory); // 디버깅용 출력

					let $tagSelect = $('.post-tag-select');

					$tagSelect.empty(); // 기존 옵션 제거

					if (selectedCategory === '자유게시판') {
						$tagSelect.append('<option>친목</option>');
						$tagSelect.append('<option>유머</option>');
						$tagSelect.append('<option>꿀팁</option>');
					} else if (selectedCategory === '메디톡') {
						$tagSelect.append('<option>질문</option>');
						$tagSelect.append('<option>정보</option>');
					} else if (selectedCategory === '이벤트게시판') {
						$tagSelect.append('<option>관리자</option>');
						$tagSelect.append('<option>우리동네소식</option>');
					}
				});
			});

		</script>


		<!-- Footer -->
		<%@ include file="/WEB-INF/views/common/main_footer.jsp" %>

	</body>

	</html>