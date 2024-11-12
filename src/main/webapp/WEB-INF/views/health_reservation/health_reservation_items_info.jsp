<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>건강검진 예약안내</title>
     <!-- css -->
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/health_reservation/health_reservation.css">
    
</head>
<body>
	<!-- header -->
	<jsp:include page="../common/main_header.jsp"/>
	<div class="health_reservation_wrap">
        <div class="health_reservation_container">
            <div id="health_reservation_title">
            	검사 항목 정보
            </div>
            <div class="health_reservation_items_info">
                <div class="health_reservation_item open-modal-btn" data-target="modal1">
                    <img src="${ pageContext.servletContext.contextPath }/resources/img/health_reservation_items_info1.png" alt="">
                    <p>신체측정검사</p>
                </div>
                <div class="health_reservation_item open-modal-btn" data-target="modal2">
                    <img src="${ pageContext.servletContext.contextPath }/resources/img/health_reservation_items_info2.png" alt="">
                    <p>안과 검사</p>
                </div>
                <div class="health_reservation_item open-modal-btn" data-target="modal3">
                    <img src="${ pageContext.servletContext.contextPath }/resources/img/health_reservation_items_info3.png" alt="">
                    <p>청력 검사</p>
                </div>
                <div class="health_reservation_item open-modal-btn" data-target="modal4">
                    <img src="${ pageContext.servletContext.contextPath }/resources/img/health_reservation_items_info4.png" alt="">
                    <p>소변 검사</p>
                </div>
                <div class="health_reservation_item open-modal-btn" data-target="modal5">
                    <img src="${ pageContext.servletContext.contextPath }/resources/img/health_reservation_items_info5.png" alt="">
                    <p>혈액 검사</p>
                </div>
                <div class="health_reservation_item open-modal-btn" data-target="modal6">
                    <img src="${ pageContext.servletContext.contextPath }/resources/img/health_reservation_items_info6.png" alt="">
                    <p>심전도 검사</p>
                </div>
            </div>
        </div>
    </div>
    <div class="modal-overlay" id="modal1">
        <div class="modal-content">
          <div class="modal_title">
            <p>신체 측정 검사</p>
          </div>
          <span class="close-btn">&times;</span>
          <div class="maodal_img">
            <img src="${ pageContext.servletContext.contextPath }/resources/img/health_reservation_items_info1.png" alt="">
          </div>
          <div class="modal_text">
            <p>
                [신체계측]
            </p>
            <p>
                기초검사장비를 통하여 신장, 체중, 비만도를 측정합니다.
            </p>
          </div>
        </div>
    </div>
    <div class="modal-overlay" id="modal2">
        <div class="modal-content">
          <div class="modal_title">
            <p>안과 검사</p>
          </div>
          <span class="close-btn">&times;</span>
          <div class="maodal_img">
            <img src="${ pageContext.servletContext.contextPath }/resources/img/health_reservation_items_info2.png" alt="">
          </div>
          <div class="modal_text">
            <p>
                시력검사, 안압검사, 안저촬영 그리고 백내장 진단검사를 합니다.
                안압검사는 녹내장 여부를 알아보는 검사로 20mmHg 이내가 정상입니다.
                안저촬영에서는 망막질환, 당뇨병 및 고혈압에 의한 망막 합병증을 발견할 수 있습니다.
                백내장 진단검사에서는 수정체의 정밀 단층사진을 촬영하여 백내장 유무와 진행 정도를 진단할 수 있습니다.
            </p>
          </div>
        </div>
    </div>
    <div class="modal-overlay" id="modal3">
        <div class="modal-content">
          <div class="modal_title">
            <p>청력 검사</p>
          </div>
          <span class="close-btn">&times;</span>
          <div class="maodal_img">
            <img src="${ pageContext.servletContext.contextPath }/resources/img/health_reservation_items_info3.png" alt="">
          </div>
          <div class="modal_text">
            <p>
                양측 귀의 청력소실의 유무 및 정도를 알아보는 검사입니다.
                본인이 느끼지 못하더라도 청력이 저하되어 있을 수 있으며 나이가 들면서 퇴행성 변화 또는 염증에 의하여 청력이 저하되는 경우가 있고 직장환경의 영향도 있습니다. 보청기 처방이나 정밀검사를 위하여 이비인후과 진료가 권장되기도 합니다.
            </p>
          </div>
        </div>
    </div>
    <div class="modal-overlay" id="modal4">
        <div class="modal-content">
          <div class="modal_title">
            <p>소변 검사</p>
          </div>
          <span class="close-btn">&times;</span>
          <div class="maodal_img">
            <img src="${ pageContext.servletContext.contextPath }/resources/img/health_reservation_items_info4.png" alt="">
          </div>
          <div class="modal_text">
            <p>
                요단백, 요당, 케톤뇨, 혈뇨, 염증세포, 미세단백뇨 등을 알아내어 신장질환이나 종양 결석 감염 등을 조기진단 하는데 유용한 검사입니다.
            </p>
          </div>
        </div>
    </div>
    <div class="modal-overlay" id="modal5">
        <div class="modal-content">
          <div class="modal_title">
            <p>혈액 검사</p>
          </div>
          <span class="close-btn">&times;</span>
          <div class="maodal_img">
            <img src="${ pageContext.servletContext.contextPath }/resources/img/health_reservation_items_info5.png" alt="">
          </div>
          <div class="modal_text">
            <p>
                일반혈액검사, 혈청면역검사, 간 기능검사, 당뇨검사, 통풍, 신장기능검사, 전해질검사, 고지혈 및 혈액응고검사, 갑상선검사, 암표지자 검사 그리고 골다공증을 예측할 수 있는 골표지자 검사와 여성/남성호르몬 등을 검사합니다.
            </p>
          </div>
        </div>
    </div>
    <div class="modal-overlay" id="modal6">
        <div class="modal-content">
          <div class="modal_title">
            <p>심전도 검사</p>
          </div>
          <span class="close-btn">&times;</span>
          <div class="maodal_img">
            <img src="${ pageContext.servletContext.contextPath }/resources/img/health_reservation_items_info6.png" alt="">
          </div>
          <div class="modal_text">
            <p>
                심전도는 심장에서 발생하는 전기적 신호를 체표면에서 받아 기록하는 것입니다.
                부정맥, 허혈성 심장질환(협심증, 심근경색), 심방 및 심실비대 등의 진단에 유용한 검사입니다.
                심전도상의 경미한 이상이 모두 이상소견으로 간주되는 것은 아니며 심장질환의 진단에 보조적인 검사입니다.
            </p>
          </div>
        </div>
    </div>
    <script>
        const openModalBtns = document.querySelectorAll(".open-modal-btn");
        const closeModalBtns = document.querySelectorAll(".close-btn");

        // 각 버튼에 클릭 이벤트 추가
        openModalBtns.forEach((btn) => {
        btn.addEventListener("click", () => {
            const targetId = btn.getAttribute("data-target");
            const targetModal = document.getElementById(targetId);
            targetModal.classList.add("active");
        });
        });

        // 닫기 버튼에 클릭 이벤트 추가
        closeModalBtns.forEach((btn) => {
        btn.addEventListener("click", () => {
            btn.closest(".modal-overlay").classList.remove("active");
        });
        });

        // 모달 외부 클릭 시 닫기
        window.addEventListener("click", (e) => {
        if (e.target.classList.contains("modal-overlay")) {
            e.target.classList.remove("active");
        }
        });

    </script>
    <!-- footer -->
	<jsp:include page="../common/main_footer.jsp"/>
</body>
</html>