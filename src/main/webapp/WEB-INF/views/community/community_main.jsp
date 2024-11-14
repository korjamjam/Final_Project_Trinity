<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
		<!DOCTYPE html>
		<html lang="ko">

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<link href="${pageContext.servletContext.contextPath}/resources/css/common/custom_public.css"
				rel="stylesheet">
			<link rel="stylesheet"
				href="${pageContext.servletContext.contextPath}/resources/css/community/board.css">
			<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
			<title>Customer Center</title>
		</head>

		<body>
			<!-- Header Section -->
			<header id="headerSection">
				<%@ include file="/WEB-INF/views/common/main_header.jsp" %>
			</header>

			<main id="mainContent">
				<!-- Sidebar Menu -->
				<div id="sideMenu">
					<%@ include file="/WEB-INF/views/community/community_sidemenu.jsp" %>
				</div>
				<div id="mainWrapper">
					<!-- Content Section -->
					<div id="contentHeader">
						<h2 class="content-title">${boardTitle}</h2>
						<div id="contentControls">
							<p class="content-description">닥터링의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</p>

							<!-- 정렬 셀렉트 박스 및 글쓰기 버튼 -->
							<div id="contentButton">
								<select id="sortSelect" onchange="sortPosts(this.value)">
									<option value="조회수">조회수</option>
									<option value="작성일">작성일</option>
									<option value="카테고리">카테고리</option>
								</select>
								<c:if test="${not empty sessionScope.loginUser}">
									<a class="round-button" href="write">글쓰기</a>
								</c:if>
							</div>
						</div>
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
								<td>2024 수능 기념 스마일 라식 할인!</td>
								<td class="author">관리자1</td>
								<td class="date">2022.07.27</td>
								<td class="comment-header">[90]</td>
							</tr>
							<tr>
								<td class="category-header">이벤트</td>
								<td>2024 수능 기념 스마일 라식 할인!</td>
								<td class="author">관리자1</td>
								<td class="date">2022.07.27</td>
								<td class="comment-header">[45]</td>
							</tr>
							<tr>
								<td class="category-header">이벤트</td>
								<td>2024 수능 기념 스마일 라식 할인!</td>
								<td class="author">관리자1</td>
								<td class="date">2022.07.27</td>
								<td class="comment-header">[85]</td>
							</tr>
							<tr>
								<td class="category-header">이벤트</td>
								<td>2024 수능 기념 스마일 라식 할인!</td>
								<td class="author">관리자1</td>
								<td class="date">2022.07.27</td>
								<td class="comment-header">[45]</td>
							</tr>
							<tr>
								<td class="category-header">이벤트</td>
								<td>2024 수능 기념 스마일 라식 할인!</td>
								<td class="author">관리자1</td>
								<td class="date">2022.07.27</td>
								<td class="comment-header">[45]</td>
							</tr>
							<tr>
								<td class="category-header">이벤트</td>
								<td>2024 수능 기념 스마일 라식 할인!</td>
								<td class="author">관리자1</td>
								<td class="date">2022.07.27</td>
								<td class="comment-header">[90]</td>
							</tr> <!-- Example Post Item -->
							<tr>
								<td class="category-header">이벤트</td>
								<td>2024 수능 기념 스마일 라식 할인!</td>
								<td class="author">관리자1</td>
								<td class="date">2022.07.27</td>
								<td class="comment-header">[45]</td>
							</tr>
							<!-- Example Post Item -->
							<tr>
								<td class="category-header">이벤트</td>
								<td>2024 수능 기념 스마일 라식 할인!</td>
								<td class="author">관리자1</td>
								<td class="date">2022.07.27</td>
								<td class="comment-header">[45]</td>
							</tr>

							<!-- Example Post Item -->
							<tr>
								<td class="category-header">이벤트</td>
								<td>2024 수능 기념 스마일 라식 할인!</td>
								<td class="author">관리자1</td>
								<td class="date">2022.07.27</td>
								<td class="comment-header">[45]</td>
							</tr>
							<!-- Example Post Item -->
							<tr>
								<td class="category-header">이벤트</td>
								<td>2024 수능 기념 스마일 라식 할인!</td>
								<td class="author">관리자1</td>
								<td class="date">2022.07.27</td>
								<td class="comment-header">[45]</td>
							</tr>
							<!-- Example Post Item -->
							<tr>
								<td class="category-header">이벤트</td>
								<td>2024 수능 기념 스마일 라식 할인!</td>
								<td class="author">관리자1</td>
								<td class="date">2022.07.27</td>
								<td class="comment-header">[45]</td>
							</tr>
							<!-- Example Post Item -->
							<tr>
								<td class="category-header">이벤트</td>
								<td>2024 수능 기념 스마일 라식 할인!</td>
								<td class="author">관리자1</td>
								<td class="date">2022.07.27</td>
								<td class="comment-header">[45]</td>
							</tr>
							<!-- Example Post Item -->
							<tr>
								<td class="category-header">이벤트</td>
								<td>2024 수능 기념 스마일 라식 할인!</td>
								<td class="author">관리자1</td>
								<td class="date">2022.07.27</td>
								<td class="comment-header">[45]</td>
							</tr>
							<!-- Example Post Item -->
							<tr>
								<td class="category-header">이벤트</td>
								<td>2024 수능 기념 스마일 라식 할인!</td>
								<td class="author">관리자1</td>
								<td class="date">2022.07.27</td>
								<td class="comment-header">[45]</td>
							</tr>
							<!-- Example Post Item -->
							<tr>
								<td class="category-header">이벤트</td>
								<td>2024 수능 기념 스마일 라식 할인!</td>
								<td class="author">관리자1</td>
								<td class="date">2022.07.27</td>
								<td class="comment-header">[45]</td>
							</tr>


							<tr>
								<td class="category-header">이벤트</td>
								<td>2024 수능 기념 스마일 라식 할인!</td>
								<td class="author">관리자1</td>
								<td class="date">2022.07.27</td>
								<td class="comment-header">[45]</td>
							</tr>

							<!-- Additional rows here -->
						</tbody>
					</table>

					<!-- Pagination Footer -->
					<div id="pageSearchContainer">
						<div id="pagingArea">
							<ul class="pagination">
								<!-- Previous Button -->
								<c:choose>
									<c:when test="${pi.currentPage eq 1}">
										<li class="page-item disabled"><a class="page-link" href="#">&#60;</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
												href="list.bo?cpage=${pi.currentPage - 1}">&#60;</a></li>
									</c:otherwise>
								</c:choose>

								<!-- Page Number Links (1 to 5) -->
								<div class="page-numbers"> <!-- page-numbers 클래스 추가 -->
									<c:forEach var="p" begin="1" end="5">
										<c:choose>
											<c:when test="${p eq pi.currentPage}">
												<!-- Active page style -->
												<li class="page-item active"><a class="page-link"
														href="list.bo?cpage=${p}">${p}</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
														href="list.bo?cpage=${p}">${p}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>

								<!-- Next Button -->
								<c:choose>
									<c:when test="${pi.currentPage eq pi.maxPage}">
										<li class="page-item disabled"><a class="page-link" href="#">&#62;</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
												href="list.bo?cpage=${pi.currentPage + 1}">&#62;</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>


						<!-- 검색 필드 섹션 -->
						<div id="searchSection">
							<select id="searchType" name="searchType">
								<option value="title">제목만</option>
								<option value="author">글작성자</option>
								<option value="content">댓글내용</option>
							</select>

							<!-- input과 돋보기 아이콘을 그룹으로 묶기 -->
							<div class="search-input-group">
								<input type="text" id="searchInput" placeholder="검색어를 입력해주세요" />
								<button class="round-button search-button"><i class="fas fa-search"></i></button>
							</div>
						</div>

					</div>

				</div>
				<!-- 오른쪽 빈 공간 -->
				<div class="empty-space"></div>
			</main>

			<footer id="footerSection">
				<%@ include file="/WEB-INF/views/common/main_footer.jsp" %>
			</footer>

			<script>
				// 날짜 형식을 Date 객체로 변환
				function parseDate(dateStr) {
					const [year, month, day] = dateStr.split(".");
					return new Date(year, month - 1, day);
				}

				// 숫자만 추출하여 정수로 변환
				function extractNumber(text) {
					return parseInt(text.replace(/[^0-9]/g, ''), 10);
				}

				// 테이블을 정렬하는 함수
				function sortPosts(sortBy) {
					const table = document.getElementById("postsTable");
					const rows = Array.from(table.getElementsByTagName("tr")).slice(1); // 첫 번째 행(헤더)은 제외

					// 정렬 기준에 따라 rows 배열 정렬
					rows.sort((a, b) => {
						let tdA, tdB;

						if (sortBy === "조회수") {
							// 조회수를 기준으로 정렬
							tdA = extractNumber(a.getElementsByTagName("td")[4].innerText);
							tdB = extractNumber(b.getElementsByTagName("td")[4].innerText);
							return tdB - tdA; // 내림차순 정렬
						} else if (sortBy === "작성일") {
							// 작성일을 기준으로 정렬
							tdA = parseDate(a.getElementsByTagName("td")[3].innerText);
							tdB = parseDate(b.getElementsByTagName("td")[3].innerText);
							return tdB - tdA; // 최신 글부터 내림차순 정렬
						} else if (sortBy === "카테고리") {
							// 카테고리명 오름차순 정렬
							tdA = a.getElementsByTagName("td")[0].innerText;
							tdB = b.getElementsByTagName("td")[0].innerText;
							return tdA.localeCompare(tdB, 'ko'); // 한글 기준 비교
						}
						return 0;
					});

					// 정렬된 행을 tbody에 다시 추가하여 표시
					const tbody = table.getElementsByTagName("tbody")[0];
					rows.forEach(row => tbody.appendChild(row));
				}
			</script>

		</body>

		</html>