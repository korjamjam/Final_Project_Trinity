<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="KR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검진 전날 주의사항</title>
    
     <!-- css -->
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/health_reservation/caution_guide.css">
    
</head>
<body>
	
	<!-- header -->
	<jsp:include page="../common/main_header.jsp"/>
    <div class="caution_wrap">
        <div class="caution_guide_container">
            <div class="caution_title">
                검진 전 주의사항
            </div>
            <div class="caution_guide_select">
                <select name="" id="caution_guide_select" onchange="window.open(value,'_self');">
                    <option value="" disabled hidden selected>건강검진 전날</option>
                    <option value="${pageContext.request.contextPath}/healthReservation/guideDday">건강검진 당일</option>
                    <option value="${pageContext.request.contextPath}/healthReservation/guideEndo">위/대장내시경</option>
                    <option value="${pageContext.request.contextPath}/healthReservation/guideCt">CT/MRI</option>
                </select>
            </div>
            <div id="caution_guide_title">
                건강검진 전날
            </div>
            <div class="caution_guide_content_wrap">
                <div class="caution_guide_content">
                    <div class="caution_guide_content_img">
                        <img src="${ pageContext.servletContext.contextPath }/resources/img/caution_guide_evening1.png" alt="">
                    </div>
                    <div class="caution_guide_content_text">
                        <div id="caution_guide_content_title">
                            금식
                        </div>
                        <ul>
                            <li>
                                건강검진 2~3일 전부터는 음주, 기름진음식은 피하십시오.
                            </li>
                            <li>
                                오전검진 : 검진 전날 저녁식사는 오후 7시까지 가볍게 드시고 밤9시 이후부터 금식하십시오.
                            </li>
                            <li>
                                오후검진 : 검진 전날 밤 12시 이후부터 금식하십시오.
                            </li>
                            <li>
                                금식 기간 중에는 물, 껌, 사탕, 담배는 절대 금합니다.
                            </li>
                        </ul>
                        
                    </div>
                </div>
                <div class="caution_guide_content">
                    <div class="caution_guide_content_img">
                        <img src="${ pageContext.servletContext.contextPath }/resources/img/caution_guide_evening2.png" alt="">
                    </div>
                    <div class="caution_guide_content_text">
                        <div id="caution_guide_content_title">
                            약물
                        </div>
                        <ul>
                            <li>
                                평소 복용하시는 약은 가급적 2~3일전부터 드시지 마십시오.
                            </li>
                            <li>
                                항혈전제(아스피린, 플라빅스 등)를 복용하시는 분은 내시경 조직검사 또는 용종을 제거 시 출혈의 위험이 있으므로 주치의에게 확인 후 일주일 전부터 복용을 중단합니다.
                            </li>
                            <li>
                                단, 뇌출혈, 혈전증, 심장질환, 폐질환을 앓고 있거나 최근 3개월 이내 수술 및 입원치료를 받은 분은 출혈 위험성을 높일 수 있는 약물을 중지해도 무방한지 반드시 주치의에게 확인 후 검사여부를 결정하십시오.
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="caution_guide_content">
                    <div class="caution_guide_content_img">
                        <img src="${ pageContext.servletContext.contextPath }/resources/img/caution_guide_evening3.png" alt="">
                    </div>
                    <div class="caution_guide_content_text">
                        <div id="caution_guide_content_title">
                            여성(추가)
                        </div>
                        <ul>
                            <li>
                                생리중인 경우 검사 내용에 제한이 있을 수 있습니다.
                            </li>
                            <li>
                                가임기의 모든 여성은 검진 예약 전 반드시 임신여부 확인하여 주십시오.
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="caution_guide_content">
                    <div class="caution_guide_content_img">
                        <img src="${ pageContext.servletContext.contextPath }/resources/img/caution_guide_evening4.png" alt="">
                    </div>
                    <div class="caution_guide_content_text">
                        <div id="caution_guide_content_title">
                            대변
                        </div>
                        <ul>
                            <li>
                                대변채취는 건강검진 전날 또는 당일 채변용기에 밤알 크기 정도(용기의 1/3정도)를 넣어 주십시오.

                            </li>
                            <li>
                                채취하신 대변은 검사의 정확도를 높이기 위해 차고 서늘하게 보관해 주십시오.
    
                            </li>
                            <li>
                                생리중에는 생리혈이 섞이지 않도록 주의 하십시오.
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="reservation_btn_area">
                <button id="reservation_btn" onclick="location.href='${pageContext.request.contextPath}/healthReservation/reservation1'">
                    예약하기
                </button>
            </div>
        </div>
    </div>
    <!-- footer -->
	<jsp:include page="../common/main_footer.jsp"/>
</body>
</html>