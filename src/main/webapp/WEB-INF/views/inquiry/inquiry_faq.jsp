<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/defalut.css">
            <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/inquiry/inquiry_notification.css">
            <title>Customer Center</title>
        </head>

        <body>
            <div>
                <!-- Header Section -->
                <header class="header">
                    <%@ include file="/WEB-INF/views/common/main_header.jsp" %>
                </header>

                <div class="container">
                    <!-- Main Content Section -->
                    <main class="main-content">
                        <!-- Sidebar Menu -->
                        <aside class="sidebar">

                            <ul class="menu">
                                <li><a href="#">공지사항<span class="arrow">›</span></a></li>
                                <li><a href="#">알림판<span class="arrow">›</span></a></li>
                                <li><a href="#" class="active">FAQ<span class="arrow">›</span></a></li>
                                <li><a href="#">Q&A<span class="arrow">›</span></a></li>
                            </ul>
                            <div class="support-box">
                                <p class="support-text">도움이 필요하신가요?</p>
                                <a href="#" class="support-link">1:1 문의하기</a>
                            </div>
                        </aside>


                        <!-- Content Section -->
                        <section class="notice-content">
                            <div class="content-header">
                                <h2 class="content-title">FAQ</h2>
                                <!-- 모바일 버전에서만 보이도록 설정할 셀렉트 박스 -->
                                <select class="sort-select mobile-only" onchange="sortPosts(this.value)">
                                    <option value="조회수">조회수</option>
                                    <option value="번호순">번호순</option>
                                </select>
                            </div>
                            <div class="content-controls">
                                <p class="content-description">닥터링에게 자주 묻는 질문입니다.</p>
                                <!-- 웹 버전에서만 보이도록 설정할 셀렉트 박스 -->
                                <select class="sort-select web-only" onchange="sortPosts(this.value)">
                                    <option value="조회수">조회수</option>
                                    <option value="작성일">작성일</option>
                                    <option value="카테고리순">카테고리순</option>
                                </select>
                            </div>
                            <!-- Table for Posts -->
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
                                    <!-- Example Post Item -->
                                    <tr>
                                        <td>회원관련</td>
                                        <td><a href="/post-detail.html?id=1">회원가입은 어떻게 하나요?</a></td>
                                        <td class="author">관리자</td>
                                        <td class="date">2023.11.01</td>
                                        <td class="comment-header">30</td>
                                    </tr>

                                    <tr>
                                        <td>회원관련</td>
                                        <td><a href="/post-detail.html?id=1">아이디, 비밀번호를 분실했어요!</a></td>
                                        <td class="author">관리자</td>
                                        <td class="date">2023.12.01</td>
                                        <td>32</td>
                                    </tr>
                                    
                                    <tr>
                                        <td>회원관련</td>
                                        <td><a href="/post-detail.html?id=1">회원탈퇴는 어디서 하나요?</a></td>
                                        <td class="author">관리자</td>
                                        <td class="date">2024.01.01</td>
                                        <td class="comment-header">31</td>
                                    </tr>

                                    <tr>
                                        <td>사이트 이용</td>
                                        <td><a href="/post-detail.html?id=1">모바일 사용법이 궁금해요</a></td>
                                        <td class="author">관리자</td>
                                        <td class="date">2024.02.01</td>
                                        <td>66</td>
                                    </tr>
                                    
                                    <tr>
                                        <td>사이트 이용</td>
                                        <td><a href="/post-detail.html?id=1">마이페이지는 어디에 있나요?</a></td>
                                        <td class="author">관리자</td>
                                        <td class="date">2024.03.01</td>
                                        <td class="comment-header">32</td>
                                    </tr>

                                    <tr>
                                        <td>사이트 이용</td>
                                        <td><a href="/post-detail.html?id=1">저에게 꼭 맞는 정보를 찾고싶어요</a></td>
                                        <td class="author">관리자</td>
                                        <td class="date">2024.04.01</td>
                                        <td>33</td>
                                    </tr>
                                    
                                    <tr>
                                        <td>사이트 이용</td>
                                        <td><a href="/post-detail.html?id=1">조회수는 어디서 볼 수 있나요?</a></td>
                                        <td class="author">관리자</td>
                                        <td class="date">2024.05.01</td>
                                        <td class="comment-header">34</td>
                                    </tr>

                                    <tr>
                                        <td>커뮤니티</td>
                                        <td><a href="/post-detail.html?id=1">커뮤니티는 어떤 공간인가요?</a></td>
                                        <td class="author">관리자</td>
                                        <td class="date">2024.06.01</td>
                                        <td>35</td>
                                    </tr>
                                    
                                    <tr>
                                        <td>커뮤니티</td>
                                        <td><a href="/post-detail.html?id=1">커뮤니티에 글을 올리고 싶어요.</a></td>
                                        <td class="author">관리자</td>
                                        <td class="date">2024.07.01</td>
                                        <td class="comment-header">36</td>
                                    </tr>

                                    <tr>
                                        <td>커뮤니티</td>
                                        <td><a href="/post-detail.html?id=1">커뮤니티에 작성한 글을 삭제할 수 있나요?</a></td>
                                        <td class="author">관리자</td>
                                        <td class="date">2024.08.01</td>
                                        <td>37</td>
                                    </tr>
                                    
                                    <tr>
                                        <td>커뮤니티</td>
                                        <td><a href="/post-detail.html?id=1">삭제된 글/댓글을 복구할 수 있나요?</a></td>
                                        <td class="author">관리자</td>
                                        <td class="date">2024.09.01</td>
                                        <td class="comment-header">38</td>
                                    </tr>

                                    <tr>
                                        <td>커뮤니티</td>
                                        <td><a href="/post-detail.html?id=1">작성한 댓글을 삭제할 수 있나요?</a></td>
                                        <td class="author">관리자</td>
                                        <td class="date">2024.10.01</td>
                                        <td>39</td>
                                    </tr>
                                    
                                    <tr>
                                        <td>이벤트</td>
                                        <td><a href="/post-detail.html?id=1">회원이 아닌 사람도 이벤트에 참여할 수 있나요?</a></td>
                                        <td class="author">관리자</td>
                                        <td class="date">2024.11.01</td>
                                        <td class="comment-header">40</td>
                                    </tr>

                                    <tr>
                                        <td>이벤트</td>
                                        <td><a href="/post-detail.html?id=1">이벤트 신청만 하면 되나요?</a></td>
                                        <td class="author">관리자</td>
                                        <td class="date">2024.12.01</td>
                                        <td>41</td>
                                    </tr>
                                    

                                    <!-- Additional rows as needed -->
                                </tbody>
                            </table>
                            <!-- 페이지네이션과 검색 섹션을 포함하는 div -->
                            <div class="page-search-container">
                                <!-- Pagination Footer -->
                                <footer class="pagination-footer">
                                    <div class="pagination">
                                        <a href="?page=1">1</a>
                                        <a href="?page=2">2</a>
                                        <a href="?page=3">3</a>
                                        <a href="?page=4">4</a>
                                        <a href="?page=5">5</a>
                                    </div>
                                    <button class="write-button">글쓰기</button>
                                </footer>
                                <!-- 검색 필드 섹션 -->
                                <div class="search-section">
                                    <select class="search-type">
                                        <option value="title">제목만</option>
                                        <option value="author">글작성자</option>
                                        <option value="content">댓글내용</option>
                                    </select>
                                    <input type="text" class="search-input" placeholder="검색어를 입력해주세요" />
                                    <button class="search-button">검색</button>
                                </div>
                            </div>

                        </section>
                        <div class="empty-space"></div> <!-- 오른쪽 빈 공간 -->
                    </main>
                    <!-- JavaScript 코드 추가 -->
                    <script>
                        function parseDate(dateStr) {
                            const [year, month, day] = dateStr.split(".");
                            return new Date(year, month - 1, day);
                        }

                        function extractNumber(text) {
                            return parseInt(text.replace(/[^0-9]/g, ''), 10);
                        }

                        function sortPosts(sortBy) {
                            const table = document.getElementById("postsTable");
                            const rows = Array.from(table.getElementsByTagName("tr")).slice(1);

                            rows.sort((a, b) => {
                                let tdA, tdB;

                                if (sortBy === "조회수") {
                                    tdA = extractNumber(a.getElementsByTagName("td")[4].innerText);
                                    tdB = extractNumber(b.getElementsByTagName("td")[4].innerText);
                                    return tdB - tdA; // 내림차순
                                } else if (sortBy === "작성일") {
                                    tdA = parseDate(a.getElementsByTagName("td")[3].innerText);
                                    tdB = parseDate(b.getElementsByTagName("td")[3].innerText);
                                    return tdB - tdA; // 내림차순
                                } else {
                                    tdA = a.getElementsByTagName("td")[0].innerText;
                                    tdB = b.getElementsByTagName("td")[0].innerText;
                                    return tdA.localeCompare(tdB, 'ko'); // 가나다순
                                }
                            });

                            rows.forEach(row => table.getElementsByTagName("tbody")[0].appendChild(row));
                        }
                    </script>