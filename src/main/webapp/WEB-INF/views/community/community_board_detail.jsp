<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!DOCTYPE html>
            <html lang="ko">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link rel="stylesheet"
                    href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
                <link href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_public.css"
                    rel="stylesheet">
                <link rel="stylesheet"
                    href="${ pageContext.servletContext.contextPath }/resources/css/community/community_post_detail.css">
                <link href="${ pageContext.servletContext.contextPath }/resources/css/common/comments.css"
                    rel="stylesheet">
                <link href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_dropdown.css"
                    rel="stylesheet">
                <title>게시글 상세 페이지</title>
            </head>

            <body>
                <!-- Header Section -->
                <header>
                    <%@ include file="/WEB-INF/views/common/main_header.jsp" %>
                </header>

                <main class="main-content">
                    <!-- Sidebar Menu -->
                    <div class="sidemenu">
                        <%@ include file="/WEB-INF/views/community/community_sidemenu.jsp" %>
                    </div>

                    <!-- Board Container -->
                    <div class="board-container-wrapper">
                        <div class="navigation-buttons">
                            <div class="left-section">
                                <td class="board-actions">
                                    <!-- 글쓴이일 경우 수정 및 삭제 버튼 -->
                                    <c:if test="${sessionScope.loggedInUser == 'jjhim531'}">
                                        <button class="white-button" onclick="location.href='editPost.jsp'">수정</button>
                                        <button class="white-button" onclick="deletePost()">삭제</button>
                                    </c:if>
                                </td>
                            </div>
                            <div class="right-section navigation-links">
                                <button class="round-button" id="custom-round-button">목록 보기</button>
                                <div class="nav-links-group">
                                    <span class="nav-text">&laquo; 이전글</span>
                                    <span class="nav-text">다음글 &raquo;</span>
                                </div>
                            </div>
                        </div>

                        <div class="board-container">
                            <!-- 게시글 상세 정보 -->
                            <table class="board-detail">
                                <tr>
                                    <!-- Breadcrumb Navigation -->
                                    <td class="breadcrumb">
                                        <span>게시판 &nbsp</span> &gt;
                                        <!-- Custom Dropdown -->
                                        <div class="custom-dropdown">
                                            <div class="selected-container">
                                                <!-- 현재 게시글의 카테고리를 서버에서 받아와서 표시 -->
                                                <div class="selected-option"
                                                    onclick="showAndHide('#community-options')">
                                                    ${currentCategory} <!-- 서버에서 현재 카테고리를 받아와 표시 -->
                                                </div>
                                                <div class="dropdown-arrow">▼</div>
                                            </div>
                                            <div class="option-list" id="community-options">
                                                <div class="option-item" onclick="moveSelectPage('community_main.me')">
                                                    실시간 인기글</div>
                                                <div class="option-item" onclick="moveSelectPage('community_free.me')">
                                                    자유 게시판</div>
                                                <div class="option-item"
                                                    onclick="moveSelectPage('community_medical.me')">메디톡</div>
                                                <div class="option-item" onclick="moveSelectPage('community_event.me')">
                                                    이벤트 게시판</div>
                                            </div>
                                        </div>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="board-title">${b.boardTitle}</td>
                                </tr>
                                <tr>
                                    <td class="board-user-info">${b.boardWriter} 일반회원</td>
                                    <td class="board-meta">
                                        <span> ${b.enrollDate}</span> | <span>조회 149</span>
                                    </td>
                                </tr>
                            </table>

                            <div class="board-content-wrapper">
                                <div class="board-content question-content">
                                    <!-- 게시글 내용 -->
                                    <div class="question-detail">
                                         ${b.boardContent} <br>
                                        ...
                                    </div>
                                    <!-- 첨부파일 섹션 include -->
                                    <c:if test="${not empty attachedFiles}">
                                        <%@ include file="/WEB-INF/views/common/attached_files.jsp" %>
                                    </c:if>
                                </div>

                                <div class="board-content answer-content">
                                    <div class="expert-container">
                                        <%@ include file="/WEB-INF/views/common/expert_card.jsp" %>
                                    </div>
                                    <div class="response-section">
                                        <div class="expert-response">
                                            안녕하세요. 하이닥 상담약사 김민한입니다.<br>
                                            ...
                                        </div>
                                        <div class="disclaimer-container">
                                            <div class="response-disclaimer">
                                                * 본 답변은 참고용으로 의학적 판단이나 진료행위로 해석될 수 없습니다.
                                            </div>
                                            <div class="right-aligned-buttons">
                                                <button class="like-button" onclick="incrementLike(this)">👍 <span
                                                        id="like-count">123</span></button>
                                                <button class="white-button">신고하기</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%@ include file="/WEB-INF/views/common/comments.jsp" %>
                    </div>
                    <div class="empty-space"></div>
                </main>

                <script>
                    function deletePost() {
                        if (confirm("정말로 이 게시글을 삭제하시겠습니까?")) {
                            alert("게시글이 삭제되었습니다.");
                            window.location.href = 'community.jsp'; // 삭제 후 리다이렉트
                        }
                    }

                    function showAndHide(selector) {
                        const el = document.querySelector(selector);
                        el.style.display = el.style.display === "block" ? "none" : "block";
                    }

                    function moveSelectPage(page) {
                        window.location.href = page;
                    }

                    document.addEventListener("DOMContentLoaded", function () {

                        // 드롭다운 외부 클릭 시 닫기
                        document.addEventListener("click", (event) => {
                            if (!event.target.closest(".custom-dropdown")) {
                                document.querySelector(".option-list").style.display = "none";
                            }
                        });
                    });

                </script>

                <footer>
                    <%@ include file="/WEB-INF/views/common/main_footer.jsp" %>
                </footer>
            </body>

            </html>