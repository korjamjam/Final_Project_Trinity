<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_dropdown.css" rel="stylesheet">
    <link href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_public.css" rel="stylesheet">
    <link href="${ pageContext.servletContext.contextPath }/resources/css/community/community_board_detail.css" rel="stylesheet">
    <link href="${ pageContext.servletContext.contextPath }/resources/css/common/comments.css" rel="stylesheet">
    <title>게시글 상세 페이지</title>
</head>

<body>
    <!-- Header Section -->
    <header>
        <%@ include file="/WEB-INF/views/common/main_header.jsp"%>
    </header>

    <main id="main-content">
        <!-- Sidebar Menu -->
        <div id="side-menu">
            <%@ include file="/WEB-INF/views/community/community_sidemenu.jsp"%>
        </div>

        <!-- Board Container -->
        <div id="main-wrapper">
            <div class="navigation-buttons">
                <!-- 왼쪽 섹션: 수정, 삭제 -->
                <div class="left-section">
                    <button class="white-button" onclick="location.href='edit?bno=${b.boardNo}'">수정</button>
                    <button class="white-button" onclick="deletePost(${b.boardNo})">삭제</button>
                </div>

                <!-- 오른쪽 섹션: 목록 보기, 이전글, 다음글 -->
                <div class="right-section">
                    <button class="round-button" onclick="location.href='list.bo'">목록 보기</button>
                    <div class="nav-links-group">
                        <a href="detail.bo?bno=${prevBoardNo}" class="nav-text">&laquo; 이전글</a>
                        <a href="detail.bo?bno=${nextBoardNo}" class="nav-text">다음글 &raquo;</a>
                    </div>
                </div>
            </div>

            <div class="board-container">
                <!-- 게시글 상세 정보 -->
                <table class="board-detail">
                    <tr>
                        <td class="breadcrumb">
                            <span>게시판 &nbsp</span> &gt;
                            <div class="custom-dropdown">
                                <div class="selected-container" onclick="showAndHide('#community-options')">
                                    <div class="selected-option">${boardCategory}</div>
                                    <div class="dropdown-arrow">▼</div>
                                </div>
                                <div class="option-list" id="community-options">
                                    <c:forEach var="category" items="${categories}">
                                        <div class="option-item" onclick="moveSelectPage('${category.url}')">
                                            ${category.name}
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
                        <td class="board-user-info">
                            <span class="${sessionScope.loginUser != null && sessionScope.loginUser.userId == b.boardWriter ? 'highlight-user' : ''}">
                                ${b.boardWriter}
                            </span> 일반회원&nbsp
                        </td>
                        <td class="board-meta">
                            <span>${b.enrollDate}</span> | <span>조회 ${b.boardViews}</span>
                        </td>
                    </tr>
                </table>

                <div class="board-content-wrapper">
                    <div class="board-content">
                        <!-- 게시글 내용 -->
                        ${b.boardContent}
                    </div>

                    <!-- 답변 콘텐츠 -->
                    <c:forEach var="answer" items="${answers}">
                        <div class="board-content answer-content">
                            <div class="expert-container">
                                <%@ include file="/WEB-INF/views/common/expert_card.jsp"%>
                            </div>
                            <div class="response-section">
                                <div class="expert-response">${answer.content}</div>
                                <div class="disclaimer-container">
                                    <div class="response-disclaimer">* 본 답변은 참고용입니다.</div>
                                    <div class="right-aligned-buttons">
                                        <button class="like-button" onclick="incrementLike(${answer.id})">👍
                                            <span id="like-count-${answer.id}">${answer.likes}</span>
                                        </button>
                                        <button class="white-button">신고하기</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <%@ include file="/WEB-INF/views/common/comments.jsp"%>
        </div>
        <div class="empty-space"></div>
    </main>

    <footer>
        <%@ include file="/WEB-INF/views/common/main_footer.jsp"%>
    </footer>

    <script src="${ pageContext.servletContext.contextPath }/resources/js/community_board_detail.js"></script>
</body>

</html>
