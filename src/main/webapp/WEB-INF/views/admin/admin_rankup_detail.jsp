<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Member Management Detail</title>
     <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/member_management_detail.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/admin_header.jsp"/>

<div class="member-management">
    <h2>회원관리</h2>

    <div class="member-info">
        <table>
            <tr>
                <th>이름</th>
                <td>홍길동</td>
            </tr>
            <tr>
                <th>아이디</th>
                <td>user01</td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>user01@kh.com</td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td>010-1234-5678</td>
            </tr>
            <tr>
                <th>신청과목</th>
                <td>rankup.subject</td>
            </tr>
            <tr>
                <th>성별</th>
                <td>Member.gender</td>
            </tr>
            <tr>
                <th>등업 신청 이미지</th>
                <td>Lic_Picture</td>
            </tr>

            <tr>
                <th>회원가입일</th>
                <td>2024-10-24</td>
            </tr>
            <tr>
                <th>권한</th>
                <td>
                    <select>
                        <option value="N">N</option>
                        <option value="A">A</option>
                        <option value="D">D</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>등업 신청</th>
                <td>
                    <select>
                        <option value="대기">대기</option>
                        <option value="승인">승인</option>
                    </select>
                </td>
            </tr>
        </table>
        <button class="save-button">저장하기</button>
    </div>
</div>

</body>
</html>
