<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Main Page</title>
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/admin_main_page.css">
    
    <script src="${ pageContext.servletContext.contextPath }/resources/js/admin/admin_main.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/admin_header.jsp" />
    <main class="admin-container">
        <button class="admin-button" onClick="location.href='member'">
            <img src="${ pageContext.servletContext.contextPath }/resources/img/MemberManagement_img.png" alt="회원관리 아이콘">
            <p>회원관리</p>
        </button>
        <button class="admin-button" onClick="location.href='hospital'">
            <img src="${ pageContext.servletContext.contextPath }/resources/img/HospitalManagement_img.png" alt="병원관리 아이콘">
            <p>병원관리</p>
        </button>
        <button class="admin-button" onClick="location.href='reservation'">
            <img src="${ pageContext.servletContext.contextPath }/resources/img/ReservationManagement_img.png" alt="예약관리 아이콘">
            <p>예약관리</p>
        </button>
        <button class="admin-button" onClick="location.href='post'">
            <img src="${ pageContext.servletContext.contextPath }/resources/img/PostManagement_img.png" alt="게시글관리 아이콘">
            <p>게시글관리</p>
        </button>
    </main>
</body>

</html>