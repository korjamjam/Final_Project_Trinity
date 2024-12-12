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
<link
	href="${pageContext.servletContext.contextPath}/resources/css/community/board.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- jQuery 추가 -->
	<script
	src="${pageContext.servletContext.contextPath}/resources/js/inquiry/inquiry_board.js"></script>
<title>${categoryName}게시판</title>
</head>


<body>


	<script>
		const contextPath = "${pageContext.servletContext.contextPath}";
		const categoryId = "${categoryId}"; // categoryId 값을 JavaScript 변수로 전달
		console.log("Category ID in JSP: ${categoryId}");
		console.log("Sort Type in JSP: ${sortType}");
	</script>
	<!-- 헤더 -->
	<header id="headerSection">
		<%@ include file="/WEB-INF/views/common/main_header.jsp"%>
	</header>

	<main id="mainContent">
		<div class="empty-space"></div>
		<!-- 사이드바 -->
		<div id="sideMenu">
			<div class="sideMenuWrapper">
				<%@ include file="/WEB-INF/views/inquiry/inquiry_sidemenu.jsp"%>
			</div>
		</div>

		<!-- 메인 콘텐츠 -->
		<div id="mainWrapper">
			<div id="contentHeader">		
					<h2 class="content-title">
						<c:choose>
							<c:when test="${categoryId == 'CAT04'}">공지사항</c:when>
							<c:when test="${categoryId == 'CAT05'}">알림판</c:when>
							<c:when test="${categoryId == 'CAT06'}">FAQ</c:when>
						</c:choose>
					</h2>
				
				<div id="contentControls">
					<p class="content-description">닥터링의 새로운 소식들과 유용한 정보들을 한곳에서
						확인하세요.</p>
					<div id="contentButton">
						<select id="sortSelect" data-category-id="${categoryId}"
							onchange="sortPosts(this.value)">
							<option value="조회수" ${sortType == '조회수' ? 'selected' : ''}>조회수</option>
							<option value="작성일" ${sortType == '작성일' ? 'selected' : ''}>작성일</option>
							<option value="카테고리" ${sortType == '카테고리' ? 'selected' : ''}>카테고리</option>
						</select>

						



						<c:if test="${not empty sessionScope.loginUser}">
							<!-- type 값을 설정한 후 글쓰기 버튼에 반영 -->
							<c:choose>
								<c:when test="${categoryName eq '공지사항'}">
									<c:set var="categoryId" value="CAT04" />
								</c:when>
								<c:when test="${categoryName eq '알림판'}">
									<c:set var="categoryId" value="CAT05" />
								</c:when>
								<c:when test="${categoryName eq 'FAQ'}">
									<c:set var="categoryId" value="CAT06" />
								</c:when>
								<c:when test="${categoryName eq 'Q&A'}">
									<c:set var="categoryId" value="CAT07" />
								</c:when>
							</c:choose>

							<!-- 글쓰기 버튼 -->
							<a class="round-button"
								href="${pageContext.request.contextPath}/inquiry/write?categoryId=${categoryId}">글쓰기</a>
						</c:if>


					</div>
				</div>
			</div>

			<!-- 게시글 목록 테이블 -->
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
					<c:forEach var="inq" items="${inquiryList}">
						<tr>
							<td class="category">${inq.categoryName}</td>
							<td class="title"><a
								href="${pageContext.request.contextPath}/inquiry/inquiryDetail?ino=${inq.inquiryNo}">${inq.inquiryTitle}
							</a></td>
							<td class="author">${inq.inquiryWriter}</td>
							<td class="date">${inq.enrollDate}</td>
							<td class="views">${inq.inquiryViews}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- 페이지네이션 -->
			<div id="pageSearchContainer">
				<div id="pagingArea">
					<ul class="pagination">
						<!-- 이전 페이지 버튼 -->
						<c:choose>
							<c:when test="${pi.currentPage eq 1}">
								<li class="page-item disabled"><a class="page-link"
									href="#">&#60;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/community/board?categoryId=${categoryId}&cpage=${pi.currentPage - 1}">&#60;</a>
								</li>
							</c:otherwise>
						</c:choose>

						<!-- 페이지 번호 -->
						<c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
							<li class="page-item ${page == pi.currentPage ? 'active' : ''}">
								<a class="page-link"
								href="${pageContext.request.contextPath}/community/board?categoryId=${categoryId}&cpage=${page}">${page}</a>
							</li>
						</c:forEach>

						<!-- 다음 페이지 버튼 -->
						<c:choose>
							<c:when test="${pi.currentPage eq pi.maxPage}">
								<li class="page-item disabled"><a class="page-link"
									href="#">&#62;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/community/board?categoryId=${categoryId}&cpage=${pi.currentPage + 1}">&#62;</a>
								</li>

							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>

		<!-- 오른쪽 빈 공간 -->
		<div class="empty-space"></div>

	</main>

	<!-- 푸터 -->
	<footer id="footerSection">
		<%@ include file="/WEB-INF/views/common/main_footer.jsp"%>
	</footer>


</body>

</html>