<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>병원 의사 관리</title>
     <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/member_management_detail.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/hospital_detail/hospital_account_header.jsp" />

<div class="member-management">
    <h2>병원 의사 관리</h2>
    <div class="member-info">
    <form action="${pageContext.servletContext.contextPath}/admin/updateMember" method="post">
    			<input type="hidden" name="userNo" value="${member.userNo}" />
        <table>
            <tr>
                <th>프로필 이미지</th>
                <td>
                    <c:choose>
                        
                        <c:when test="${not empty doctor.userProfile}">
                            <img src="${pageContext.servletContext.contextPath}/${doctor.userProfile}" 
                                 alt="프로필 이미지" 
                                 style="width: 100px; height: 100px; object-fit: cover;" />
                        </c:when>
                        
                        <c:otherwise>
                            등록된 사진이 없습니다
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <th>이름</th>
                <td>${doctor.userName}</td>
            </tr>
            <tr>
                <th>아이디</th>
                <td>${doctor.userId}</td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>${doctor.email}</td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td>${doctor.phone}</td>
            </tr>
            <tr>
                <th>생년월일</th>
                <td>${doctor.birthday}</td>
            </tr>
            <tr>
                <th>성별</th>
                <td>${doctor.gender}</td>
            </tr>
            <tr>
    			<th>우편번호</th>
    			<td><input type="text" name="postcode" value="${doctor.postcode}" /></td>
			</tr>
			<tr>
    			<th>주소</th>
    			<td>
        			<input type="text" name="address" value="${doctor.address}" />
    			</td>
			</tr>
            <tr>
                <th>평점</th>
                <td>(4.5)</td>
            </tr>
            <tr>
                <th>리뷰 보기</th>
                <td>(보기 버튼)</td>
            </tr>
        </table>
        </form>
        <button  onclick="deleteDoctor()" class="save-button">의사 해제</button>
    </div>
</div>
    <script>
        const userNo = "${doctor.userNo}"
        console.log(userNo)
        function deleteDoctor() {
            const isDelete = confirm("정말 삭제하시겠습니까?")
            console.log(isDelete)

            if(isDelete){
                location.href="${pageContext.servletContext.contextPath}/hospital/account/doctor/delete?userNo=${doctor.userNo}"
            } else{
                onload
            }
        }
    </script>
</body>
</html>
