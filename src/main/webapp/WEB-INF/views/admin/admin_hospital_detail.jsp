<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Hospital Management Detail</title>
     <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/hospital_management_detail.css">
    
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/admin_header.jsp"/>

<div class="hospital-management">
    <h2>병원관리</h2>

    <div class="hospital-info">
        <table>
            <tr>
                <th>병원명</th>
                <td>${hospital.hosName}</td>
            </tr>
            <tr>
                <th>병원아이디</th>
                <td>${hospital.hosNo}</td>
            </tr>
            <tr>
                <th>병원비밀번호</th>
                <td>******</td> <!-- 보안상 표시되지 않음 -->
            </tr>
            <tr>
                <th>전화번호</th>
                <td>${hospital.hosTel}</td>
            </tr>
            <tr>
                <th>진료과목</th>
                <td>${hospital.department}</td>
            </tr>
            <tr>
                <th>진료시간</th>
                <td>
                    <p>월~금: ${hospital.hosStartTime1} ~ ${hospital.hosEndTime1}</p><br>
                    <p>토~일: ${hospital.hosStartTime2} ~ ${hospital.hosEndTime2}</p>
                </td>
            </tr>
            <tr>
                <th>주소</th>
                <td>
                    <input type="text" value="${hospital.hosAddress}">
                </td>
            </tr>
            <tr>
                <th>소개내용</th>
                <td>${hospital.hosInfo}</td>
            </tr>
            <tr>
                <th>당직 의사</th>
                <td>
                    <input type="text" value="${hospital.hosOnduty}">
                </td>
            </tr>
            <tr>
                <th>주차장 수</th>
                <td>
                    <input type="text" value="${hospital.hosParking}">
                </td>
            </tr>
        </table>
        <button class="save-button">저장하기</button>
    </div>
</div>

</body>
</html>
