<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Post Management</title>
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/post_management.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/admin_header.jsp"/>

<div class="post-management">

    <div class="content">
        <h2>게시글 관리</h2>
        <p class="total-post">총 게시글 수: ${postList.size()}</p>

        <div class="sort-dropdown">
            <select id="filterSelect" onchange="filterPosts()">
                <option value="전체">전체</option>
                <option value="자유게시판">자유게시판</option>
                <option value="메디톡">메디톡</option>
                <option value="이벤트게시판">이벤트게시판</option>
            </select>
        </div>

        <div class="post-list">
            <c:forEach var="post" items="${postList}">
                <a href="postDetail?boardNo=${post.boardNo}" class="post-item" data-category="${post.categoryName}">
                    <p>
                        <span>${post.boardWriter}</span>
                        <span>${post.categoryName}</span>
                        <span>등록일: ${post.enrollDate}</span>
                    </p>
                    <p class="post-title">${post.boardTitle}</p>
                    <p>
                        <span>조회수: </span>
                        <span class="views">${post.boardViews}</span>
                    </p>
                </a>
            </c:forEach>
        </div>
    </div>
</div>

<script>
    function filterPosts() {
        const filter = document.getElementById('filterSelect').value;
        const items = document.querySelectorAll('.post-item');

        items.forEach(item => {
            const category = item.getAttribute('data-category');
            if (filter === '전체' || category === filter) {
                item.style.display = '';
            } else {
                item.style.display = 'none';
            }
        });
    }
</script>

</body>
</html>
