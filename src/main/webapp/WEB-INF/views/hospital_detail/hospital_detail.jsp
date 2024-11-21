<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/hospital_detail/hospital_detail.css">

    <!-- JS -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a013e1a252e3b3abf4367f97dc7d23f"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/common/kakaomap.js"></script>
</head>
<body>
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
	
    <!-- inform -->
    <div class="hospital_detail_wrapper">
        <div class="hospital_detail_status">
            <button class="hospital_detail_btn1">진료중</button>
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
                    <img src="${ pageContext.servletContext.contextPath }/resources/img/call.png" alt="call">
                </div>
                <div class="hospital_detail_home">
                    <img src="${ pageContext.servletContext.contextPath }/resources/img/home.png" alt="home">
                </div>
            </div>
            <div class="hospital_detail_share">
                공유하기
            </div>
        </div>
        <div class="hospital_detail_map_wrapper">
            <div class="hospital_detail_location">
                위치정보
            </div>
            <div class="hospital_detail_map" id="map">
           		<script>
           		window.onload = kakaoInit('${h.hosLatitude}','${h.hosLongitude}')
           		</script>
            </div>
        </div>
        <div class="hospital_detail_outline_wrapper">
            <div class="hospital_detail_outline">
                병원 개요
            </div>
            <div class="hospital_detail_introduce">
                병원 소개
            </div>
            <div class="hospital_detail_introduce_content">
                ${hInfo.hosInfo }
            </div>
            <div class="hospital_detail_notice">
                <div>
                    [[[[[ 병원 이전 안내 ]]]]]
                    <br>
                    ~~~~~~
                    <br>
                    ~~~~~~~~~~~~~~~~
                    <br>
                    ~~~~~~~~~
                    <br>
                    ~~~~~~~~~~~~~~
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