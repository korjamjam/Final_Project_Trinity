<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ include file="sidebar.jsp" %>

            <!DOCTYPE html>
            <html lang="ko">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Doctoring Header</title>

                <link rel="stylesheet"
                    href="${pageContext.servletContext.contextPath}/resources/css/common/default.css">
                <link rel="stylesheet"
                    href="${pageContext.servletContext.contextPath}/resources/css/common/main_header_style.css">
                <link rel="stylesheet"
                    href="${pageContext.servletContext.contextPath}/resources/css/common/sidebar.css">
                <script src="${ pageContext.servletContext.contextPath }/resources/js/common/main_header.js"></script>
            </head>

            <body>


                <header class="header">
                    <div class="logo">
                        <img src="${pageContext.servletContext.contextPath}/resources/img/Doctoring.png" alt="주사기 아이콘"
                            class="icon">
                        <a href="${pageContext.request.contextPath}/main" class="logo-text">닥터링</a>
                    </div>
                    <nav class="nav-links">
                        <div class="dropdown">
                            <a href="${pageContext.request.contextPath}/hospital/list">병원찾기</a>
                        </div>
                        <div class="dropdown">
                            <a href="#">종합예약</a>
                            <div class="dropdown-content">
                                <a href="${pageContext.request.contextPath}/reservation/gForm">진료예약</a>
                                <a href="${pageContext.request.contextPath}/healthReservation/vaccinepage1">백신예약</a>
                                <a
                                    href="${pageContext.request.contextPath}/healthReservation/reservationSearch">예약확인</a>
                            </div>
                        </div>
                        <div class="dropdown">
                            <a href="${pageContext.request.contextPath}/healthReservation/guide">건강검진</a>
                            <div class="dropdown-content">
                                <a href="${pageContext.request.contextPath}/healthReservation/reservation1">국가 검진 예약</a>
                                <a href="${pageContext.request.contextPath}/healthReservation/guide">검진 예약 안내</a>
                                <a href="${pageContext.request.contextPath}/healthReservation/infoNomal">검진 절차 예약</a>
                                <a href="https://www.nhis.or.kr/nhis/index.do" target="_blank">검진 결과 조회</a>
                                <a href="${pageContext.request.contextPath}/healthReservation/itemsInfo">검사 항목 정보</a>
                            </div>
                        </div>
                        <div class="dropdown">
                            <a href="${pageContext.request.contextPath}/community/main">커뮤니티</a>
                            <div class="dropdown-content">
                               <a href="${pageContext.request.contextPath}/community/main">인기 게시글</a>

                                <a href="${pageContext.servletContext.contextPath}/community/main?categoryId=CAT01"
                                    id="free">자유게시판</a>
                                <a href="${pageContext.servletContext.contextPath}/community/main?categoryId=CAT02"
                                    id="meditalk">메디톡</a>
                                <a href="${pageContext.servletContext.contextPath}/community/main?categoryId=CAT03"
                                    id="event">이벤트게시판</a>
                            </div>
                        </div>
                        <div class="dropdown">
                            <a href="${pageContext.servletContext.contextPath}/inquiry/main?categoryId=CAT04">고객문의</a>
                            <div class="dropdown-content">
                                <a href="${pageContext.servletContext.contextPath}/inquiry/main?categoryId=CAT04">공지사항</a>
                                <a href="${pageContext.servletContext.contextPath}/inquiry/main?categoryId=CAT05">알림판</a>
                                <a href="${pageContext.servletContext.contextPath}/inquiry/main?categoryId=CAT06">FAQ</a>
                                <a href="${pageContext.servletContext.contextPath}/inquiry/main?categoryId=CAT07">Q&A</a>
                            </div>
                        </div>
                        
                    </nav>
                    <div class="login-menu">
                        <c:choose>

                            <c:when test="${empty loginUser}">
                                <div class="login-logo">
                                    <a href="${pageContext.request.contextPath}/member/login">로그인</a>
                                </div>
                                <%-- <a href="${pageContext.request.contextPath}/member/sign_up">회원가입</a>--%>
                                    <div class="menu-icon">&#9776;</div>
                            </c:when>
                            <c:otherwise>
                                <%--<label>${loginUser.userName}님 환영합니다.</label>--%>
                                    <a href="${pageContext.request.contextPath}/member/profile_edit">
                                        <img src="${pageContext.servletContext.contextPath}/resources/img/MyPageIcon.png"
                                            alt="마이페이지 아이콘" class="mypage-icon"
                                            href="${pageContext.request.contextPath}/member/logout"></a>
                                    <%--<a href="${pageContext.request.contextPath}/member/logout"></a>--%>
                                        <div class="menu-icon" id="sidebar headerSidebarHospitalDetailModify">&#9776;</div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </header>


            </body>

            </html>