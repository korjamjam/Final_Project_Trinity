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
</head>
<body onload="initHospitalDetail('${h.hosLatitude}', '${h.hosLongitude}')">
    <!-- Header -->
	<%@ include file="/WEB-INF/views/common/main_header.jsp"%> 

    <br><br>
	<div class="hospital_detail_page_wrapper">
    <div class="hospital_detail_event_wrapper">

        <!-- event -->
        <div class="hospital_detail_event_img">
            이벤트 사진영역
        </div>
    </div>
	
    <input type="hidden" id="hosStartTime1" value="${h.hosStartTime1 }">
    <input type="hidden" id="hosEndTime1" value="${h.hosEndTime1 }">
    <!-- inform -->
    <div class="hospital_detail_wrapper">
        <div class="hospital_detail_status">
            <button class="hospital_detail_btn1">진료중</button>
            <button class="hospital_detail_btn3">진료종료</button>
            <button class="hospital_detail_btn2">대기자 수 확인하기</button>
        </div>
        <div class="hospital_detail_subject">
            ${h.department }
        </div>
        <div class="hospital_detail_name">
            ${h.hosName }
        </div>
        <div class="hospital_detail_address">
            ${h.hosAddress}
        </div>
        <div class="hospital_detail_time">
            ${h.hosStartTime1} ~ ${h.hosEndTime1}
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
                        <p>${h.hosTel }</p>
                        </div>
                        <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
            <!-- 여기부터 -->
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
                        <!-- http://localhost:7777/trinity/hospital/detail?hosNo=H44 -->
                        <p>http://localhost:7777/trinity/hospital/detail?hosNo=${h.hosNo }</p>
                        <input type="hidden" id="shareAddress" value="http://localhost:7777/trinity/hospital/detail?hosNo=${h.hosNo }">
                        <button id="copy_btn" onclick="copy()">복사하기</button>
                    </div>
                    <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
            <!-- <div class="hospital_detail_introduce_content">
                ${hInfo.hosInfo }
            </div> -->
            <div class="hospital_detail_notice">
                <div>
                    <c:set var="intro" value="${hInfo.hosInfo }" />
                    <c:choose>
                        <c:when test="${intro == null}">
                            병원 소개가 없습니다.
                        </c:when>
                        <c:otherwise>
                            ${hInfo.hosInfo }
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
                <div class="hospital_detail_doctor_row">
                    <div class="hospital_detail_doctor_intro">
                        <div class="hospital_detail_doctor_img">
                            <img src="${ pageContext.servletContext.contextPath }/resources/img/doc_lim.png" alt="doc1">
                        </div>
                        <div class="hospital_detail_doctor_name">
                            이름 : 임태형<br>
                            <img src="${ pageContext.servletContext.contextPath }/resources/img/star.png" alt="star">
                            9.6 (79)
                        </div>
                    </div>
                    <div class="hospital_detail_doctor_detail">
                        <button>약력보기</button>
                        <button>의사 리뷰보기</button>
                    </div>
                </div>
                <div class="hospital_detail_doctor_row">
                    <div class="hospital_detail_doctor_intro">
                        <div class="hospital_detail_doctor_img">
                            <img src="${ pageContext.servletContext.contextPath }/resources/img/doc_lee.png" alt="doc2">
                        </div>
                        <div class="hospital_detail_doctor_name">
                            이름 : 이자영<br>
                            <img src="${ pageContext.servletContext.contextPath }/resources/img/star.png" alt="star">
                            9.4 (37)
                        </div>
                    </div>
                    <div class="hospital_detail_doctor_detail">
                        <button>약력보기</button>
                        <button>의사 리뷰보기</button>
                    </div>
                </div>
                <div class="hospital_detail_doctor_row">
                    <div class="hospital_detail_doctor_intro">
                        <div class="hospital_detail_doctor_img">
                            <img src="${ pageContext.servletContext.contextPath }/resources/img/doc_lim.png" alt="doc1">
                        </div>
                        <div class="hospital_detail_doctor_name">
                            이름 : 임태형<br>
                            <img src="${ pageContext.servletContext.contextPath }/resources/img/star.png" alt="star">
                            9.6 (79)
                        </div>
                    </div>
                    <div class="hospital_detail_doctor_detail">
                        <button>약력보기</button>
                        <button>의사 리뷰보기</button>
                    </div>
                </div>
                <div class="hospital_detail_doctor_row">
                    <div class="hospital_detail_doctor_intro">
                        <div class="hospital_detail_doctor_img">
                            <img src="${ pageContext.servletContext.contextPath }/resources/img/doc_lee.png" alt="doc2">
                        </div>
                        <div class="hospital_detail_doctor_name">
                            이름 : 이자영<br>
                            <img src="${ pageContext.servletContext.contextPath }/resources/img/star.png" alt="star">
                            9.4 (37)
                        </div>
                    </div>
                    <div class="hospital_detail_doctor_detail">
                        <button>약력보기</button>
                        <button>의사 리뷰보기</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="hospital_detail_goto_res">
            <button onclick="">당일 시간 예약</button>
            <button onclick="location.href='${pageContext.request.contextPath}/reservation/gForm?hosNo=${h.hosNo }'">미래 시간 예약</button>
        </div>

    </div>
	</div>
    <!-- Footer -->
    <%@ include file="/WEB-INF/views/common/main_footer.jsp"%>

</body>
</html>