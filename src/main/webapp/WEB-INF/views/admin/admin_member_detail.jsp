<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <form action="${pageContext.servletContext.contextPath}/admin/updateMember" method="post">
    			<input type="hidden" name="userNo" value="${member.userNo}" />
        <table>
        	<!--
            <tr>
                <th>프로필 이미지</th>
                <td>이미지.jpg</td>
            </tr>
            -->
            <tr>
                <th>이름</th>
                <td>${member.userName}</td>
            </tr>
            <tr>
                <th>아이디</th>
                <td>${member.userId}</td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td>${member.userPwd}</td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>${member.email}</td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td>${member.phone}</td>
            </tr>
            <tr>
                <th>생년월일</th>
                <td>${member.birthday}</td>
            </tr>
            <tr>
                <th>성별</th>
                <td>${member.gender}</td>
            </tr>
            <tr>
    			<th>우편번호</th>
    			<td><input type="text" name="postcode" value="${member.postcode}" /></td>
			</tr>
			<tr>
    			<th>주소</th>
    			<td>
        			<input type="text" name="address" value="${member.address}" />
    			</td>
			</tr>
            <tr>
    			<th>회원가입일</th>
    			<td><fmt:formatDate value="${member.enrollDate}" pattern="yyyy-MM-dd" /></td>
			</tr>
            <tr>
                <th>회원탈퇴</th>
                <td>
                <!-- member.status -->
                    <select name="status">
            			<option value="N" ${member.status == 'N' ? 'selected' : ''}>N</option>
            			<option value="Y" ${member.status == 'Y' ? 'selected' : ''}>Y</option>
        			</select>
                </td>
            </tr>
            <tr>
                <th>권한</th>
                <td>
					<select name="isAdmin">
            			<option value="N" ${member.isAdmin == 'N' ? 'selected' : ''}>N</option>
            			<option value="Y" ${member.isAdmin == 'Y' ? 'selected' : ''}>Y</option>
        			</select>
                </td>                     
            </tr>
        </table>
        <button type="submit" class="save-button">저장하기</button>
        </form>
    </div>
</div>

</body>
</html>
