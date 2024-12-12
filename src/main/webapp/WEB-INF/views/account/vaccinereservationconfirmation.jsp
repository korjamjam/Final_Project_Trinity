<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>백신 예약확인</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/account/reservationconfirmation.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Header -->
    <%@ include file="../common/main_header.jsp" %>

    <!-- Flash 메시지가 있을 경우 alert 표시 -->
    <c:if test="${not empty errorMessage}">
        <script>
            alert("${errorMessage}");
        </script>
    </c:if>
    <c:if test="${not empty successMessage}">
        <script>
            alert("${successMessage}");
        </script>
    </c:if>

    <div class="layout-container">
        <!-- Sidebar -->
        <aside class="profile-sidemenu">
            <%@ include file="../account/mysidebar.jsp" %>
        </aside>

        <!-- Main Content -->
        <main class="profile-container">
            <h2>백신 예약확인</h2>

            <!-- 백신 예약 데이터 처리 -->
            <c:choose>
                <c:when test="${not empty reservations}">
                    <c:forEach var="vaccineReservation" items="${reservations}">
                        <div class="reservation-item">
                            <h3>백신 예약 번호: ${vaccineReservation.vresNo}</h3>
                            <div class="input-group">
                                <label>병원이름</label>
                                <input type="text" name="hosName" value="${vaccineReservation.hosNo}" disabled>
                            </div>
                            <div class="input-group">
                                <label>접종자명</label>
                                <input type="text" name="patientName" value="${vaccineReservation.patientName}" disabled>
                            </div>
                            <div class="input-group">
                                <label>접종자 생년월일</label>
                                <input type="text" name="patientBirthday" value="${vaccineReservation.patientBirthday}" disabled>
                            </div>
                            <div class="input-group">
                                <label>접종 날짜</label>
                                <input type="text" name="vresDate" value="${vaccineReservation.vresDate}" disabled>
                            </div>
                            <div class="input-group">
                                <label>접종 시간</label>
                                <input type="text" name="vresTime" value="${vaccineReservation.vresTime}" disabled>
                            </div>
                            <div class="input-group">
                                <label>백신 종류</label>
                                <input type="text" name="vaccineType" value="${vaccineReservation.vaccineType}" disabled>
                            </div>
                            <div class="input-group">
                                <label>특이 사항</label>
                                <textarea name="resContent" disabled>${vaccineReservation.resContent}</textarea>
                            </div>
                            <button class="cancel-btn" onclick="cancelReservation('${reservation.resNo}')">예약 취소</button>
                        </div>
                        <hr />
                    </c:forEach>
                    <script>
						function cancelReservation(resNo) {
							if (confirm("예약을 취소하시겠습니까?")) {
								// 예약 취소 요청 전송
								console.log("취소 요청 - 예약 번호: " + resNo); // 디버깅용
								location.href = `${pageContext.request.contextPath}/reservation/cancel?resNo=` + resNo;
							}
						}
					</script>
                </c:when>
                <c:otherwise>
                    <div class="reservation-item">
                        <h3>백신 예약 데이터가 없습니다.</h3>
                        <div class="input-group">
                            <label>병원이름</label>
                            <input type="text" name="hosName" value="-" disabled>
                        </div>
                        <div class="input-group">
                            <label>접종자명</label>
                            <input type="text" name="patientName" value="-" disabled>
                        </div>
                        <div class="input-group">
                            <label>접종자 생년월일</label>
                            <input type="text" name="patientBirthday" value="-" disabled>
                        </div>
                        <div class="input-group">
                            <label>접종 날짜</label>
                            <input type="text" name="vresDate" value="-" disabled>
                        </div>
                        <div class="input-group">
                            <label>접종 시간</label>
                            <input type="text" name="vresTime" value="-" disabled>
                        </div>
                        <div class="input-group">
                            <label>백신 종류</label>
                            <input type="text" name="vaccineType" value="-" disabled>
                        </div>
                        <div class="input-group">
                            <label>특이 사항</label>
                            <textarea name="resContent" disabled>-</textarea>
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
