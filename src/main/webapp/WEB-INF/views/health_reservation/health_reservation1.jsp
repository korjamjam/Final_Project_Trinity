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
            <form action="main" method="post">
                <div id="health_reservation_title">
                    국가 건강 검진 예약
                </div>
                <div class="health_reservation1_content">
                    <div id="reservation_content_title">
                        1. 검진자 정보
                    </div>
                    <p>검진자(성명)</p>
                        <div class="health_reservation1_content input_name">
                            <input type="text" required>
                        </div>
                    <p>주민번호</p>
                    <div class="health_reservation1_content input_id_num">
                        <input type="text" required> - <input type="password" maxlength="1" required>
                        <p>******</p>
                    </div>
                    <p>핸드폰</p>
                    <div class="health_reservation1_content input_phone">
                        <select name="" id="">
                            <option value="">010</option>
                            <option value="">011</option>
                            <option value="">012</option>
                            <option value="">013</option>
                        </select>
                        <input type="text" placeholder=" -없이 입력하세요" required>
                    </div>
                    <p>이메일</p>
                    <div class="health_reservation1_content input_email">
                        <input type="text"> @
                        <select name="" id="">
                            <option value="">naver.com</option>
                            <option value="">daum.net</option>
                            <option value="">gmail.com</option>
                            <option value="">hanmail.com</option>
                        </select>
                    </div>
                    <p>주소</p>
                    <div class="health_reservation1_content input_address">
                        <input type="text" disabled>
                        <button>주소찾기</button>
                    </div>
                    <input type="text" disabled>
                    <input type="text" placeholder=" 상세주소">
                </div>
                <div class="health_reservation1_content2">
                    <div id="reservation_content_title">
                        2. 개인정보 수집 및 이용 동의
                    </div>
                    <div class="use_tos">
                        <p> 개인정보 수집 및 이용에 동의 하십니까?</p>
                        <label for="">
                            <input type="checkbox">동의함
                            <input type="checkbox">동의하지 않음
                        </label>
                    </div>
                    <p>
                        ※ 건강검진예약 서비스는 본 서비스의 원활한 활용을 위해 필요한 이용자의 신상정보를 수집할 수 있습니다.
                    </p>
                    <div class="health_reservation1_tos">
                        <table>
                            <thead>
                                <tr>
                                    <td>이용목적</td>
                                    <td>수집항목</td>
                                    <td>보유 및 이용 기간</td>
                                </tr>
                            </thead>
                            <tr>
                                <td>검진예약</td>
                                <td>*필수항목: 성명, 성별, 생년 월일,
                                    휴대폰 번호, 결과받을 주소 <br>
                                    *선택항목: 이메일</td>
                                <td>
                                    계약 및 청약철회 등에 관한 기록 : 5년 <br>
                                    대금결제 및 재화 등의 공급에 관한 기록 : 5년 <br>
                                    소비자의 불만 또는 분쟁처리에 관한 기록 : 3년
                                </td>
                            </tr>
                        </table>
                    </div>
                    <p>
                        ※ 검진예약 이용자는 한국건강관리협회 홈페이지에서 수집하는 개인정보에 대해 동의를 거부할 권리가 있으며 동의 거부 시에는 진료예약이 제한됩니다.
                    </p>
                    <p>
                        ※ 게시판 이용자는 한국건강관리협회 홈페이지에서 수집하는 개인정보에 대해 동의를 거부할 권리가 있으며 동의 거부 시에는 서비스이용이 제한됩니다.
                    </p>
                    <div class="use_tos">
                        <p>국가건강검진 대상 조회에 동의하십니까?</p>
                        <label for="">
                            <input type="checkbox">동의함
                            <input type="checkbox">동의하지 않음
                        </label>
                    </div>
                </div>
                <div class="reservation_btn_area">
                    <button id="reservation_btn"  type="submit" onclick="location.href=''">다음</button>
                </div>
            </form>
        </div>
    </div>
    <!-- footer -->
	<jsp:include page="../common/main_footer.jsp"/>
</body>
</html>