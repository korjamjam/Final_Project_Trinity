<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>닥터링</title>

    <!-- searchBar icon -->
    <link rel="favicon" href="${ pageContext.servletContext.contextPath }/resources/img/favicon.ico" />
    <link rel="icon" href="${ pageContext.servletContext.contextPath }/resources/img/favicon.ico" type="image/x-icon" />
    
    <!-- font style -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!-- icon -->
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

    <!-- css -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/hospital_detail/hospital_detail.css">

    <!-- JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a013e1a252e3b3abf4367f97dc7d23f"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/common/kakaomap.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/hospital_detail/hospital_detail.js"></script>
    <script>
        let contextPath = "${ pageContext.servletContext.contextPath }";
    </script>

</head>
<body onload="initHospitalDetail('${hospitalInfo.hosLatitude}', '${hospitalInfo.hosLongitude}');">
    <!-- Header -->
	<jsp:include page="/WEB-INF/views/common/main_header.jsp" />
    
    <br><br>
	<div class="hospital_detail_page_wrapper">
    <div class="hospital_detail_event_wrapper">
        <!-- event -->
        <div class="hospital_detail_event_img">
            <img src="" id="commercial">
        </div>
    </div>
    <input type="hidden" id="writerNo" value="${loginUser.userNo }">
    <input type="hidden" id="writerName" value="${loginUser.userName }">
    <input type="hidden" id="writerProfile" value="${loginUser.userProfile }">
    <input type="hidden" id="hosStartTime1" value="${hospitalInfo.hosStartTime1 }">
    <input type="hidden" id="hosEndTime1" value="${hospitalInfo.hosEndTime1 }">
    <!-- inform -->
    <div class="hospital_detail_wrapper">
        <div class="hospital_detail_status">
            <button class="hospital_detail_btn1">진료중</button>
            <button class="hospital_detail_btn3">진료종료</button>
            <button class="hospital_detail_btn2" data-toggle="modal" data-target="#viewWaitingModal" onclick="getTodayWaitingList()">대기자 수 확인하기</button>
        </div>
        
        <input type="hidden" id="hosNo" value="${hospitalInfo.hosNo}">
        <!-- viewWaiting Modal -->
        <div class="modal fade" id="viewWaitingModal" role="dialog">
            <div class="modal-dialog">
            
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">당일 예약 정보</h4>
                    </div>
                    <div class="modal-body" style="justify-content: space-around !important;">
                        <div class="waitingNavi"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                    </div>
                </div>
            
            </div>
        </div>
            
        <div class="hospital_detail_subject">
            ${hospitalInfo.department }
        </div>
        <div class="hospital_detail_name">
            ${hospitalInfo.hosName }
        </div>
        <div class="hospital_detail_address">
            ${hospitalInfo.hosAddress}
        </div>
        <div class="hospital_detail_time">
            ${hospitalInfo.hosStartTime1} ~ ${hospitalInfo.hosEndTime1}
        </div>
        <div class="hospital_detail_tag">
            <button>어린이 국가예방접종</button>
            <button>영유아 검진</button>
            <button>주차장</button>
        </div>

        <div class="hospital_detail_goto">
            <div class="hospital_detail_btn_wrapper">
                <div class="hospital_detail_call">
                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#callModal">
                        <img src="${ pageContext.servletContext.contextPath }/resources/img/call.png" id="hosTel" alt="call" onclick="call()">
                    </button>
                </div>

                <!-- Call Modal -->
                <div class="modal fade" id="callModal" role="dialog">
                    <div class="modal-dialog">
                    
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">병원 전화번호</h4>
                            </div>
                            <div class="modal-body">
                            <p>${hospitalInfo.hosTel }</p>
                            <input type="hidden" id="copyTel" value="${hospitalInfo.hosTel }">
                            <button id="copy_btn" onclick="copyTel()">복사하기</button>
                            </div>
                            <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                            </div>
                        </div>
                    
                    </div>
                </div>

                <div class="hospital_detail_home">
                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#HomeModal">
                        <img src="${ pageContext.servletContext.contextPath }/resources/img/home.png" id="hosHome" alt="home">
                    </button>
                </div>

                <!-- Homepage Modal -->
                <div class="modal fade" id="HomeModal" role="dialog">
                    <div class="modal-dialog">
                    
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">병원 홈페이지</h4>
                            </div>
                            <div class="modal-body">
                            <p>등록된 홈페이지가 없습니다.</p>
                            </div>
                            <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                            </div>
                        </div>
                    
                    </div>
                </div>
            </div>
            
            <div class="hospital_detail_share">
                <button type="button" id="hospital_detail_share" class="btn btn-info btn-lg" data-toggle="modal" data-target="#ShareModal">
                    공유하기
                </button>
            </div>

            <!-- Share Modal -->
            <div class="modal fade" id="ShareModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">현재 페이지 공유하기</h4>
                        </div>
                        <div class="modal-body">
                            <p>http://localhost:7777/trinity/hospital/detail?hosNo=${hospitalInfo.hosNo }</p>
                            <input type="hidden" id="shareAddress" value="http://localhost:7777/trinity/hospital/detail?hosNo=${hospitalInfo.hosNo }">
                            <button id="copy_btn" onclick="copyAddress()">복사하기</button>
                        </div>
                        <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="hospital_detail_map_wrapper">
            <div class="hospital_detail_location">
                위치정보
            </div>
            <div class="hospital_detail_map" id="map">
            </div>
        </div>
        <div class="hospital_detail_outline_wrapper">
            <div class="hospital_detail_outline">
                병원 개요
            </div>
            <div class="hospital_detail_introduce">
                병원 소개
            </div>
            <br>
            <div class="hospital_detail_notice">
                <div>
                    <c:set var="intro" value="${hospitalInfo.hosInfo }" />
                    <c:choose>
                        <c:when test="${intro == null}">
                            병원 소개가 없습니다.
                        </c:when>
                        <c:otherwise>
                            ${hospitalInfo.hosInfo }
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <div class="hospital_detail_doctor_wrapper">
            <div class="hospital_detail_doctor_review">
                의사 리뷰
            </div>
            <div class="hospital_detail_doctor_row_wrapper">
                <c:forEach var="i" items="${doctorList}" varStatus="status">
                    <div class="hospital_detail_doctor_row">
                        <div class="hospital_detail_doctor_intro">
                            <div class="hospital_detail_doctor_img">
                                <img src="${ pageContext.servletContext.contextPath }${doctorList[status.index].userProfile}" alt="docPic">
                            </div>
                            <div class="hospital_detail_doctor_name">
                                이름 : ${i.userName}<br>
                                <c:choose>
                                    <c:when test="${rating[status.index] != 0}">
                                        <img src="${ pageContext.servletContext.contextPath }/resources/img/star.png" alt="star">
                                        ${rating[status.index]}
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${ pageContext.servletContext.contextPath }/resources/img/whiteStar.png" alt="star">
                                        평가가 존재하지 않습니다.
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="hospital_detail_doctor_detail">
                            <div class="hospital_detail_share">
                                <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#backgroundModal" onclick="getDoctorBiography('${i.userNo}')">
                                    약력보기
                                </button>
                            </div>

                            <!-- background Modal -->
                            <div class="modal fade" id="backgroundModal" role="dialog">
                                <div class="modal-dialog">
                                
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">약력</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="biographyNavi"></div>
                                    </div>
                                    <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                                    </div>
                                </div>
                                
                                </div>
                            </div>
                            <div class="hospital_detail_share">
                                <input type="hidden" id="${i.userNo}" value="${i.userNo}">
                                <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#showReviewModal" onclick="getDoctorReviews('${i.userNo}')" data-doctor-no="${i.userNo}">
                                    의사 리뷰보기
                                </button>
                            </div>

                            <!-- showReview Modal -->
                            <div class="modal fade" id="showReviewModal" role="dialog">
                                <div class="modal-dialog">
                                
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">의사 리뷰</h4>
                                    </div>
                                    <div class="modal-body modal-body-review">
                                        <div class="reviewNavi"></div>
                                    </div>
                                    <div class="modal-footer reviewFooter">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                                        <button type="button" class="btn btn-default" id="listReview" onclick="writeReview()">댓글 달기</button>
                                    </div>
                                </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <input type="hidden" id="curTime" value="${curTime}">
        <div class="hospital_detail_goto_res">
            <button onclick="location.href='${pageContext.request.contextPath}/reservation/gForm?hosNo=${hospitalInfo.hosNo }&curTime='+ getTime()">당일 예약</button>
            <button onclick="location.href='${pageContext.request.contextPath}/reservation/gForm?hosNo=${hospitalInfo.hosNo }'">사전 예약</button>
        </div>

    </div>
	</div>
    <!-- Footer -->
    <%@ include file="/WEB-INF/views/common/main_footer.jsp"%>

</body>
</html>