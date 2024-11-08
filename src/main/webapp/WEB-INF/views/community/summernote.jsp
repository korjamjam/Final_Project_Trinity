<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  	<!-- include libraries(jQuery, bootstrap) -->
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />
    <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- include summernote css/js-->
    <link href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_public.css" rel="stylesheet">
	<link href="${ pageContext.servletContext.contextPath }/resources/css/summernote/summernote-bs5.min.css" rel="stylesheet">
    <script src="${ pageContext.servletContext.contextPath }/resources/css/summernote/summernote-bs5.min.js"></script>
     <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/summernote/custom-summernote.css">
</head>
<body>
<!-- Header Section -->
		<header class="header">
			<%@ include file="/WEB-INF/views/common/main_header.jsp"%>
		</header>
<<<<<<< HEAD
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
						<select class="post-category-select" onchange="changeCategory(this.value)">
							<option>자유게시판</option>
							<option>메디톡</option>
							<option>이벤트게시판</option>
						</select>
						<select class="post-tag-select" id="post-tag-select">
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
					const isPc = !window.matchMedia("(max-width: 768px)").matches;

					$('#summernote').summernote({
						height: isPc ? 500 : 400, // 모바일 버전 높이
						width: isPc ? 800 : '100%', // 모바일 버전 너비
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

				initializeSummernote();
				$(window).resize(initializeSummernote); // 창 크기 변경 시 다시 초기화
			});

			function changeCategory(category) {
				
				let tagSelect = document.querySelector("#post-tag-select");
				tagSelect.innerHTML = ""; //비움


				switch(category){
				case "자유게시판":
					tagSelect.innerHTML = `<option>친목</option>
										   <option>유머</option>
										   <option>꿀팁</option>`;
					break;
				case "메디톡":
					tagSelect.innerHTML = `<option>질문</option>
										   <option>정보</option>`;
					break;
				case "이벤트게시판":
					tagSelect.innerHTML = `<option>관리자</option>
										   <option>우리동네소식</option>
										   <option>꿀팁</option>`;
					break;
				}
			}

			// 이미지 업로드 처리 함수
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

		</script>


		<!-- Footer -->
		<%@ include file="/WEB-INF/views/common/main_footer.jsp" %>

	</body>

	</html>
=======

	<form method="post" action="write">
		제목 : <input type="text" name="title"> <br>
		<br>
		<textarea id="summernote" name="content"></textarea>
		<br> <input type="submit" value="작성완료" class="round-button">
	</form>
	<script>
    	$(function(){
    		 $('#summernote').summernote({
    		        placeholder: '글을 입력하세요.',
    		        tabsize: 2,
    		        height: 400,
    		        width: 800,
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
    	})
    	
    	//썸머노트에 이미지업로드가 발생하였을 때 동작하는 함수
    	function fileUpload(files){
    		console.log(files)
    		//썸머노트는 이미지를 추가하면 해당 이미지파일을 전달해준다.
    		//callbacks에 onImageUpload를 작성하지 않을경우 자동으로 이미지를 string으로 변환하여 준다.
    		//callbacks에 onImageUpload를 작성할 경우 해당 이미지 경로를 직접 작성해 주어야 한다.
    		
    		//파일업로드 할 때는 form태그에서 encType을 multipart/form-data형식으로
    		//요청했던 것처럼 js객체에 FormData객체를 이용해서 ajax요청을 전달해준다.
    		
    		const fd = new FormData();
    		for(let file of files) {
    			fd.append("fileList", file);
    		}
    		
    		insertFile(fd, function(nameList){
    			for(let name of nameList){
    				$("#summernote").summernote("insertImage","/etc/resources/img/" + name);
    			}
    		})
    	}
    	
    	function insertFile(data, callback){
    		
    		$.ajax({
    			url: "upload",
    			type: "POST",
    			data: data,
    			processData: false, //기본이 true -> 전송하는 data를 string으로 변환해서 요청
    			contentType: false, //
    			dataType: "json", //받을 때 타입 
    			success: function(res){
    				callback(res)
    			},
    			error: function(){
    				console.log("파일업로드 api요청 실패")
    			} 
    		})
    	}
    </script>
    
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/common/main_footer.jsp"%>
	
</body>
</html>
>>>>>>> parent of 4400539 (반응형 community-write)
