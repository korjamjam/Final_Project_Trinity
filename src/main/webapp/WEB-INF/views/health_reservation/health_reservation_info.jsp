<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검진 절차 안내</title>
    
    <!-- css -->
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/defalut.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/health_reservation/health_reservation_info.css">
    
</head>
<body>
<!-- Header -->
<jsp:include page="../common/FinalHeader.jsp" />

    <div class="health_reservation_normal_wrap">
        <div class="health_reservation_normal_container">
            <div class="health_reservation1_title">
                검진 절차 안내
            </div>
            <div class="health_reservation_normal_select">
                <select name="" id="">
                    <option value="">일반건강검진</option>
                    <option value="">암검진</option>
                    <option value="">생애전환기검진</option>
                </select>
            </div>
            <div class="health_reservation_information_wrap">
                <div class="health_reservation_information">
                    <div class="health_reservation_colorBox" style="background-color: #FFCECE;">
                        대상자선정
                    </div>
                    <div class="health_reservation_content">
                        <p>
                            일반건강검진 대상자는 <br>
                            - 지역세대주, 직장가입자, 20세 이상 세대원과 피부양자, 20세~64세 의료급여수급권자 <br>
                            ※ 매 2년마다 1회, 비사무직은 매년 실시
                        </p>
                    </div>
                </div>
                <div class="health_reservation_information">
                    <div class="health_reservation_colorBox" style="background-color: #FFE79A;">
                        건강검진표<br>
                        발송 및 수령
                    </div>
                    <div class="health_reservation_content">
                        <p>
                            우편발송<br>
                            1. 지역가입자와 직장 피부양자는 주소지로 우편 발송해 드립니다. <br>
                            ※ 검진표를 분실 또는 수령치 못한 경우에는 가까운 지사에서 재발급 또는 국민건강보험 사이트(건강검진/검진 대상자 확인)에서 검진대상자 확인서를 출력하실 수 있습니다. <br>
                            ※ 직장가입자의 경우 해당 사업장으로 통보됩니다.
                        </p>
                    </div>
                </div>
                <div class="health_reservation_information">
                    <div class="health_reservation_colorBox" style="background-color: #EFDDFF;">
                        건강검진
                    </div>
                    <div class="health_reservation_content">
                        <p>
                            공통 검사항목<br>
1. 진찰, 상담, 신장, 체중, 허리둘레, 체질량지수, 시력, 청력, 혈압측정<br>
2. AST(SGOT), ALT(SGPT), 감마지티피<br>
3. 공복혈당<br>
4. 요단백, 혈청크레아티닌, 혈색소, 신사구체여과율(e-GFR)<br>
5. 흉부방사선촬영<br>
6. 구강검진<br>

성·연령별 검사항목<br>
1. 이상지질혈증(총콜레스테롤, HDL콜레스테롤, LDL콜레스테롤, 중성지방)*남자 24세이상, 여자 40세이상, 4년마다<br>
2. B형간염검사(40세, 보균자 및 면역자는 제외)<br>
3. 치면세균막검사(40세)<br>
4. 골다공증(54·66세 여성)<br>
5. 정신건강검사_우울증(20·30·40·50·60·70세)<br>
6. 생활습관평가(40·50·60·70세)<br>
7. 노인신체기능검사(66·70·80세) <br>
8. 인지기능장애검사(66세 이상 2년에 1회) <br>
                        </p>
                    </div>
                </div>
                <div class="health_reservation_information">
                    <div class="health_reservation_colorBox" style="background-color: #B1DDFD;">
                        건강검진 결과 통보
                    </div>
                    <div class="health_reservation_content">
                        <p>
                            1. 일반건강검진 후 15일 이내 검진기관에서 문진표에 작성한 주소지로 발송<br>
2. 건강위험평가(HRA)
                        </p>
                    </div>
                </div>
                <div class="health_reservation_information">
                    <div class="health_reservation_colorBox" style="background-color: #FFAFB1;">
                        확진검사
                    </div>
                    <div class="health_reservation_content">
                        <p>
                            1. 일반 건강검진 결과 고혈압·당뇨병 질환의심자는 일반건강검진결과표와 신분증을지참하고 가까운 병·의원(상급종합병원 및 종합병원 제외)에서 확진검사 및 진료 실시(의료급여수급권자는 의료전달체계에 따라 가까운 의원에서 실시)
                            <br>
2. 확진검사항목- 고혈압 : 진찰 및 상담, 혈압측정- 당뇨병 : 진찰 및 상담, 공복혈당검사
                        </p>
                    </div>
                </div>
                <div class="health_reservation_information">
                    <div class="health_reservation_colorBox" style="background-color: #ADF8D7;">
                        건강검진 주의사항<br>
                    </div>
                    <div class="health_reservation_content">
                        <p>
                            검진 전날 저녁 9시 이후에는 금식하시기 바랍니 다.- 검진 당일 아침 식사는 물론 물, 커피, 우유, 담배, 주스, 껌 등 일체의 음식을 삼가야 합니다. <br>- 되도록 오전 중에 검진을 받되, 오후에 검진받으실 분은검사 전 최소 8시간 이상의 공복상태를 유지해야 합니다. <br>(공복이 아닌 상태에서 검진 시 검사결과가 다르게 나타날 수 있음)
                        </p>
                    </div>
                </div>
            </div>
            <div>
            	<button id="reservation_btn">예약하기</button>
            </div>
        </div>
    </div>
    <!-- Footer -->
    <jsp:include page="../common/FinalFooter.jsp" />
</body>
</html>