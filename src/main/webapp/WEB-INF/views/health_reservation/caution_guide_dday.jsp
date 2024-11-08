<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="KR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검진 당일 주의사항</title>
    
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
                건강검진 당일
            </div>
            <div class="caution_guide_content_wrap">
                <div class="caution_guide_content">
                    <div class="caution_guide_content_img">
                        <img src="${ pageContext.servletContext.contextPath }/resources/img/caution_guide_dday1.png" alt="">
                    </div>
                    <div class="caution_guide_content_text">
                        <div id="caution_guide_content_title">
                            약 복용
                        </div>
                        <ul>
                            <li>
                                혈압약 : 혈압약은 건강진단 당일 새벽6시 이전에 최소량의 물과 함께 복용하십시오.단, 위장조영술을 하는 분은 약을 드시지 마시고 가져오시기 바랍니다.
                            </li>
                            <li>
                                당뇨약 : 건강검진 당일 아침 인슐린이나 당뇨약 복용을 금합니다.
                            </li>
                        </ul>
                        
                    </div>
                </div>
                <div class="caution_guide_content">
                    <div class="caution_guide_content_img">
                        <img src="${ pageContext.servletContext.contextPath }/resources/img/caution_guide_dday2.png" alt="">
                    </div>
                    <div class="caution_guide_content_text">
                        <div id="caution_guide_content_title">
                            준비물
                        </div>
                        <ul>
                            <li>
                                아침식사는 물론 담배, 껌, 등 아무것도 드시지 마십시오.
                            </li>
                            <li>
                                건강검진 문진표, 예약증, 채변통을 지참하여 주시기 바랍니다.
                            </li>
                            <li>
                                장신구, 귀중품은 분실의 위험이 있사오니 소지하고 오지 마십시오.
                            </li>
                            <li>
                                안경이나 콘택트렌즈를 가져오시기 바랍니다.(교정시력 측정)
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="caution_guide_content">
                    <div class="caution_guide_content_img">
                        <img src="${ pageContext.servletContext.contextPath }/resources/img/caution_guide_dday3.png" alt="">
                    </div>
                    <div class="caution_guide_content_text">
                        <div id="caution_guide_content_title">
                            방문
                        </div>
                        <ul>
                            <li>
                                원활한 건강검진을 위해 간편한 복장으로 예약시간 20분전까지 내원하여 주십시오.                            </li>
                            <li>
                                하복부초음파(전립선, 방광, 난소)검사는 아침소변을 보지 마시고 많이 참은 상태에서 내원하시기 바랍니다.
                            </li>
                            <li>
                                수면내시경을 하시는 고객은 당일 자가운전이 불가능하오니 대중교통을 이용해 주십시오(보호자 동반)
                            </li>
                            <li>
                                생리중인 분은 차후 부인과 및 소변검사를 위해 재방문하셔야 합니다.
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