<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/community_main_allpost.css">
    <title>모든 게시글</title>
</head>

<body>
    <div class="community-container">
          <!-- Header Section -->
        <header class="header">
            <%@ include file="/WEB-INF/views/common/FinalHeader.jsp" %>
        </header>

        <!-- Main Content Section -->
        <main class="main-content">
            <!-- Category Navigation -->
            <nav class="category-navigation">
                <a href="/popular.html" class="category-button">인기</a>
                <a href="/free.html" class="category-button">자유</a>
                <a href="/medical.html" class="category-button">의료 소통</a>
                <a href="/event.html" class="category-button">이벤트</a>
            </nav>
            <section class="popular-posts">
                <div class="posts-header">
                    <span class="posts-title">전체 게시글</span>
                </div>
                <section class="post-list">
                    <!-- Example Post Item -->
                    <a href="/post-detail.html?id=1" class="post-item">
                        <div class="post-category-label">이벤트</div>
                        <p class="post-title">2024 수능 기념 스마일 라식 할인!</p>
                        <div class="post-author">관리자1</div>
                        <div class="post-comments">[65]</div>
                    </a>
                    <a href="/post-detail.html?id=2" class="post-item">
                        <div class="post-category-label">의료소통</div>
                        <p class="post-title">상처에 된장 바르면 치료가 되나요?</p>
                        <div class="post-author">이게 되나</div>
                        <div class="post-comments">[135]</div>
                    </a>
                    <a href="/post-detail.html?id=3" class="post-item">
                        <div class="post-category-label">일반</div>
                        <p class="post-title">점심 메뉴 추천 해주세요 맛있는거 먹고 싶어요</p>
                        <div class="post-author">배고파</div>
                        <div class="post-comments">[45]</div>
                    </a>
                    <a href="/post-detail.html?id=4" class="post-item">
                        <div class="post-category-label">일반</div>
                        <p class="post-title">길에서 눕고 싶어요</p>
                        <div class="post-author">mingdi0824</div>
                        <div class="post-comments">[80]</div>
                    </a>
                    <a href="/post-detail.html?id=5" class="post-item">
                        <div class="post-category-label">의료소통</div>
                        <p class="post-title">짜장면은 건강식이 맞을까요?</p>
                        <div class="post-author">paris3131</div>
                        <div class="post-comments">[77]</div>
                    </a>
                    <a href="/post-detail.html?id=5" class="post-item">
                        <div class="post-category-label">의료소통</div>
                        <p class="post-title">짜장면은 건강식이 맞을까요?</p>
                        <div class="post-author">paris3131</div>
                        <div class="post-comments">[77]</div>
                    </a>
                    <a href="/post-detail.html?id=5" class="post-item">
                        <div class="post-category-label">의료소통</div>
                        <p class="post-title">짜장면은 건강식이 맞을까요?</p>
                        <div class="post-author">paris3131</div>
                        <div class="post-comments">[77]</div>
                    </a>
                    <a href="/post-detail.html?id=5" class="post-item">
                        <div class="post-category-label">의료소통</div>
                        <p class="post-title">짜장면은 건강식이 맞을까요?</p>
                        <div class="post-author">paris3131</div>
                        <div class="post-comments">[77]</div>
                    </a>
                    <a href="/post-detail.html?id=5" class="post-item">
                        <div class="post-category-label">의료소통</div>
                        <p class="post-title">짜장면은 건강식이 맞을까요?</p>
                        <div class="post-author">paris3131</div>
                        <div class="post-comments">[77]</div>
                    </a>

                </section>
        </main>
        <!-- Pagination Footer -->
        <footer class="pagination-footer">
            <div class="pagination">
                <span>1</span> <span>..</span> <span>4</span>
            </div>
            <button class="write-button">글쓰기</button>
        </footer>

    </div>
</body>

</html>