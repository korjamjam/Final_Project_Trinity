<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.servletContext.contextPath}/resources/css/common/custom_public.css" rel="stylesheet">
    <link href="${pageContext.servletContext.contextPath}/resources/css/community/board.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <title>${boardCategory} 게시판</title>
</head>

<body>
    <!-- 헤더 -->
    <header id="headerSection">
        <%@ include file="/WEB-INF/views/common/main_header.jsp" %>
    </header>

    <main id="mainContent">
        <!-- 사이드바 -->
        <div id="sideMenu">
            <div class="sideMenuWrapper">
                <%@ include file="/WEB-INF/views/community/community_sidemenu.jsp" %>
            </div>
        </div>

        <!-- 메인 콘텐츠 -->
		<div id="mainWrapper">
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
					<c:forEach var="board" items="${boardList}">
						<tr>
							<td class="category">${board.boardCategory}</td>
							<td class="title"><a
								href="${pageContext.request.contextPath}/boardDetail?bno=${board.boardNo}">
									${board.boardTitle} </a></td>
							<td class="author">${board.boardWriter}</td>
							<td class="date">${board.enrollDate}</td>
							<td class="comment">${board.boardViews}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<c:if test="${boardCategory eq '자유게시판'}">
				<c:set var="type" value="free" />
			</c:if>
			<c:if test="${boardCategory eq '메디톡'}">
				<c:set var="type" value="meditalk" />
			</c:if>
			<c:if test="${boardCategory eq '이벤트게시판'}">
				<c:set var="type" value="event" />
			</c:if>
			<c:if test="${boardCategory eq '실시간 인기글'}">
				<c:set var="type" value="popular" />
			</c:if>

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
									href="${pageContext.request.contextPath}/community/board?type=${type}&cpage=${pi.currentPage - 1}">&#60;</a>
								</li>
							</c:otherwise>
						</c:choose>

						<!-- 페이지 번호 -->
						<c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
							<li class="page-item ${page == pi.currentPage ? 'active' : ''}">
								<a class="page-link"
								href="${pageContext.request.contextPath}/community/board?type=${type}&cpage=${page}">${page}</a>
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
									href="${pageContext.request.contextPath}/community/board?type=${type}&cpage=${pi.currentPage + 1}">&#62;</a>
								</li>
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


					<!-- input과 돋보기 아이콘을 그룹으로 묶기 -->
					<div class="search-input-group">
						<input type="text" id="searchInput" placeholder="검색어를 입력해주세요" />
						<button class="round-button search-button">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 오른쪽 빈 공간 -->
        <div class="empty-space"></div>
    </main>

    <!-- 푸터 -->
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
    </script>
</body>

</html>
