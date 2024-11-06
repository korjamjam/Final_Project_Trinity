<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/Mobile_Community_Main.css">
    <title>Mobile Community</title>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const postItems = Array.from(document.querySelectorAll(".post-item"));
            const postListContainer = document.querySelector(".post-list");

            function updatePostDisplay() {
                // 화면 너비에 따라 게시글 수 결정
                const isMobile = window.innerWidth < 768;
                const postsToShow = isMobile ? 10 : 5;

                // 기존 게시글 숨기기
                postItems.forEach((post, index) => {
                    if (index < postsToShow) {
                        post.style.display = "flex"; // flex로 표시
                    } else {
                        post.style.display = "none"; // 나머지 게시글은 숨김
                    }
                });
            }

            // 초기 게시글 설정 및 윈도우 크기 변화에 따른 업데이트
            updatePostDisplay();
            window.addEventListener("resize", updatePostDisplay);
        });
    </script>
</head>

<body>
    <div class="community-container">
        <!-- Header Section -->
        <header class="header">
            <div class="logo-container">
                <img src="../img/Doctoring.png" alt="주사기 아이콘" class="icon">
                <div class="logo-text">닥터링</div>
            </div>
            <img src="" alt="Header Image">
        </header>

        <!-- Main Content Section -->
        <main class="main-content">
            <!-- Category Navigation -->
            <nav class="category-navigation">
                <a href="/popular.html" class="category-button">인기글</a>
                <a href="/free.html" class="category-button">자유게시판</a>
                <a href="/medical.html" class="category-button">메디톡</a>
                <a href="/event.html" class="category-button">이벤트</a>
            </nav>

            <!-- Post Section -->
            <section class="popular-posts">
                <div class="posts-header">
                    <span class="posts-title">실시간 인기글</span>
                    <!-- "더보기" 링크에 Mobile_Community_Main_AllPost.html 페이지로 이동하도록 설정 -->
                    <a href="" class="view-more-link">더보기 &gt;&gt;</a>

                </div> <!-- Header Row (1440px 이상에서만 보임) -->
                <div class="header-row">
                    <div class="category-header">카테고리</div>
                    <div class="title-header">제목</div>
                    <div class="author-header">작성자</div>
                    <div class="date-header">작성일</div>
                    <div class="views-header">조회수</div>
                </div>
                

                <!-- Post List -->
                <div class="post-list">
                    <!-- Example Post Item -->
                    <a href="/post-detail.html?id=1" class="post-item">
                        <div class="post-category-label">이벤트</div>
                        <p class="post-title">2024 수능 기념 스마일 라식 할인!</p>
                        <div class="post-author">관리자1</div>
                        <div class="post-date">2024-10-24</div>
                        <div class="post-comments">[65]</div>
                    </a>
                    <a href="/post-detail.html?id=2" class="post-item">
                        <div class="post-category-label">의료소통</div>
                        <p class="post-title">상처에 된장 바르면 치료가 되나요?</p>
                        <div class="post-author">이게 되나</div>
                        <div class="post-date">2024-10-24</div>
                        <div class="post-comments">[135]</div>
                    </a>
                    <a href="/post-detail.html?id=3" class="post-item">
                        <div class="post-category-label">일반</div>
                        <p class="post-title">점심 메뉴 추천 해주세요 맛있는거</p>
                        <div class="post-author">배고파</div>
                        <div class="post-date">2024-10-24</div>
                        <div class="post-comments">[45]</div>
                    </a>
                    <a href="/post-detail.html?id=4" class="post-item">
                        <div class="post-category-label">일반</div>
                        <p class="post-title">길에서 눕고 싶어요</p>
                        <div class="post-author">mingdi0824</div>
                        <div class="post-date">2024-10-24</div>
                        <div class="post-comments">[80]</div>
                    </a>
                    <a href="/post-detail.html?id=5" class="post-item">
                        <div class="post-category-label">의료소통</div>
                        <p class="post-title">짜장면은 건강식이 맞을까요?</p>
                        <div class="post-author">paris3131</div>
                        <div class="post-date">2024-10-24</div>
                        <div class="post-comments">[77]</div>
                    </a>
                    <a href="/post-detail.html?id=5" class="post-item">
                        <div class="post-category-label">의료소통</div>
                        <p class="post-title">짜장면은 건강식이 맞을까요?</p>
                        <div class="post-author">paris3131</div>
                        <div class="post-date">2024-10-24</div>
                        <div class="post-comments">[77]</div>
                    </a>
                    <a href="/post-detail.html?id=5" class="post-item">
                        <div class="post-category-label">의료소통</div>
                        <p class="post-title">짜장면은 건강식이 맞을까요?</p>
                        <div class="post-author">paris3131</div>
                        <div class="post-date">2024-10-24</div>
                        <div class="post-comments">[77]</div>
                    </a>
                    <a href="/post-detail.html?id=5" class="post-item">
                        <div class="post-category-label">의료소통</div>
                        <p class="post-title">짜장면은 건강식이 맞을까요?</p>
                        <div class="post-author">paris3131</div>
                        <div class="post-date">2024-10-24</div>
                        <div class="post-comments">[77]</div>
                    </a>
                    <a href="/post-detail.html?id=5" class="post-item">
                        <div class="post-category-label">의료소통</div>
                        <p class="post-title">짜장면은 건강식이 맞을까요?</p>
                        <div class="post-author">paris3131</div>
                        <div class="post-date">2024-10-24</div>
                        <div class="post-comments">[77]</div>
                    </a>
                </div>
            </section>
            <!-- Pagination Footer -->
            <footer class="pagination-footer">
                <div class="pagination">
                    <a href="?page=1">1</a>
                    <a href="?page=2">2</a>
                    <a href="?page=3">3</a>
                    <a href="?page=4">4</a>
                </div>
                <button class="write-button">글쓰기</button>
            </footer>
        </main>
    </div>
</body>

</html>