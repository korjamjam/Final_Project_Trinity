<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>건강검진 예약확인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/account/reservationconfirmation.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Header -->
    <%@ include file="../common/main_header.jsp" %>

    <div class="layout-container">
        <!-- Sidebar -->
        <aside class="profile-sidemenu">
            <%@ include file="../account/mysidebar.jsp" %>
        </aside>

        <!-- Main Content -->
        <main class="profile-container">
            <h2>건강검진 예약확인</h2>

            <!-- 건강검진 예약 데이터 처리 -->
            <c:choose>
                <c:when test="${not empty healthReservations}">
                    <c:forEach var="healthReservation" items="${healthReservations}">
                        <div class="reservation-item">
                            <h3>건강검진 예약 번호: ${healthReservation.healthResNo}</h3>
                            <div class="input-group">
                                <label>병원이름</label>
                                <input type="text" name="hosName" value="${healthReservation.hosName}" disabled>
                            </div>
                            <div class="input-group">
                                <label>병원 주소</label>
                                <input type="text" name="hosAddress" value="${healthReservation.hosAddress}" disabled>
                            </div>
                            <div class="input-group">
                                <label>검진자명</label>
                                <input type="text" name="patientName" value="${healthReservation.patientName}" disabled>
                            </div>
                            <div class="input-group">
                                <label>검진자 생년월일</label>
                                <input type="text" name="patientBirthday" value="${healthReservation.patientBirthday}" disabled>
                            </div>
                            <div class="input-group">
                                <label>검진 날짜</label>
                                <input type="text" name="resDate" value="${healthReservation.resDate}" disabled>
                            </div>
                            <div class="input-group">
                                <label>검진 시간</label>
                                <input type="text" name="resTime" value="${healthReservation.resTime}" disabled>
                            </div>
                            <div class="input-group">
                                <label>검진 내용</label>
                                <textarea name="resComment" disabled>${healthReservation.resComment}</textarea>
                            </div>
                            <!-- 예약취소 버튼 추가 -->
                            <button class="cancel-btn" onclick="cancelHealthReservation('${healthReservation.healthResNo}')">예약 취소</button>
                        </div>
                        <hr />
                    </c:forEach>

                    <!-- 예약취소 JavaScript -->
                    <script>
                        function cancelHealthReservation(healthResNo) {
                            if (confirm("이 예약을 취소하시겠습니까?")) {
                                location.href = `${pageContext.request.contextPath}/healthReservation/cancel?healthResNo=` + healthResNo;
                            }
                        }
                    </script>

                </c:when>
                <c:otherwise>
                    <div class="reservation-item">
                        <h3>건강검진 예약 데이터가 없습니다.</h3>
                        <div class="input-group">
                            <label>병원이름</label>
                            <input type="text" name="hosName" value="-" disabled>
                        </div>
                        <div class="input-group">
                            <label>병원 주소</label>
                            <input type="text" name="hosAddress" value="-" disabled>
                        </div>
                        <div class="input-group">
                            <label>검진자명</label>
                            <input type="text" name="patientName" value="-" disabled>
                        </div>
                        <div class="input-group">
                            <label>검진자 생년월일</label>
                            <input type="text" name="patientBirthday" value="-" disabled>
                        </div>
                        <div class="input-group">
                            <label>검진 날짜</label>
                            <input type="text" name="resDate" value="-" disabled>
                        </div>
                        <div class="input-group">
                            <label>검진 시간</label>
                            <input type="text" name="resTime" value="-" disabled>
                        </div>
                        <div class="input-group">
                            <label>검진 내용</label>
                            <textarea name="resComment" disabled>-</textarea>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </main>
    </div>

    <!-- Footer -->
    <%@ include file="../common/main_footer.jsp" %>
</body>
</html>
