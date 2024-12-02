<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
          href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
    <link rel="stylesheet"
          href="${ pageContext.servletContext.contextPath }/resources/css/inquiry/inquiry_notice.css">
    <title>Customer Center - 공지사항</title>
</head>

<body>
    <header>
        <%@ include file="/WEB-INF/views/common/main_header.jsp"%>
    </header>
    <div class="main-page">
        <!-- Header Section -->

        <div class="container">
            <!-- Main Content Section -->
            <main class="main-content">
                <!-- Sidebar Menu -->
                <%@ include file="/WEB-INF/views/inquiry/inquiry_sidemenu.jsp"%>

                <!-- Content Section -->
                <section class="notice-content">
                    <div class="content-header">
                        <h2 class="content-title">공지사항</h2>
                        <div class="content-mobile-button">
                            <!-- 모바일 버전에서만 보이도록 설정할 셀렉트 박스 -->
                            <select class="sort-select mobile-only"
                                    onchange="sortPosts(this.value)">
                                <option value="조회수">조회수</option>
                                <option value="번호순">번호순</option>
                            </select>
                            <button class="write-mobile-button">글쓰기</button>
                        </div>
                    </div>
                    <div class="content-controls">
                        <p class="content-description">고객센터의 공지사항을 확인하세요.</p>
                        <!-- 웹 버전에서만 보이도록 설정할 셀렉트 박스 -->
                        <div class="content-button">
                            <select class="sort-select web-only"
                                    onchange="sortPosts(this.value)">
                                <option value="조회수">조회수</option>
                                <option value="작성일">작성일</option>
                                <option value="번호순">번호순</option>
                            </select>
                            <button class="write-button">글쓰기</button>
                        </div>
                    </div>
                    <!-- Table for Posts -->
                    <table id="postsTable" class="notice-table">
                        <thead>
                            <tr>
                                <th class="category-header">번호</th>
                                <th class="title-header">제목</th>
                                <th class="author-header">작성자</th>
                                <th class="date-header">작성일</th>
                                <th class="comment-header">조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- 공지사항 데이터 출력 -->
                            <c:forEach var="board" items="${noticeList}">
                                <tr>
                                    <td>${board.boardNo}</td>
                                    <td><a href="/inquiry/notice/detail?boardNo=${board.boardNo}">${board.boardTitle}</a></td>
                                    <td>${board.boardWriter}</td>
                                    <td>${board.enrollDate.substring(0, 10)}</td> <!-- 날짜 문자열에서 앞부분만 출력 -->
                                    <td>${board.boardViews}</td>
                                </tr>
                            </c:forEach>
                            <!-- 공지사항이 없는 경우 -->
                            <c:if test="${empty noticeList}">
                                <tr>
                                    <td colspan="5">등록된 공지사항이 없습니다.</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </section>
                <div class="empty-space"></div>
                <!-- 오른쪽 빈 공간 -->
            </main>
        </div>
        <footer>
            <%@ include file="/WEB-INF/views/common/main_footer.jsp"%>
        </footer>
    </div>

    <!-- JavaScript 코드 -->
    <script>
        function parseDate(dateStr) {
            const [year, month, day] = dateStr.split("-");
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
</body>
</html>
