<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>자유게시판</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="board-container">
        <h1>자유게시판</h1>
        <table class="board-table">
            <thead>
                <tr>
                    <th>작성자</th>
                    <th>제목</th>
                    <th>날짜</th>
                    <th>조회</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>jihim531</td>
                    <td>상처에 된장 바르면 치료가 되나요?</td>
                    <td>2024-11-06</td>
                    <td>149</td>
                </tr>
                <tr>
                    <td>자연인</td>
                    <td>너무 웃긴데요!</td>
                    <td>2024-10-21</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>jihim531</td>
                    <td>저도 참 궁금하네요ㅎㅎ</td>
                    <td>2024-11-03</td>
                    <td>11</td>
                </tr>
            </tbody>
        </table>
        <div class="comment-section">
            <input type="text" placeholder="댓글 작성" />
            <button>댓글 등록</button>
        </div>
    </div>
</body>
</html>
