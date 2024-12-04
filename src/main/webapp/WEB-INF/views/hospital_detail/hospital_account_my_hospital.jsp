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
    <h2>회원관리</h2>

    <div class="hospital-info">
    <!-- DB연동 후 수정 -->
        <table>
            <tr>
                <th>병원 사진</th>
                <td>이미지.jpg</td>
            </tr>
            <tr>
                <th>병원명</th>
                <td>밝은소아과</td>
            </tr>
            <tr>
                <th>병원아이디</th>
                <td>hos01</td>
            </tr>
            <tr>
                <th>병원비밀번호</th>
                <td>hospass01</td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>hos01@light.com</td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td>02-1234-5678</td>
            </tr>
            <tr>
                <th>등록일</th>
                <td>2014-10-12</td>
            </tr>
            <tr>
                <th>진료시간</th>
                <td>
                    <p>월~금: AM 09:00 ~ PM 06:00</p><br>
                    <p>토~일: AM 09:00 ~ PM 02:00</p>
                </td>
            </tr>
            <tr>
                <th>우편번호</th>
                <td><input type="text" value="06025"></td>
            </tr>
            <tr>
                <th>주소</th>
                <td>
                    <input type="text" value="서울특별시 강남구 논현로158길 15 (신사동) ANGEM 빌딩">
                    <input type="text" value="1층 101호">
                </td>
            </tr>
            <tr>
                <th>소개내용</th>
                <td>모든 아이들이 건강해지기를 바라는 밝은 소아과 입니다.</td>
            </tr>
            <tr>
                <th>병원 인증</th>
                <td>
                    <select>
                        <option value="인증">인증</option>
                        <option value="승인">비인증</option>
                    </select>
                </td>
            </tr>
        </table>
        <button class="save-button">저장하기</button>
    </div>
</div>

</body>
</html>
