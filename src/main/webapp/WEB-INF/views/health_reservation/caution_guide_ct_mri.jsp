<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="KR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CT/MRI 주의사항</title>
    
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
                    <option value="${pageContext.request.contextPath}/healthReservation/guideEven">건강검진 전날</option>
                    <option value="${pageContext.request.contextPath}/healthReservation/guideDday">건강검진 당일</option>
                    <option value="${pageContext.request.contextPath}/healthReservation/guideEndo">위/대장내시경</option>
                    <option value="" disabled hidden selected>CT/MRI</option>
                </select>
            </div>
            <div id="caution_guide_title">
                CT/MRI
            </div>
            <div class="caution_guide_content_wrap">
                <div class="caution_guide_content">
                    <div class="caution_guide_content_img">
                        <img src="${ pageContext.servletContext.contextPath }/resources/img/caution_guide_ct_mri1.png" alt="">
                    </div>
                    <div class="caution_guide_content_text">
                        <div id="caution_guide_content_title">
                            MRI
                        </div>
                        <ul>
                            <li>
                                보청기, 틀니, 피어싱 등의 전자기기 및 금속성 물질은 검사에 방해가 되므로 탈착 해야 함(빼지 못하는 틀니는 치과에 확인 필요).
                            </li>
                            <li>
                                검사가 어려운 경우 (사전 고지 요망)
                            </li>
                            <li>
                                1. 폐쇄공포증이 있는 분
                            </li>
                            <li>
                                2. 심장박동기를 시술하신 분
                            </li>
                            <li>
                                3. 신경자극기를 시술하신 분
                            </li>
                            <li>
                                4. 달팽이관 이식을 받은 분
                            </li>
                            <li>
                                5. 그 밖의 금속성 물질 삽입 수술을 받으신 분 (수술 병원 확인 필요)
                            </li>
                        </ul>
                        
                    </div>
                </div>
                <div class="caution_guide_content">
                    <div class="caution_guide_content_img">
                        <img src="${ pageContext.servletContext.contextPath }/resources/img/caution_guide_ct_mri2.png" alt="">
                    </div>
                    <div class="caution_guide_content_text">
                        <div id="caution_guide_content_title">
                            CT
                        </div>
                        <ul>
                            <li>
                                조영CT 검사 전 약 6시간 정도의 금식 필요
                            </li>
                            <li>
                                검사가 어려운 경우 (사전 고지 요망)
                            </li>
                            <li>
                                1. 갑상선기능항진증(갑상선기능저하증은 검사 가능)
                            </li>
                            <li>
                                2. 신장절제를 했거나 신장 투석, 신장 치료 중인 분
                            </li>
                            <li>
                                3. 과거 조영제 부작용, 평상시 약물 알러지가 있는 분
                            </li>
                            <li>
                                4. 비아그라 복용 후 48시간이 지나지 않은 분
                            </li>
                            <li>
                                5. 치료가 필요한 심한 천식
                            </li>
                            <li>
                                6. 심장조영CT 검사를 하시는 분은 위의 내용과 더불어 부정맥
                            </li>
                            <li>
                                7. 심장스텐트 시술, PTCA(경피적 관동맥 성형술) 실시 확인 필요
                            </li>
                            <li>
                                8. 메트포르민 성분이 포함된 당뇨약을 복용하는 경우 예약 전 고지 필요
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