<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// type 파라미터로 게시판 타입을 구분
String boardType = request.getParameter("type");
String boardTitle = "";

// 게시판 타입에 따라 제목을 설정
if ("free".equals(boardType)) {
	boardTitle = "자유게시판";
} else if ("meditalk".equals(boardType)) {
	boardTitle = "메디톡";
} else if ("event".equals(boardType)) {
	boardTitle = "이벤트";
} else {
	boardTitle = "게시판"; // 기본 제목
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="${pageContext.servletContext.contextPath}/resources/css/common/custom_public.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/community/community_main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<title>${boardTitle}</title>
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
				<h2 class="content-title"><%=boardTitle%></h2>
				<div id="contentControls">
					<p class="content-description">닥터링의 새로운 소식들과 유용한 정보들을 한곳에서
						확인하세요.</p>

					<!-- 정렬 셀렉트 박스 및 글쓰기 버튼 -->
					<div id="contentButton">
						<select id="sortSelect" onchange="sortPosts(this.value)">
							<option value="조회수">조회수</option>
							<option value="작성일">작성일</option>
							<option value="카테고리">카테고리</option>
						</select>
						<c:if test="${not empty sessionScope.loginUser}">
							<a class="round-button" href="summernote.me">글쓰기</a>
						</c:if>
					</div>
				</div>
			</div>

			<!-- Table for Posts -->
			<!-- 기존 코드 유지 (게시글 테이블) -->
			<table id="postsTable" class="notice-table">
				<!-- ... -->
			</table>

			<!-- Pagination Footer 및 검색 필드 -->
			<div id="pageSearchContainer">
				<!-- ... -->
			</div>
		</div>
	</main>

	<footer id="footerSection">
		<%@ include file="/WEB-INF/views/common/main_footer.jsp"%>
	</footer>

	<script>
		// JavaScript 코드 (sortPosts 함수 등)
	</script>
</body>
</html>
