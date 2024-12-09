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

<script src="${pageContext.servletContext.contextPath}/resources/js/community/comment.js"></script>
</head>
<body>


<div class="comment-section-container">
    <div class="comment-header"> <!-- 이 부분은 댓글 목록 제목용 -->
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
        </div>
    </div>

  <div id="comment-form">
 <c:choose>
    <c:when test="${empty loginUser}">
        <div class="comment-form-header">
            <div class="user-info">
                <textarea class="form-control" readonly placeholder="로그인 후 이용 가능합니다." rows="2" style="resize:none; width:100%;"></textarea>
            </div>
            <button class="btn btn-secondary round-button disabled" onclick="addReply()">댓글 등록</button>
        </div>
    </c:when>
    <c:otherwise>
    <div class="comment-form-header">
        <div class="user-info">
            <span id="currentUser">${loginUser.userId}</span>
        </div>
        <textarea id="content" class="form-control" placeholder="댓글을 작성해주세요"></textarea>
        <button class="round-button" id="addReplyButton">댓글 등록</button></div>
    </c:otherwise>
</c:choose>

</div>



</div>
</body></html>