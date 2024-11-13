<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판-글목록</title>
    <link rel="stylesheet" href="/css/boardList.css">
</head>
<body>

    <!-- Header Section -->
    <header class="header">
        <%@ include file="/WEB-INF/views/common/main_header.jsp" %>
    </header>
    
    <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2>게시판</h2>
         
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                        <th>첨부파일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="b" items="${list}">
                        <tr onclick="location.href = 'detail.bo?bno=${b.boardNo}'">
                            <td>${b.boardNo }</td>
                            <td>${b.boardTitle }</td>
                            <td>${b.boardWriter }</td>
                            <td>${b.count }</td>
                            <td>${b.createDate }</td>
                            <td>
                                <c:if test="${not empty b.originName }">
                                    ★
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <br>

            <div id="pagingArea">
                <ul class="pagination">
                    <c:choose>
                        <c:when test="${ pi.currentPage eq 1 }">
                            <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage - 1}">Previous</a></li>
                        </c:otherwise>
                    </c:choose>

                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                        <li class="page-item"><a class="page-link" href="list.bo?cpage=${p}">${p}</a></li>
                    </c:forEach>

                    <c:choose>
                        <c:when test="${ pi.currentPage eq pi.maxPage }">
                            <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage + 1}">Next</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>

            <br clear="both"><br>

            <form id="searchForm" action="searchList.bo" method="get" align="center">
                <div class="select">
                    <select class="custom-select" name="condition">
                        <option value="writer">작성자</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                </div>
                <div class="text">
                    <input type="text" class="form-control" name="keyword">
                </div>
                <button type="submit" class="searchBtn btn btn-secondary">검색</button>
            </form>
            <br><br>
        </div>
        <br><br>
    </div>
    
    <!-- Footer -->
    <%@ include file="/WEB-INF/views/common/main_footer.jsp" %>

</body>
</html>
