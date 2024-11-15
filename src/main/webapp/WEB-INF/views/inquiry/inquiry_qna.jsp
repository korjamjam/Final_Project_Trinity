<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/common/default.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/inquiry/inquiry_qna.css">
    <title>Customer Center</title>
</head>

<body>
    <div class="main-page">
        <header>
            <%@ include file="/WEB-INF/views/common/main_header.jsp"%>
        </header>

        <div class="container">
            <main class="main-content">
                <%@ include file="/WEB-INF/views/inquiry/inquiry_sidemenu.jsp"%>

                <section class="notice-content">
                    <div class="content-header">
                        <h2 class="content-title">Q&A</h2>
                    </div>
                    <div class="content-controls">
                        <p class="content-description">닥터링 사이트 이용 관련 질문 게시판입니다.</p>
                    </div>

                    <!-- Toggle buttons for Inquiry Form and Inquiry List -->
                    <div class="inquiry-buttons">
                        <button class="onebyone" onclick="showInquiryForm()">1:1 문의하기</button>
                        <button class="myinquiry" onclick="showInquiryList()">내 문의내역</button>
                    </div>

                    <!-- Inquiry Form (Initially hidden) -->
                    <div id="inquiryWriteForm" class="inquiry-write-form" style="display: none; padding-top: 10px;">
                        <h3>1:1 문의 작성</h3>
                        <form action="submitInquiry" method="post">
                            <div class="form-group">
                                <label for="inquiryType">문의 유형</label>
                                <select id="inquiryType" name="inquiryType">
                                    <option value="회원/정보관리">회원/정보관리</option>
                                    <option value="사이트이용">사이트이용</option>
                                    <option value="커뮤니티">커뮤니티</option>
                                    <option value="이벤트">이벤트</option>
                                    <option value="예약">예약</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="title">제목</label>
                                <input type="text" id="title" name="title" maxlength="50" required />
                            </div>
                            <div class="form-group">
                                <label for="content">내용</label>
                                <textarea id="content" name="content" rows="5" maxlength="500" required></textarea>
                            </div>
                            <div class="form-buttons">
                                <button type="button" onclick="hideInquiryForm()" class="cancel-button">취소</button>
                                <button type="submit" class="submit-button">저장</button>
                            </div>
                        </form>
                    </div>

                    <!-- Inquiry List Table -->
                    <table id="postsTable" class="notice-table">
                        <thead>
                            <tr>
                                <th class="title-number">번호</th>
                                <th class="category-header">카테고리</th>
                                <th class="title-header">제목</th>
                                <th class="author-header">작성자</th>
                                <th class="date-header">작성일</th>
                                <th class="comment-header">조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>회원관련</td>
                                <td><a href="/post-detail.html?id=1">질문 있습니다1</a></td>
                                <td class="author">jjhim531</td>
                                <td class="date">2023.07.27</td>
                                <td class="comment-header">44</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>회원관련</td>
                                <td><a href="/post-detail.html?id=1">질문 있습니다1</a></td>
                                <td class="author">jjhim531</td>
                                <td class="date">2023.07.27</td>
                                <td class="comment-header">44</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>회원관련</td>
                                <td><a href="/post-detail.html?id=1">질문 있습니다1</a></td>
                                <td class="author">jjhim531</td>
                                <td class="date">2023.07.27</td>
                                <td class="comment-header">44</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>회원관련</td>
                                <td><a href="/post-detail.html?id=1">질문 있습니다1</a></td>
                                <td class="author">jjhim531</td>
                                <td class="date">2023.07.27</td>
                                <td class="comment-header">44</td>
                            </tr>
                        </tbody>
                    </table>

                    <!-- Pagination and Search (Initially visible) -->
                    <div id="pageSearchContainer" class="page-search-container">
                        <footer class="pagination-footer">
                            <div class="pagination">
                                <a href="?page=1">1</a> <a href="?page=2">2</a> <a href="?page=3">3</a>
                            </div>
                        </footer>
                        <div class="search-section">
                            <select class="search-type">
                                <option value="title">제목만</option>
                                <option value="author">글작성자</option>
                                <option value="content">카테고리</option>
                            </select>
                            <input type="text" class="search-input" placeholder="검색어를 입력해주세요" />
                            <button class="search-button">검색</button>
                        </div>
                    </div>
                </section>

                <div class="empty-space"></div>
            </main>
        </div>

        <footer>
            <%@ include file="/WEB-INF/views/common/main_footer.jsp"%>
        </footer>

        <script>
            function showInquiryForm() {
                document.getElementById('inquiryWriteForm').style.display = 'block';
                document.getElementById('postsTable').style.display = 'none';
                document.getElementById('pageSearchContainer').style.display = 'none';
            }

            function showInquiryList() {
                document.getElementById('inquiryWriteForm').style.display = 'none';
                document.getElementById('postsTable').style.display = 'table';
                document.getElementById('pageSearchContainer').style.display = 'flex';
            }

            function hideInquiryForm() {
                showInquiryList();
            }
        </script>
    </div>
</body>
</html>
