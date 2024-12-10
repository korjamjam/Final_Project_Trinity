<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HospitalAccount Main Page</title>
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/admin_main_page.css">    
</head>
<body>
	<!-- 메시지 알림 -->
	<script>
	        const message = "${message}";
	        if (message) {
	            alert(message); // 안내 문구를 띄움
                console.log(message)
	        }
	</script>
	<jsp:include page="/WEB-INF/views/hospital_detail/hospital_account_header.jsp" />
    <main class="admin-container">
        <button class="admin-button" onClick="location.href='${ pageContext.servletContext.contextPath }/hospital/account/doctor'">
            <img src="${ pageContext.servletContext.contextPath }/resources/img/MemberManagement_img.png" alt="회원관리 아이콘">
            <p>의사관리</p>
        </button>
        <button class="admin-button" onClick="location.href='${ pageContext.servletContext.contextPath }/hospital/account/myHospital'">
            <img src="${ pageContext.servletContext.contextPath }/resources/img/HospitalManagement_img.png" alt="병원관리 아이콘">
            <p>병원관리</p>
        </button>
        <button class="admin-button" onClick="location.href='${ pageContext.servletContext.contextPath }/hospital/account/myReservation'">
            <img src="${ pageContext.servletContext.contextPath }/resources/img/ReservationManagement_img.png" alt="예약관리 아이콘">
            <p>예약관리</p>
        </button>
        <button class="admin-button" onClick="location.href='${ pageContext.servletContext.contextPath }/hospital/account/myPost'">
            <img src="${ pageContext.servletContext.contextPath }/resources/img/PostManagement_img.png" alt="게시글관리 아이콘">
            <p>이벤트 게시글관리</p>
        </button>
    </main>
</body>

</html>


<jsp:include page="/WEB-INF/views/hospital_detail/hospital_account_side_bar.jsp" />