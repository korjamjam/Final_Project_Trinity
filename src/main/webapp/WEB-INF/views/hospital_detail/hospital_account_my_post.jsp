<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내가 쓴 게시글</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/account/mypost.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/community/community_board_detail.js"></script>
</head>
<body>
    <script>
        const contextPath = "${pageContext.servletContext.contextPath}";
        const boardNo = "${post.boardNo}";
    </script>
    <jsp:include page="/WEB-INF/views/hospital_detail/hospital_account_header.jsp" />
    <div class="mypost-container">
        <h1>내가 쓴 게시글</h1>
        <a href="${pageContext.servletContext.contextPath}/hospital/account/myPost/write" class="edit-btn" style="float: right;">글쓰기</a>
        <table class="mypost-table">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성일</th>
                    <th>조회수</th>
                    <th>상태</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="post" items="${myposts}">
                    <tr>
                        <td>${post.boardNo}</td>
                        <td><a href="${pageContext.request.contextPath}/community/boardDetail?bno=${post.boardNo}">${post.boardTitle}</a></td>
                        <td>${post.enrollDate}</td>
                        <td>${post.boardViews}</td>
                        <td>${post.status == 'Y' ? '활성화' : '비활성화'}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/community/edit?bno=${post.boardNo}" class="edit-btn">수정</a>
                            <button class="delete-btn" onclick="deleteBoardAC('${post.boardNo}', 'CAT03')">삭제</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <c:if test="${myposts == null || myposts.isEmpty()}">
            <p class="no-posts-message">작성한 게시글이 없습니다.</p>
        </c:if>
    </div>
</body>
</html>
