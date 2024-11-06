<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Member Management</title>
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/default/defalut.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/member_management.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/admin_header.jsp">

<div class="member-management">

    <div class="content">
        <h2>회원관리</h2>
        <p class="total-members">총 회원수: 2명</p>
        <div class="sort-dropdown">
            <select>
                <option value="전체">전체 보기</option>
                <option value="의료인">의료인</option>
                <option value="일반">일반</option>
            </select>
        </div>

        <div class="member-list">
            <a href="#" class="member-item">
                <p>
                    <span>홍길동</span> 
                    <span>User01</span> 
                    <span>의료인</span> 
                    <span>등록일: 2024-10-28</span>
                </p>
                <p>01012345678</p>
                <p>
                    <span>가입승인:</span>
                    <span class="status pending">대기</span>
                </p>
            </a>

            <a href="#" class="member-item">
                <span>김철수</span> 
                    <span>User02</span> 
                    <span>일반</span> 
                    <span>등록일: 2024-10-29</span>
                <p>01012345679</p>
                <p>
                    <span>가입승인:</span>
                    <span class="status active">승인</span>
                </p>
            </a>
        </div>
    </div>
</div>

</body>
</html>