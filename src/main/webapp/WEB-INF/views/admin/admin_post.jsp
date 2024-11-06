<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Post Management</title>
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/default/defalut.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/post__management.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/admin_header.jsp">

<div class="post-management">

    <div class="content">
        <h2>게시글 관리</h2>
        <p class="total-post">총 게시글 수: 2</p>
        <div class="sort-dropdown">
            <select>
                <option value="전체">전체</option>
                <option value="인기">인기</option>
                <option value="자유">자유</option>
                <option value="의료소통">의료소통</option>
                <option value="이벤트">이벤트</option>
                <option value="Notice">Notice</option>
                <option value="FAQ">FAQ</option>
                <option value="Q&A">Q&A</option>

            </select>
        </div>

        <div class="post-list">
            <a href="#" class="post-item">
                <p>
                    <span>홍길동</span> 
                    <span>User01</span> 
                    <span>자유</span> 
                    <span>등록일: 2024-10-28</span>
                </p>
                <p class="post-title">이 병원은 가지마세요</p>
                <p>
                    <span>조회수: </span>
                    <span class="views">33</span>
                </p>
            </a>

            <a href="#" class="post-item">
                <p>
                    <span>김철수</span> 
                    <span>User02</span>
                    <span>의료소통</span> 
                    <span>등록일: 2024-10-29</span>
                </p>
                <p class="post-title">안녕하세요 궁금한 점이 있습니다.</p>
                <p>
                    <span>조회수: </span>
                    <span class="views">1</span>
                </p>
            </a>
        </div>
    </div>
</div>

</body>
</html>