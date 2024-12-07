<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html lang="ko">

		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<!-- jQuery -->
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


			<!-- Bootstrap CSS -->
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
			<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
			<link href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_dropdown.css"
				rel="stylesheet">
			<link href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_public.css"
				rel="stylesheet">
			<link href="${ pageContext.servletContext.contextPath }/resources/css/community/community_board_detail.css"
				rel="stylesheet">
			<link href="${ pageContext.servletContext.contextPath }/resources/css/common/comments.css" rel="stylesheet">
			<title>게시글 상세 페이지</title>
		</head>

		<body>
			<!-- EL 데이터를 JavaScript 변수로 전달 -->
			<script>
				const contextPath = "${pageContext.servletContext.contextPath}";
				const boardNo = "${b.boardNo}";
				const categoryId = "${b.categoryId}";  // categoryId 값을 JavaScript 변수로 전달
				const loginUserNo = "${loginUser != null ? loginUser.userNo : ''}";
				const loginUserId = "${loginUser != null ? loginUser.userId : ''}";
				// 로그로 JSP에서 전달된 데이터 확인
				console.log("로그인 유저 : ${loginUser}");
				console.log("boardNo: ${b.boardNo}, categoryId: ${b.categoryId}");
			</script>

			<!-- Header Section -->
			<header>
				<%@ include file="/WEB-INF/views/common/main_header.jsp" %>
			</header>

			<main id="main-content">
				<!-- Sidebar Menu -->
				<div id="side-menu">
					<%@ include file="/WEB-INF/views/community/community_sidemenu.jsp" %>
				</div>

				<!-- Board Container -->
				<div id="main-wrapper">
					<div class="navigation-buttons">
						<!-- 왼쪽 섹션: 수정, 삭제 -->
						<div class="left-section">
							<!-- 수정 버튼 -->
							<button class="white-button"
								onclick="location.href='${pageContext.request.contextPath}/community/edit?bno=${b.boardNo}'">수정</button>

							<!-- 삭제 버튼 -->
							<button class="white-button"
								onclick="deleteBoard('${b.boardNo}', '${b.categoryId}')">삭제</button>

						</div>




						<!-- 오른쪽 섹션: 목록 보기, 이전글, 다음글 -->
						<div class="right-section">
							<button class="round-button" onclick="location.href='list.bo'">목록
								보기</button>
							<div class="nav-links-group">
								<a href="detail.bo?bno=${prevBoardNo}" class="nav-text">&laquo;
									이전글</a> <a href="detail.bo?bno=${nextBoardNo}" class="nav-text">다음글
									&raquo;</a>
							</div>
						</div>
					</div>

					<div class="board-container">
						<!-- 게시글 상세 정보 -->
						<table class="board-detail">
							<tr>
								<td class="breadcrumb"><span>게시판 &nbsp</span> &gt;
									<div class="custom-dropdown">
										<div class="selected-container">
											<div class="selected-option">${categoryName}</div>
											<!-- 컨트롤러에서 넘겨준 첫 번째 카테고리 이름 -->
											<div class="dropdown-arrow">▼</div>
										</div>

										<div class="option-list" id="community-options">
											<c:forEach var="category" items="${categories}">
												<div class="option-item" data-url="${category.categoryId}">
													<!-- CATEGORY_ID를 URL로 사용한다면 category.categoryId 사용 -->
													${category.categoryName}
													<!-- CATEGORY_NAME을 표시 -->
												</div>
											</c:forEach>
										</div>


									</div>
								</td>
							</tr>
							<tr>
								<td class="board-title">${b.boardTitle}</td>
							</tr>
							<tr>
								<td class="board-user-info"><span
										class="${sessionScope.loginUser != null && sessionScope.loginUser.userId == b.boardWriter ? 'highlight-user' : ''}">
										${b.boardWriter} </span> 일반회원&nbsp</td>
								<td class="board-meta"><span>${b.enrollDate}</span> | <span>조회
										${b.boardViews}</span></td>
							</tr>
						</table>

						<div class="board-content-wrapper">
							<div class="board-content">
								<!-- 게시글 내용 -->
								${b.boardContent}
							</div>

							<!-- 첨부파일 섹션 include -->
							<c:if test="${not empty attachedFiles}">
								<%@ include file="/WEB-INF/views/common/attached_files.jsp" %>
							</c:if>
							<!-- 답변 콘텐츠 -->
							<textarea id="summernote" name="boardContent" class="post-textarea form-control mt-3"></textarea>
							<div class="mt-4">
								<label for="upfile" class="form-label">첨부파일</label> <input type="file" id="upfile"
									name="upfiles" class="form-control" multiple onchange="checkFileValidation(this)">
								<small id="fileHelp" class="form-text">최대 3개의 파일만 업로드할 수 있습니다. (각 파일 최대 5MB)</small>
								<!-- 파일 개수 표시 -->
		
								<div id="file-list-container">
									<div id="file-list"></div>
								</div>
							</div>

							<!-- <c:forEach var="answer" items="${answers}">
								<div class="board-content answer-content">
									<div class="expert-container">
										<%@ include file="/WEB-INF/views/common/expert_card.jsp" %>
									</div>
									<div class="response-section">
										<div class="expert-response">${answer.content}</div>
										<div class="disclaimer-container">
											<div class="response-disclaimer">* 본 답변은 참고용입니다.</div>
											<div class="right-aligned-buttons">
												<button class="like-button" onclick="incrementLike(${answer.id})">
													👍 <span id="like-count-${answer.id}">${answer.likes}</span>
												</button>
												<button class="white-button">신고하기</button>
											</div>
										</div>
									</div>
								</div>
							</c:forEach> -->
						</div>
					</div>

					<%@ include file="/WEB-INF/views/common/comments.jsp" %>
				</div>
				<div class="empty-space"></div>
			</main>

			<footer>
				<%@ include file="/WEB-INF/views/common/main_footer.jsp" %>
			</footer>

			<script
				src="${ pageContext.servletContext.contextPath }/resources/js/community/community_board_detail.js"></script>
		</body>

		</html>