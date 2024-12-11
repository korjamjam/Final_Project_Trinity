<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>병원 의사 관리</title>
    
    <!--CSS-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/hospital_detail/hospital_detail.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/member_management_detail.css">

    <!--JS-->
    <script src="${ pageContext.servletContext.contextPath }/resources/js/hospital_detail/hospital_detail.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script>
        let contextPath = "${ pageContext.servletContext.contextPath }";
    </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/hospital_detail/hospital_account_header.jsp" />

<div class="member-management">
    <h2>병원 의사 관리</h2>
    ${doctor}
    <div class="member-info">
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
    			<th>주소</th>
    			<td>${doctor.address}</td>
			</tr>
            <tr>
                <th>리뷰</th>
                <td>
                    <input type="hidden" id="doctorNo" value="${doctor.userNo}">
                    <button type="button" class="review-button" data-toggle="modal" data-target="#showReviewModal" onclick="getDoctorReviews()">
                        리뷰 조회
                    </button>

                    <!-- showReview Modal -->
                    <div class="modal fade" id="showReviewModal" role="dialog">
                        <div class="modal-dialog">
                        
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">의사 리뷰</h4>
                            </div>
                            <div class="modal-body">
                                <div class="reviewNavi"></div>
                            </div>
                            <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <button  onclick="deleteDoctor(`${doctor.userNo}`)" class="save-button">의사 해제</button>
    </div>
</div>
    <script>
        function deleteDoctor(userNo) {
            const isDelete = confirm("정말 삭제하시겠습니까?")
            console.log(isDelete)

            if(isDelete){
                location.href="${pageContext.servletContext.contextPath}/hospital/account/doctor/delete?userNo=userNo"
            } else{
                onload
            }
        }
    </script>
</body>
</html>
