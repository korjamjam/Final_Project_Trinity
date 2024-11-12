<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctoring Footer</title>

    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/main_footer_style.css">
    <link href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_public.css"
    rel="stylesheet">
    
</head>
<body>
<div class="comment-section-container">
    <div class="comment-header">
        <h3>전체 댓글 (4)</h3>
        <button onclick="toggleComments()" id="toggle-comments-button">
            댓글 닫기 <span id="arrow">&#9650;</span>
        </button>
    </div>
    <div class="comment-section-wrapper" id="comment-section">
        <table class="comment-section">
            <tr>
                <th>작성자</th>
                <th>댓글 내용</th>
                <th>작성일</th>
                <th>좋아요</th>
            </tr>
            <tr>
                <td>자연인</td>
                <td>너무 흥미로워요!</td>
                <td>2024-10-21</td>
                <td><button class="like-button" onclick="incrementLike(this)">👍 <span>10</span></button></td>
            </tr>
            <tr>
                <td>jjhim531</td>
                <td>저도 참고할게요ㅎㅎ</td>
                <td>2024-11-03</td>
                <td><button class="like-button" onclick="incrementLike(this)">👍 <span>25</span></button></td>
            </tr>
            <tr>
                <td>paris3131</td>
                <td>굳굳!!</td>
                <td>2024-11-03</td>
                <td><button class="like-button" onclick="incrementLike(this)">👍 <span>8</span></button></td>
            </tr>
        </table>
    </div>

    <div id="comment-form">
        <div class="comment-header">
            <div class="comment-user-info">
                <span>paris3131</span>
                <img src="${ pageContext.servletContext.contextPath }/resources/img/comment_camera.png" alt="camera">
            </div>
            <button class="round-button">댓글등록</button>
        </div>
        <textarea placeholder="댓글 작성"></textarea>
    </div>
</div>
<script>
    function incrementLike(button) {
        const likeCount = button.querySelector("span");
        const currentCount = parseInt(likeCount.textContent);
        likeCount.textContent = currentCount + 1;
    }

    function toggleComments() {
        const commentSection = document.getElementById("comment-section");
        const toggleButton = document.getElementById("toggle-comments-button");
        const arrow = document.getElementById("arrow");

        if (commentSection.style.display === "none" || commentSection.style.display === "") {
            commentSection.style.display = "block";
            toggleButton.innerHTML = '댓글 닫기 <span id="arrow">&#9650;</span>'; // 위쪽 화살표
        } else {
            commentSection.style.display = "none";
            toggleButton.innerHTML = '댓글 열기 <span id="arrow">&#9660;</span>'; // 아래쪽 화살표
        }
    }
</script>
</body>
</html>
