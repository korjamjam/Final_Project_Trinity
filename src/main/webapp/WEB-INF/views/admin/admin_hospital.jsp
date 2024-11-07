<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Hospital Management</title>
     <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/defalut.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/hospital_management.css">
    
</head>
<body>

<jsp:include page="/WEB-INF/views/admin/admin_header.jsp"/>

<div class="hospital-management">

    <div class="content">
        <h2>병원관리</h2>
        <p class="total-hospitals">등록된 병원수: 2</p>
        <div class="sort-dropdown">
            <select>
                <option value="전체">전체</option>
                <option value="주소">주소</option>
                <option value="이름">이름</option>
            </select>
        </div>

        <div class="hospital-list">
            <a href="#" class="hospital-item">
                <p>
                    <span>밝은소아과</span> 
                    <span>hos01</span> 
                    <span>등록일: 2014-10-28</span>
                </p>
                <p>주소: 강남구 테헤란로</p>
                <p>전화번호: 02-1234-5678</p>
            </a>

            <a href="#" class="hospital-item">
                <p>
                    <span>연세소아과</span> 
                    <span>hos02</span> 
                    <span>등록일: 2020-10-12</span>
                </p>
                <p>주소: 강남구 선릉로</p>
                <p>전화번호: 02-8765-4321</p>
            </a>
        </div>
    </div>
</div>

</body>
</html>