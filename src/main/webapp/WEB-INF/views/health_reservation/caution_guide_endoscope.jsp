<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="KR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>위/대장 내시경 주의사항</title>
    
     <!-- css -->
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/defalut.css">
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
                    <option value="" disabled hidden selected>주의사항</option>
                    <option value="caution_guide_even">건강검진 전날</option>
                    <option value="caution_guide_d">건강검진 당일</option>
                    <option value="caution_guide_endo">위/대장내시경</option>
                    <option value="caution_guide_ct">CT/MRI</option>
                </select>
            </div>
            <div id="caution_guide_title">
                위/대장 내시경
            </div>
            <div class="caution_guide_content_wrap">
                <div class="caution_guide_content">
                    <div class="caution_guide_content_img">
                        <img src="${ pageContext.servletContext.contextPath }/resources/img/caution_guide_endoscope1.png" alt="">
                    </div>
                    <div class="caution_guide_content_text">
                        <div id="caution_guide_content_title">
                            위 내시경
                        </div>
                        <ul>
                            <li>
                                검사 전날 저녁 식사는 흰죽과 같은 소화되기 쉬운 음식물을 드시고 검사 전 8~12시간 동안 금식이 필요합니다.
                            </li>
                            <li>
                                흔들리는 치아, 의치, 임시 수복물 등 비정상적인 치아상태인 경우 치아 손상이 발생할 수 있으니 검사 전 치아상태 확인이 필요합니다.
                            </li>
                            <li>
                                술과 물, 흡연도 금지입니다.
                            </li>
                            <li>
                                혈압약은 검사 당일 아침 일찍 물 반 컵 정도와 함께 복용하십시오.
                            </li>
                            <li>
                                당뇨병이 있는 분은 검사 당일 아침에 인슐린 주사를 맞지 마시고 당뇨약도 드시지 마십시오.
                            </li>
                            <li>
                                검사 중 조직검사, 헬리코박터균 검사, 용종제거 시 추가비용이 발생될 수 있습니다.
                            </li>
                            <li>
                                의치를 사용하시는 경우 검사 전 의치를 제거해 주시기 바랍니다.
                            </li>
                            <li>
                                수면내시경 후 충분한 휴식이 필요하며 검사당일은 운전하지 마시고 보호자와 동행하여 주십시오.
                            </li>
                        </ul>
                        
                    </div>
                </div>
                <div class="caution_guide_content">
                    <div class="caution_guide_content_img">
                        <img src="${ pageContext.servletContext.contextPath }/resources/img/caution_guide_endoscope2.png" alt="">
                    </div>
                    <div class="caution_guide_content_text">
                        <div id="caution_guide_content_title">
                            대장 내시경
                        </div>
                        <ul>
                            <li>
                                검사 3일전부터 질긴 채소류, 해조류(미역, 김 등), 잡곡(검정쌀, 현미 등) 옥수수, 잣, 깨, 씨가 많은 과일(참외, 포도, 키위, 수박 등)은 드시지 마시고, 장정결제 복용법을 잘 지켜 주십시오.
                            </li>
                            <li>
                                검사 중 조직검사, 용종제거 시 추가 비용이 발생될 수 있습니다.
                            </li>
                            <li>
                                검사 시 심한통증, 장 청소 불량, 검진자의 비협조, 이전 복부수술로 인한 장 유착 등으로 검사가 중단되는 경우도 있습니다.
                            </li>
                            <li>
                                수면내시경 후 충분한 휴식이 필요하며 검사당일은 운전하지 마시고 보호자와 동행하여 주십시오.
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="reservation_btn_area">
                <button id="reservation_btn">
                    예약하기
                </button>
            </div>
        </div>
    </div>
    <!-- footer -->
	<jsp:include page="../common/main_footer.jsp"/>
</body>
</html>