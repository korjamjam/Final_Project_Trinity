<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Doctoring Footer</title>

<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/common/main_footer_style.css">
<link
	href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_public.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/community/reply.js"></script>
</head>
<body>
<input type="hidden" id="bno" value="${b.boardNo}">
<input type="hidden" id="loginUserNo" value="${loginUser != null ? loginUser.userNo : ''}">
<input type="hidden" id="loginUserId" value="${loginUser != null ? loginUser.userId : ''}">


<div class="comment-section-container">
	<div class="comment-header">
		<td colspan="3">
			<div>
				전체 댓글(<span id="rcount">0</span>)
			</div>
		</td>
		<button onclick="toggleComments()" id="toggle-comments-button">
			댓글 닫기 <span id="arrow">&#9650;</span>
		</button>
	</div>

	<div class="comment-section-wrapper" id="comment-section">
		<div class="comment-section">
			<table class="comment-table">
				<thead>
					<tr>
						<th>작성자</th>
						<th>댓글 내용</th>
						<th>작성일</th>
						<th>좋아요</th>
					</tr>
				</thead>
				<tbody id="commentList">
					<!-- 댓글 목록이 여기에 동적으로 추가됩니다 -->
				</tbody>
			</table>

			<div id="comment-form">
				<c:choose>
					<c:when test="${empty loginUser}">
						<div class="comment-header">
							<div class="user-info">
								<textarea class="form-control" readonly placeholder="로그인 후 이용 가능합니다."
									 rows="2" style="resize:none; width:100%;"></textarea>
							</div>
							<th style="vertical-align:middle">
								<button class="btn btn-secondary round-button disabled">댓글 등록</button>
							</th>
						</div>
					</c:when>
					<c:otherwise>
						<div class="comment-header">
							<div class="user-info">
								<span id="currentUser">${loginUser.userId}</span>
							</div>
							<th style="vertical-align:middle">
								<button class="btn btn-secondary round-button" onclick="addReply();">댓글 등록</button>
							</th>
						</div>
						<textarea id="content" class="form-control" placeholder="댓글 작성"></textarea>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>
</body>
</html>
