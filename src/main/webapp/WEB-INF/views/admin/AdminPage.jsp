<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>

    <link rel="stylesheet" href="<%=path %>/resources/css/default/defalut.css">
    <link rel="stylesheet" href="<%=path %>/resources/css/admin/AdminMainPage.css">
    
</head>
<body>

    <main class="admin-container">
        <button class="admin-button">
            <img src="<%=path %>/resources/img/MemberManagement_img.png" alt="회원관리 아이콘">
            <span>회원관리</span>
        </button>
        <button class="admin-button">
            <img src="<%=path %>/resources/img/HospitalManagement_img.png" alt="병원관리 아이콘">
            <span>병원관리</span>
        </button>
        <button class="admin-button">
            <img src="<%=path %>/resources/img/ReservationManagement_img.png" alt="예약관리 아이콘">
            <span>예약관리</span>
        </button>
        <button class="admin-button">
            <img src="<%=path %>/resources/img/PostManagement_img.png" alt="게시글관리 아이콘">
            <span>게시글관리</span>
        </button>
    </main>
</body>

</html>