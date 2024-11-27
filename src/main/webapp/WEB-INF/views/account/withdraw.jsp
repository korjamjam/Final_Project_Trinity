<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원탈퇴</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/account/withdraw.css">
</head>
<body>
    <!-- Header -->
    <%@ include file="../common/main_header.jsp"%>

    <div class="container">
        <h2>회원탈퇴</h2>
        <p>정말로 회원탈퇴를 진행하시겠습니까?</p>
        <p>탈퇴 시 모든 정보가 삭제되며 복구가 불가능합니다.</p>

        <!-- 에러 메시지 표시 -->
        <c:if test="${not empty errorMessage}">
            <p class="error-message">${errorMessage}</p>
        </c:if>

        <form action="${pageContext.servletContext.contextPath}/member/withdraw" method="post">
            <input type="password" name="password" placeholder="비밀번호 입력" required>
            <button type="submit" class="btn btn-danger">탈퇴하기</button>
            <a href="${pageContext.servletContext.contextPath}/member/profile_edit" class="btn btn-cancel">취소</a>
        </form>
    </div>

    <!-- Footer -->
    <%@ include file="../common/main_footer.jsp"%>

    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        p {
            color: #666;
            margin-bottom: 20px;
            font-size: 14px;
        }
        .error-message {
            color: #e74c3c;
            font-weight: bold;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        input[type="password"] {
            width: 80%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }
        button.btn {
            width: 80%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 14px;
            cursor: pointer;
        }
        button.btn-danger {
            background-color: #e74c3c;
        }
        button.btn-danger:hover {
            background-color: #c0392b;
        }
        a.btn-cancel {
            margin-top: 10px;
            display: inline-block;
            text-decoration: none;
            background-color: #bdc3c7;
            color: #fff;
            padding: 10px;
            border-radius: 4px;
            width: 80%;
            text-align: center;
        }
        a.btn-cancel:hover {
            background-color: #95a5a6;
        }
    </style>
</body>
</html>
