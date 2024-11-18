<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link
		href="${pageContext.servletContext.contextPath}/resources/css/common/custom_public.css"
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
		<%@ include file="/WEB-INF/views/common/main_header.jsp"%>
	</header>

	<main id="mainContent">
		<!-- Sidebar Menu -->
		<div id="sideMenu">
			<%@ include file="/WEB-INF/views/community/community_sidemenu.jsp"%>
		</div>
		<div id="mainWrapper">
			<!-- Content Section -->
			<div id="contentHeader">
				<h2 class="content-title">${boardCategory}</h2>
				<div id="contentControls">
					<p class="content-description">닥터링의 새로운 소식들과 유용한 정보들을 한곳에서
						확인하세요.</p>
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
		</div>

		<!-- Table for Posts -->
		<table id="postsTable" class="notice-table">
			<thead>
				<tr>
					<th class="category-header">카테고리</th>
					<th class="title-header">제목</th>
					<th class="author-header">작성자</th>
					<th class="date-header">작성일</th>
					<th class="views-header">조회수</th>
				</tr>
			</thead>
			<tbody>
	
			
				<tr>
					<td class="category">이벤트</td>
					<td class="title">2024 수능 기념 스마일 라식 할인!</td>
					<td class="author">관리자1</td>
					<td class="date">2022.07.27</td>
					<td class="views">90</td>
				</tr>
				<tr>
					<td class="category">공지</td>
					<td class="title">새로운 업데이트 소식 안내</td>
					<td class="author">관리자2</td>
					<td class="date">2023.01.15</td>
					<td class="views">45</td>
				</tr>
			</tbody>
		</table>

		<!-- Pagination Footer -->
		<div id="pageSearchContainer">
			<div id="pagingArea">
				<ul class="pagination">
					<c:choose>
						<c:when test="${pi.currentPage eq 1}">
							<li class="page-item disabled"><a class="page-link" href="#">&#60;</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="list.bo?cpage=${pi.currentPage - 1}">&#60;</a></li>
						</c:otherwise>
					</c:choose>
					<div class="page-numbers">
						<c:forEach var="p" begin="1" end="5">
							<c:choose>
								<c:when test="${p eq pi.currentPage}">
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
			<div id="searchSection">
				<select id="searchType" name="searchType">
					<option value="title">제목만</option>
					<option value="author">글작성자</option>
					<option value="content">댓글내용</option>
				</select>
				<div class="search-input-group">
					<input type="text" id="searchInput" placeholder="검색어를 입력해주세요" />
					<button class="round-button search-button">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</div>
	</main>

	<footer id="footerSection">
		<%@ include file="/WEB-INF/views/common/main_footer.jsp"%>
	</footer>

	<script>
		function parseDate(dateStr) {
			const [year, month, day] = dateStr.split(".");
			return new Date(year, month - 1, day);
		}

		function extractNumber(text) {
			return parseInt(text.replace(/[^0-9]/g, ''), 10);
		}

		function sortPosts(sortBy) {
			const table = document.getElementById("postsTable");
			const rows = Array.from(table.getElementsByTagName("tr")).slice(1);

			rows.sort((a, b) => {
				let tdA, tdB;

				if (sortBy === "조회수") {
					tdA = extractNumber(a.getElementsByClassName("views")[0].innerText);
					tdB = extractNumber(b.getElementsByClassName("views")[0].innerText);
					return tdB - tdA;
				} else if (sortBy === "작성일") {
					tdA = parseDate(a.getElementsByClassName("date")[0].innerText);
					tdB = parseDate(b.getElementsByClassName("date")[0].innerText);
					return tdB - tdA;
				} else if (sortBy === "카테고리") {
					tdA = a.getElementsByClassName("category")[0].innerText;
					tdB = b.getElementsByClassName("category")[0].innerText;
					return tdA.localeCompare(tdB, 'ko');
				}
				return 0;
			});

			const tbody = table.getElementsByTagName("tbody")[0];
			rows.forEach(row => tbody.appendChild(row));
		}
	</script>

</body>

</html>
