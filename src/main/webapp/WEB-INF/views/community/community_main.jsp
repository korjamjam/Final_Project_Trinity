<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html lang="ko">

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
			<link rel="stylesheet"
				href="${ pageContext.servletContext.contextPath }/resources/css/community/community_main.css">
			<link href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_public.css"
				rel="stylesheet">
			<title>Customer Center</title>
		</head>

		<body>
			<div>
				<!-- Header Section -->
				<header>
					<%@ include file="/WEB-INF/views/common/main_header.jsp" %>
				</header>

				<form action="" method="post" id="community_main">
					<div class="container">
						<!-- Main Content Section -->
						<main class="main-content">
							<!-- Sidebar Menu -->
							<aside class="sidebar">

								<ul class="menu">
									<li><a href="#" class="active">실시간 인기글<span class="arrow">›</span></a></li>
									<li><a href="#">자유게시판<span class="arrow">›</span></a></li>
									<li><a href="#">메디톡<span class="arrow">›</span></a></li>
									<li><a href="#">이벤트<span class="arrow">›</span></a></li>
								</ul>
								<div class="support-box">
									<p class="support-text">도움이 필요하신가요?</p>
									<a href="#" class="support-link">1:1 문의하기</a>
								</div>
							</aside>


							<!-- Content Section -->
							<section class="notice-content">
								<div class="content-header">
									<h2 class="content-title">실시간 인기글</h2>
									<!-- 모바일 버전에서만 보이도록 설정할 셀렉트 박스 -->
									<select class="sort-select mobile-only" onchange="sortPosts(this.value)">
										<option value="조회수">조회수</option>
										<option value="작성일">작성일</option>
										<option value="카테고리">카테고리</option>
									</select>
								</div>
								<div class="content-controls">
									<p class="content-description">닥터링의 새로운 소식들과 유용한 정보들을 한곳에서
										확인하세요.</p>
									<!-- 웹 버전에서만 보이도록 설정할 셀렉트 박스 -->
									<select class="sort-select web-only" onchange="sortPosts(this.value)">
										<option value="조회수">조회수</option>
										<option value="작성일">작성일</option>
										<option value="카테고리">카테고리</option>
									</select>
								</div>
								<!-- Table for Posts -->
								<table id="postsTable" class="notice-table">
									<thead>
										<tr>
											<th class="category-header">카테고리</th>
											<th class="title-header">제목</th>
											<th class="author-header">작성자</th>
											<th class="date-header">작성일</th>
											<th class="comment-header">조회수</th>
										</tr>
									</thead>
									<tbody>
										<!-- Example Post Item -->
										<tr>
											<td class="category-header">이벤트</td>
											<td><a href="/post-detail.html?id=1">2024 수능 기념 스마일 라식
													할인!</a></td>
											<td class="author">관리자1</td>
											<td class="date">2022.07.27</td>
											<td class="comment-header">[45]</td>
										</tr>
										<tr>
											<td>의료소통</td>
											<td><a href="/post-detail.html?id=784">상처에 된장 바르면 치료가
													되나요?</a></td>
											<td class="author">paris3131</td>
											<td class="date">2024.11.01</td>
											<td>[45]</td>
										</tr>
										<tr>
											<td>의료소통</td>
											<td><a href="/post-detail.html?id=784">상처에 된장 바르면 치료가
													되나요?</a></td>
											<td class="author">paris3131</td>
											<td class="date">2024.11.01</td>
											<td>[45]</td>
										</tr>
										<tr>
											<td>의료소통</td>
											<td><a href="/post-detail.html?id=784">상처에 된장 바르면 치료가
													되나요?</a></td>
											<td class="author">paris3131</td>
											<td class="date">2024.11.01</td>
											<td>[45]</td>
										</tr>
										<tr>
											<td>의료소통</td>
											<td><a href="/post-detail.html?id=784">상처에 된장 바르면 치료가
													되나요?</a></td>
											<td class="author">paris3131</td>
											<td class="date">2024.11.01</td>
											<td>[45]</td>
										</tr>
										<tr>
											<td>의료소통</td>
											<td><a href="/post-detail.html?id=784">상처에 된장 바르면 치료가
													되나요?</a></td>
											<td class="author">paris3131</td>
											<td class="date">2024.11.01</td>
											<td>[45]</td>
										</tr>
										<tr>
											<td>의료소통</td>
											<td><a href="/post-detail.html?id=784">상처에 된장 바르면 치료가
													되나요?</a></td>
											<td class="author">paris3131</td>
											<td class="date">2024.11.01</td>
											<td>[45]</td>
										</tr>
										<tr>
											<td>의료소통</td>
											<td><a href="/post-detail.html?id=784">상처에 된장 바르면 치료가
													되나요?</a></td>
											<td class="author">paris3131</td>
											<td class="date">2024.11.01</td>
											<td>[45]</td>
										</tr>
										<tr>
											<td>의료소통</td>
											<td><a href="/post-detail.html?id=784">상처에 된장 바르면 치료가
													되나요?</a></td>
											<td class="author">paris3131</td>
											<td class="date">2024.11.01</td>
											<td>[45]</td>
										</tr>
										<tr>
											<td>의료소통</td>
											<td><a href="/post-detail.html?id=784">상처에 된장 바르면 치료가
													되나요?</a></td>
											<td class="author">paris3131</td>
											<td class="date">2024.11.01</td>
											<td>[45]</td>
										</tr>
										<tr>
											<td>일반</td>
											<td><a href="/post-detail.html?id=784">점심 메뉴 추천 해주세요
													맛있는거</a></td>
											<td class="author">jjhim531</td>
											<td class="date">2024.11.01</td>
											<td>[45]</td>
										</tr>
										<tr>
											<td>이벤트</td>
											<td><a href="/post-detail.html?id=1">2024 수능 기념 스마일 라식
													할인!</a></td>
											<td class="author">관리자1</td>
											<td class="date">2022.07.27</td>
											<td>[45]</td>
										</tr>
										<tr>
											<td>일반</td>
											<td><a href="/post-detail.html?id=784">길에서 눕고 싶어요</a></td>
											<td class="author">mingdi0824</td>
											<td class="date">2024.10.02</td>
											<td>[45]</td>
										</tr>
										<tr>
											<td>의료소통</td>
											<td><a href="/post-detail.html?id=784">상처에 된장 바르면 치료가
													되나요?</a></td>
											<td class="author">paris3131</td>
											<td class="date">2024.11.01</td>
											<td>[45]</td>
										</tr>
										<tr>
											<td>의료소통</td>
											<td><a href="/post-detail.html?id=784">상처에 된장 바르면 치료가
													되나요?</a></td>
											<td class="author">paris3131</td>
											<td class="date">2024.11.01</td>
											<td>[45]</td>
										</tr>

										<tr>
											<td>일반</td>
											<td><a href="/post-detail.html?id=784">길에서 눕고 싶어요</a></td>
											<td class="author">mingdi0824</td>
											<td class="date">2024.10.02</td>
											<td>[45]</td>
										</tr>
										<tr>
											<td>일반</td>
											<td><a href="/post-detail.html?id=784">길에서 눕고 싶어요</a></td>
											<td class="author">mingdi0824</td>
											<td class="date">2024.10.02</td>
											<td>[45]</td>
										</tr>
										<tr>
											<td>의료소통</td>
											<td><a href="/post-detail.html?id=784">상처에 된장 바르면 치료가
													되나요?</a></td>
											<td class="author">paris3131</td>
											<td class="date">2024.11.01</td>
											<td>[45]</td>
										</tr>
										<tr>
											<td>의료소통</td>
											<td><a href="/post-detail.html?id=784">상처에 된장 바르면 치료가
													되나요?</a></td>
											<td class="author">paris3131</td>
											<td class="date">2024.11.01</td>
											<td>[45]</td>
										</tr>
										<tr>
											<td>의료소통</td>
											<td><a href="/post-detail.html?id=784">상처에 된장 바르면 치료가
													되나요?</a></td>
											<td class="author">paris3131</td>
											<td class="date">2024.11.01</td>
											<td>[45]</td>
										</tr>

										<!-- Additional rows as needed -->
									</tbody>
								</table>
								<!-- Pagination Footer -->
								<footer class="pagination-footer">
									<div class="pagination">
										<a href="?page=1">1</a> <a href="?page=2">2</a> <a href="?page=3">3</a>
										<a href="?page=4">4</a> <a href="?page=5">5</a>
									</div>
									<button class="write-button">글쓰기</button>
								</footer>


								<div class="empty-space"></div> <!-- 오른쪽 빈 공간 -->
						</main>
				</form>
				<!-- JavaScript 코드 추가 -->
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


						switch (category) {
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