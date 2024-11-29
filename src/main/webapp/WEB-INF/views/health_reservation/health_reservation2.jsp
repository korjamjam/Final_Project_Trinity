<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>건강검진 예약안내</title>
        
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- css -->
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_datepicker.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/health_reservation/health_reservation2.css">
 
</head>
<body>
	<!-- header -->
	<jsp:include page="../common/main_header.jsp"/>
	<div class="health_reservation1_wrap">
        <div class="health_reservation1_container">
            <form action="reservationSubmit" method="post">
                <div class="health_reservation1_title">
                    국가 건강 검진 예약
                </div>
                <div class="health_reservation2_content">
                    <div id="health_reservation1_content_title">
                        3. 검진종류
                    </div>
                    <div class="health_reservation_normal_select">
                        <select name="reservation_user_select" id="category" onchange="categoryHospital()">
                            <option value="" disabled hidden selected>검진 종류</option>
                            <option value="1">일반 검진</option>
                            <option value="2">구강 검진</option>
                            <option value="3">암 검진</option>
                            <option value="4">일반 + 암 검진</option>
                            <option value="6">영유아 검진</option>
                        </select>
                    </div>
                </div>
                <div class="health_reservation2_content" style="display: none;">
                    <div id="health_reservation1_content_title">
                        3-1. 선택 검사 항목
                    </div>
                    <div class="health_reservation_normal_select">
                        <select name="" id="">
                            <option value="" disabled hidden selected>검진 종류</option>
                            <option value="">일반건강검진</option>
                            <option value="">암검진</option>
                            <option value="">생애주기전환검진</option>
                        </select>
                    </div>
                </div>
                <div class="health_reservation2_content">
                    <div id="health_reservation1_content_title">
                        4. 검사받을기관
                    </div>
                    <div class="health_reservation_normal_select">
                        <select name="reservation_user_hospital" id="hospitalSelect">
                            <option value="">원하는 검사항목을 선택하세요</option>
                        </select>
                    </div>
                </div>
                <div class="health_reservation2_content">
                    <div id="health_reservation1_content_title">
                        5. 특이사항
                    </div>
                    <div id="health_reservation_inputText">
                        <textarea name="reservation_user_text" id="" placeholder="알레르기, 특이사항"></textarea>
                    </div>
                </div>
                <div class="health_reservation2_content">
                    <div id="health_reservation1_content_title">
                        6. 날짜 및 시간
                    </div>
                    <div class="health_reservation_normal_date">
                        <div id="datepicker"></div>
                        <input type="hidden" name="reservation_user_date">
                    </div>
                    <div class="health_reservation_normal_select">
                        <select name="timeOfDay" id="timeOfDaySelect" required>
                            <option value="" disabled hidden selected>시간 선택</option>
                            <option value="morning">오전</option>
                            <option value="afternoon">오후</option>
                        </select>
                    </div>
                    <div class="health_reservation_normal_select" id="specificTimeSelectContainer">
                        <select name="reservation_user_time" id="specificTimeSelect" required>
                            <option value="" disabled hidden selected>구체적인 시간 선택</option>
                        </select>
                    </div>
                </div>
                <div class="health_reservation2_content">
                    <div id="health_reservation1_content_title">
                        7. 결과 수령 방법
                    </div>
                    <div class="health_reservation1_checkbox">
                        <label for="">
                            <input type="radio" name="reservation_user_result" value="이메일"> 이메일
                            <input type="radio" name="reservation_user_result" value="직접 수령"> 직접수령(주소로 배송)
                        </label>
                    </div>
                </div>
                <div class="reservation_btn_area">
                    <button id="reservation_btn" type="submit">예약</button>
                </div>
            </form>
        </div>
    </div>
    <script>
        $(function() {
          // 페이지에 바로 달력이 보이도록 설정
          $("#datepicker").datepicker({
            closeText: "닫기",
            currentText: "오늘",
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            weekHeader: "주",
            yearSuffix: '년',
            inline: true,
            onSelect: function(reservation_user_date) {
            $("input[name='reservation_user_date']").val(reservation_user_date);
            }
          });

          $('#timeOfDaySelect').on('change', function() {
            const timeOfDay = $(this).val();
            const specificTimeSelect = $('#specificTimeSelect');
            specificTimeSelect.empty(); // 기존 옵션 제거

            if (timeOfDay === 'morning') {
                specificTimeSelect.append(new Option('9:00', '09:00'));
                specificTimeSelect.append(new Option('9:30', '09:30'));
                specificTimeSelect.append(new Option('10:00', '10:00'));
                specificTimeSelect.append(new Option('10:30', '10:30'));
                specificTimeSelect.append(new Option('11:00', '11:00'));
                specificTimeSelect.append(new Option('11:30', '11:30'));
            } else if (timeOfDay === 'afternoon') {
                specificTimeSelect.append(new Option('1:00', '13:00'));
                specificTimeSelect.append(new Option('1:30', '13:30'));
                specificTimeSelect.append(new Option('2:00', '14:00'));
                specificTimeSelect.append(new Option('2:30', '14:30'));
                specificTimeSelect.append(new Option('3:00', '15:00'));
                specificTimeSelect.append(new Option('3:30', '15:30'));
                specificTimeSelect.append(new Option('4:00', '16:00'));
                specificTimeSelect.append(new Option('4:30', '16:30'));
                specificTimeSelect.append(new Option('5:00', '17:00'));
                specificTimeSelect.append(new Option('5:30', '17:30'));
            }

            // 구체적인 시간 선택 박스를 보여줌
            $('#specificTimeSelectContainer').show();
        });
        });

        function categoryHospital() {
            const category = document.querySelector("#category").value;
            console.log(category)

            getHrHospitalList({ category: category }, function(hrHospitalList){
                const itemList = hrHospitalList.response.body.items.item;
                drawHrHospitalList(document.querySelector("#hospitalSelect"), itemList)
            })
        }

        function getHrHospitalList(data, callback){
            console.log(data)
            $.ajax({
                    url: "category", // 병원 목록 조회 API 엔드포인트
                    method: "GET",
                    data: data,
                    success: function (result) {
                        callback(result)
                    },
                    error: function () {
                        alert("병원 목록을 불러오지 못했습니다.");
                    }
                });
        }

        function drawHrHospitalList(parent, itemArr){
            const category = document.querySelector("#category").value;
            parent.innerHTML = "";

            console.log("itemArr" + itemArr)
            for(const item of itemArr){
                console.log("category" + category)
                console.log("item.hmcNm" + item.hmcNm)
                parent.innerHTML += "<option value=" + item.hmcNm + ">" + item.hmcNm + "</option>" 
                console.log(item)
            }
        }
    </script>
    <!-- footer -->
	<jsp:include page="../common/main_footer.jsp"/>
</body>
</html>