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
    <jsp:include page="/WEB-INF/views/hospital_detail/hospital_account_header.jsp" />

<div class="hospital-management">
    <h2>병원 관리</h2>

    <div class="hospital-info">
    <!-- DB연동 후 수정 -->
        <table>
            <tr>
                <th>병원 사진</th>
                <td>이미지.jpg</td>
            </tr>
            <tr>
                <th>병원명</th>
                <td>${hosInfo.hosName}</td>
            </tr>
            <tr>
                <th>병원아이디</th>
                <td>${hosInfo.hosId}</td>
            </tr>
            <tr>
                <th>병원비밀번호</th>
                <td>${hosInfo.hosPwd}</td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td>${hosInfo.hosTel}</td>
            </tr>
            <tr>
                <th>개업일</th>
                <td>${hosInfo.hosYear}</td>
            </tr>
            <tr>
                <th>진료시간</th>
                <td>
                    <p>월~금: ${hosInfo.hosStartTime1} ~ ${hosInfo.hosEndTime1}</p><br>
                    <p>토~일: ${hosInfo.hosStartTime2} ~ ${hosInfo.hosEndTime2}</p>
                </td>
            </tr>
            <tr>
                <th>주소</th>
                <td>
	                ${hosInfo.hosAddress}
                </td>
            </tr>
            <tr>
                <th>소개내용</th>
                <td>${hosInfo.hosInfo}</td>
            </tr>
        </table>
        <button class="save-button">저장하기</button>
    </div>
</div>

</body>
</html>
