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

<script>
    const message = "${message}";
    if (message) {
        alert(message); // 안내 문구를 띄움
        console.log(message)
    }
</script>
<div class="hospital-management">
    <h2>병원 관리</h2>

    <div class="hospital-info">
        <form action="${ pageContext.servletContext.contextPath }/hospital/account/myHospital/update" method="post" onsubmit="return confirmAndSubmit();">
            <input type="hidden" name="hosNo" value="${hosInfo.hosNo}">
            <table>
                <tr>
                    <th>병원명</th>
                    <td>${hosInfo.hosName}</td>
                </tr>
                <tr>
                    <th>병원아이디</th>
                    <td>${hosInfo.hosId}</td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td>
                        <input type="text" name="hosTel" value="${hosInfo.hosTel}">
                    </td>
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
                        <input type="text" id="hosAddress" name="hosAddress" value="${hosInfo.hosAddress}">
                    </td>
                </tr>
                <tr>
                    <th>소개내용</th>
                    <td>
                        <input type="text" name="hosInfo" value="${hosInfo.hosInfo}">
                    </td>
                </tr>
            </table>
            <button class="save-button">저장하기</button>
        </form>
    </div>
</div>
    <script>
    async function confirmAndSubmit() {
        const userConfirmed = confirm("수정하시겠습니까?");
        if (!userConfirmed) {
            return false;
        }
    }
    </script>
</body>
</html>
