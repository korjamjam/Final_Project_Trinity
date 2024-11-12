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
    <!-- <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/main.css"> -->

    <!-- jQuery -->
    <script 
        src="https://code.jquery.com/jquery-3.7.1.js" 
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" 
        crossorigin="anonymous">
    </script>
    <script 
        src="https://code.jquery.com/ui/1.14.0/jquery-ui.js" 
        integrity="sha256-u0L8aA6Ev3bY2HI4y0CAyr9H8FRWgX4hZ9+K7C2nzdc=" 
        crossorigin="anonymous">
    </script>

    <!-- Calander -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <style>
        * {
            font-family: "Noto Sans KR", system-ui;
        }

        /* Caution */
        .reservation_caution_wrapper{
            width: 80%;
        }
        .reservation_caution{
            background-color: rgba(255, 247, 248, 235);
            padding: 10px;
            line-height: 15px;
        }
        .reservation_word{
            color: grey;
        }
        .reservation_word1{
            font-weight: bold;
        }
        .reservation_word2{
            font-weight: bold;
            color: red;
        }
        .reservation_word3{
            color: red;
        }

        /* Subject Select */
        .reservation_subject_select{
            width: 80%;
            padding: 10px 0px;
        }
        .reservation_subject_select_title{
            display: flex;
            justify-content: space-between;
            border-bottom: 1px solid #dbdbdb;
            padding: 15px 10px;
        }
        .reservation_subject_select_title p{
            font-size: 20px;
            color: #9e9e9e;
        }
        .reservation_subject_select_content{
            display: none;
            margin: 10px 0px;
        }
        .reservation_subject_select_content p{
            color: grey;
            padding-left: 10px;
            padding-bottom: 10px;
        }
        .reservation_subject_select_content button{
            border: none;
            border-radius: 5px;
            background-color: rgba(248, 247, 252, 168);
            color: grey;
            padding: 10px 15px;
        }
        .reservation_subject_select_content input{
            border: 1px solid #9e9e9e;
            padding: 5px;
            width: 100%;
            border-radius: 5px;
        }
        .reservation_button{
            width: 80%;
            margin: 20px 0px;
        } 
        .reservation_button button{
            width: 100%;
            height: 40px;
            border: none;
            border-radius: 5px;
            background-color: #8CCF4E;
            color: white;
        }
        .reservation_time{
            width: 100%;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 5px;
        }
        .reservation_isyou{
            color: grey;
            display: flex;
            justify-content: right;
            gap: 10px;
            padding-right: 10px;
        }
        .reservation_isyou input[type="checkbox"] {
            appearance: none;
            -webkit-appearance: none;
            width: 14px;
            height: 14px;
            border: 2px solid #8CCF4E;
            border-radius: 50%;
            outline: none;
            cursor: pointer;
        }
        .reservation_isyou input[type="checkbox"]:checked {
            border-color: #7ed321;
            background-color: #7ed321;
        }
        .reservation_isyou input[type="checkbox"]:checked::before {
            content: '';
            position: absolute;
            top: 3px;
            left: 3px;
            width: 10px;
            height: 10px;
            border-radius: 50%;
        }

        /*Datepicker*/
        @import url('https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css');


        /*datepicker*/
        .i_datepicker input{cursor: pointer;}
        .i_datepicker img{position: absolute; right: 15px; top: 50%; transform: translateY(-50%); width: 16px; height: 16px; background: url(../img/ico_datepicker.svg) no-repeat center/cover;}
        #ui-datepicker-div{z-index: 9 !important;}
        .ui-widget-header { border: 0px solid #dddddd; background: #fff; }

        .ui-datepicker-calendar>thead>tr>th { font-size: 14px !important; }

        .ui-datepicker .ui-datepicker-header { position: relative; padding: 10px 0; }

        .ui-state-default,
        .ui-widget-content .ui-state-default,
        .ui-widget-header .ui-state-default,
        .ui-button,
        html .ui-button.ui-state-disabled:hover,
        html .ui-button.ui-state-disabled:active { border: 0px solid #c5c5c5; background-color: transparent; font-weight: normal; color: #454545; text-align: center; }

        .ui-datepicker .ui-datepicker-title { margin: 0 0em; line-height: 16px; text-align: center; font-size: 14px; padding: 0px; font-weight: bold; }

        .ui-datepicker { display: none; background-color: #fff; border-radius: 4px; margin-top: 10px; margin-left: 0px; margin-right: 0px; padding: 20px; padding-bottom: 10px; width: 100%;}

        .ui-widget.ui-widget-content { border: 1px solid #eee; }

        #datepicker:focus>.ui-datepicker { display: block; }

        .ui-datepicker-prev,
        .ui-datepicker-next { cursor: pointer; }

        .ui-datepicker-next { float: right; }

        .ui-state-disabled { cursor: auto; color: hsla(0, 0%, 80%, 1); }

        .ui-datepicker-title { text-align: center; padding: 10px; font-weight: bold; font-size: 20px; }

        .ui-datepicker-calendar { width: 100%; }

        .ui-datepicker-calendar>thead>tr>th { padding: 5px; font-size: 20px; font-weight: 400; }

        .ui-datepicker-calendar>tbody>tr>td>a { color: #000; font-size: 12px !important; font-weight: bold !important; text-decoration: none;}

        .ui-datepicker-calendar>tbody>tr>.ui-state-disabled:hover { cursor: auto; background-color: #fff; }

        .ui-datepicker-calendar>tbody>tr>td { border-radius: 100%; width: 44px; height: 30px; cursor: pointer; padding: 5px; font-weight: 100; text-align: center; font-size: 12px; }

        .ui-datepicker-calendar>tbody>tr>td:hover { background-color: transparent; opacity: 0.6; }

        .ui-state-hover,
        .ui-widget-content .ui-state-hover,
        .ui-widget-header .ui-state-hover,
        .ui-state-focus,
        .ui-widget-content .ui-state-focus,
        .ui-widget-header .ui-state-focus,
        .ui-button:hover,
        .ui-button:focus { border: 0px solid #cccccc; background-color: transparent; font-weight: normal; color: #2b2b2b; }


        .ui-datepicker-calendar>tbody>tr>td:first-child a { color: red !important; }

        .ui-datepicker-calendar>tbody>tr>td:last-child a { color: #0099ff !important; }

        .ui-datepicker-calendar>thead>tr>th:first-child { color: red !important; }

        .ui-datepicker-calendar>thead>tr>th:last-child { color: #0099ff !important; }

        .ui-state-highlight,
        .ui-widget-content .ui-state-highlight,
        .ui-widget-header .ui-state-highlight { border: 0px; background: #f1f1f1; border-radius: 50%; padding-top: 7px; padding-bottom: 8px; }

        .inp { padding: 10px 10px; background-color: #f1f1f1; border-radius: 4px; border: 0px; }
        
        @media (min-width: 500px) {
            .reservation_caution_wrapper{
                width: 70%;
                max-width: 460px;
            }
            .reservation_subject_select{
                width: 70%;
                max-width: 460px;
            }
            .reservation_button{
                width: 70%;
                max-width: 460px;
            }
        }

        @media (min-width: 768px) {
            .reservation_caution_wrapper{
                width: 60%;
                max-width: 864px;
            }
            .reservation_subject_select{
                width: 60%;
                max-width: 864px;
            }
            .reservation_button{
                width: 60%;
                max-width: 864px;
            }
            .ui-datepicker {
                width: 100%;
                height: 600px;
                margin: 5px auto 0;
                font: 9pt Arial, sans-serif;
            }

            .ui-datepicker-calendar>tbody>tr>td { border-radius: 100%; width: 60px; height: 80px; cursor: pointer; padding: 5px; font-weight: 100; text-align: center; font-size: 12px; }
            .ui-datepicker-calendar>tbody>tr>td>a { color: #000; font-size: 20px !important; font-weight: bold !important; text-decoration: none;}
        
            .reservation_subject_select_content input{
                border: 1px solid #9e9e9e;
                padding: 5px;
                width: 60%;
                border-radius: 5px;
            }
        }
        @media (min-width: 1200px) {
            .reservation_button{
                margin-bottom: 93px;
            }
        }

    </style>

</head>
<body>

    <!-- Header -->
	<%@ include file="/WEB-INF/views/common/main_header.jsp"%>

    <br><br>
    
    <!-- Caution -->
    <div class="reservation_caution_wrapper">
        <div class="reservation_caution">
            <p class="reservation_word1">유의사항</p>
            <br>
            <p class="reservation_word2">* 본 예약은 확정 예약이 아닙니다.</p>
            <p class="reservation_word3">병원으로부터 예약안내 연락을 받아야 확정되오니, 착오 없으시길 바랍니다.</p>
            <br>
            <p class="reservation_word">* 진료 예약취소는 예약일 3일전까지 가능합니다.</p>
        </div>
    </div>

    <!-- Subject Select -->
    <div class="reservation_subject_select">
        <div class="reservation_subject_select_title " onclick="openContent(this)">
            <p>예약 과목 선택</p>
            <img src="${ pageContext.servletContext.contextPath }/resources/img/down_arrow.png" alt="down_arrow">
        </div>
        <div class="reservation_subject_select_content">
            <p>진료 과목</p>
            <button>소아과</button>
            <br><br>
            <input type="text" placeholder="증상을 입력해주세요">
        </div>
        <div class="reservation_subject_select_title" onclick="openContent(this)">
            <p>예약 날짜 선택</p>
            <img src="${ pageContext.servletContext.contextPath }/resources/img/down_arrow.png" alt="down_arrow">
        </div>
        <div class="reservation_subject_select_content">
            <div id="datepicker"></div>
        </div>
        <div class="reservation_subject_select_title" onclick="openContent(this)">
            <p>예약 시간 선택</p>
            <img src="${ pageContext.servletContext.contextPath }/resources/img/down_arrow.png" alt="down_arrow">
        </div>
        <div class="reservation_subject_select_content">
            <p>오전</p>
            <div class="reservation_time">
                <button>10:00</button>
                <button>10:30</button>
                <button>11:00</button>
                <button>11:30</button>
            </div>
            <p>오후</p>
            <div class="reservation_time">
                <button>12:00</button>
                <button>12:30</button>
                <button>13:00</button>
                <button>13:30</button>
                <button>14:00</button>
                <button>15:00</button>
                <button>16:00</button>
                <button>16:30</button>
            </div>
        </div>
        <div class="reservation_subject_select_title" onclick="openContent(this)">
            <p>예약자 선택</p>
            <img src="${ pageContext.servletContext.contextPath }/resources/img/down_arrow.png" alt="down_arrow">
        </div>
        <div class="reservation_subject_select_content">
            <div class="reservation_isyou">
                <label for="isyou">
                    회원 정보와 동일
                    <input type="checkbox" id="isyou">
                </label>
            </div>
            <br><br>
            <input type="text" placeholder="이름을 입력해주세요">
            <br><br>
            <input type="text" placeholder="생년월일을 입력해주세요">
        </div>
    </div>

    <div class="reservation_button">
        <button>예약 신청하기</button>
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
            inline: true
          });

        });

        function openContent(content){
            //this -> 클릭이벤트가 발생한 요소(div)
            // $(this).next(); -> 선택된 요소의 뒤에있는 요소

            const $p = $(content).next();
            if($p.css("display") === "none"){
                //$(".reservation_subject_select_content").slideUp(); // 클래스명을 일치시켜야 동작함
                $p.slideDown();
            } else{
                $p.slideUp();
            }
        }
    </script>

    <!-- Footer -->
    <%@ include file="/WEB-INF/views/common/main_footer.jsp"%>

</body>
</html>