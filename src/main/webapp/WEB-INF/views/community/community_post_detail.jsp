<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <% // 테스트 목적으로 세션에 loggedInUser 값을 설정 session.setAttribute("loggedInUser", "jjhim531" ); %>

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
                                        <span>게시판</span> &gt;
                                        <select class="board-category-select" onchange="location = this.value;">
                                            <option value="freeboard.jsp" selected>실시간 인기글</option>
                                            <option value="notice.jsp">자유 게시판</option>
                                            <option value="qna.jsp">메디톡</option>
                                            <option value="discussion.jsp">이벤트 게시판</option>
                                        </select>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="board-title">상처에 된장 바르면 치료가 되나요?</td>
                                </tr>
                                <tr>
                                    <td class="board-user-info">jjhim531 일반회원</td>
                                    <td class="board-meta">
                                        <span>2024.11.06 16:18</span> | <span>조회 149</span>
                                    </td>
                                </tr>
                            </table>

                            <div class="board-content-wrapper">
                                <div class="board-content question-content">
                                    <!-- 게시글 내용 -->
                                    <div class="question-detail">
                                        까스활명수를 냉장보관했는데 실온보관이 낫다고 하더라구요. <br>
                                        ...
                                    </div>
                                    <!-- 첨부파일 섹션 include -->
                                    <%@ include file="/WEB-INF/views/common/attached_files.jsp" %>
                                </div>

                                <div class="board-content answer-content">
                                    <div class="expert-container">
                                        <div class="expert-card">
                                            <div class="expert-photo">
                                                <img src="${pageContext.servletContext.contextPath}/resources/img/doctor.jpg"
                                                    alt="의사아이콘">
                                            </div>
                                            <div class="expert-info-summary">
                                                <div class="expert-name">
                                                    <h2>김민한</h2>
                                                    <p class="small-text">사원약국</p>
                                                </div>
                                                <div class="expert-name">
                                                    <h6>전문분야 : &nbsp;</h6>
                                                    <p class="small-text"> 내과, 편도염</p>
                                                </div>
                                                <p>
                                                    총답변: <span class="total-answers">2158</span> | <span
                                                        class="score">⭐⭐⭐</span>
                                                </p>
                                            </div>
                                            <!-- Action Buttons -->
                                            <div class="action-buttons">
                                                <button class="white-button">상담</button>
                                            </div>
                                        </div>

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
                                                <button class="like-button" onclick="incrementLike(this)">👍 <span id="like-count">123</span></button>
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
                </script>

                <footer>
                    <%@ include file="/WEB-INF/views/common/main_footer.jsp" %>
                </footer>
            </body>

            </html>