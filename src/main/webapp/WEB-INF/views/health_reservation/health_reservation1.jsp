<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.project.trinity.member.model.vo.Member" %>
<%
    Member loginUser = (Member)session.getAttribute("loginUser");

	//로그인 유저 생일 정보 YYMMDD로 변환
	String userBirth = loginUser.getBirthday().substring(2,4)
					   + loginUser.getBirthday().substring(5,7)
					   + loginUser.getBirthday().substring(8,10);
	int userGender = 1;
	if(loginUser.getGender() == "F"){
		userGender = 2;
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>건강검진 예약안내</title>
     <!-- css -->
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/health_reservation/health_reservation.css">
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../common/main_header.jsp"/>
	<div class="health_reservation_wrap">
        <div class="health_reservation_container">
            <form action="reservation2" method="post">
                <div id="health_reservation_title">
                    국가 건강 검진 예약
                </div>
                <div class="health_reservation1_content">
                    <div id="reservation_content_title">
                        1. 검진자 정보
                    </div>
                    <p>검진자(성명)</p>
                        <div class="health_reservation1_content input_name">
                            <input type="text" required name="reservation_user_name" value="<%= loginUser != null ? loginUser.getUserName() : "" %>">
                        </div>
                    <p>주민번호</p>
                    <div class="health_reservation1_content input_id_num">
                        <input type="text" required name="reservation_user_num1"  value="<%= loginUser != null ? userBirth : "" %>"> - 
                        <input type="password" maxlength="1" required name="reservation_user_num2" value="<%= loginUser != null ? userGender : "" %>">
                        <p>******</p>
                    </div>
                    <p>핸드폰</p>
                    <div class="health_reservation1_content input_phone">
                        <select name="reservation_user_phone1">
                            <option value="010" <%= loginUser != null && loginUser.getPhone().startsWith("010") ? "selected" : "" %>>010</option>
                            <option value="011" <%= loginUser != null && loginUser.getPhone().startsWith("011") ? "selected" : "" %>>011</option>
                        </select>
                        <input type="text" placeholder=" -없이 입력하세요" 
                        required name="reservation_user_phone2"
                        value="<%= loginUser != null ? loginUser.getPhone().substring(3) : "" %>">
                    </div>
                    <p>이메일</p>
                    <div class="health_reservation1_content input_email">
                        <input type="text" name="reservation_user_email1"
                        value="<%= loginUser != null ? loginUser.getEmail().split("@")[0] : "" %>"> @
                        <select name="reservation_user_email2" id="">
                            <option value="naver.com" <%= loginUser != null && loginUser.getEmail().endsWith("naver.com") ? "selected" : "" %>>naver.com</option>
                            <option value="daum.net" <%= loginUser != null && loginUser.getEmail().endsWith("daum.net") ? "selected" : "" %>>daum.net</option>
                            <option value="gmail.com" <%= loginUser != null && loginUser.getEmail().endsWith("gmail.com") ? "selected" : "" %>>gmail.com</option>
                        </select>
                    </div>
                    <p>주소</p>
					<div class="health_reservation1_content input_address">
						<input type="text" id="sample6_postcode" name="postcode"
							placeholder="우편번호">
						<button type="button" class="address-button"
							onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
					</div>
					<div class="health_reservation1_content input_address">
						<input type="text" id="sample6_address" name="address"
							placeholder="주소"
							value="<%= loginUser != null ? loginUser.getAddress() : "" %>">
					</div>
					<div class="health_reservation1_content input_address">
						<input type="text" id="sample6_extraAddress" name="extraAddress"
							placeholder="참고사항">
					</div>
					<div class="health_reservation1_content input_address">
						<input type="text" id="sample6_detailAddress" name="detailAddress"
							placeholder="상세주소">
					</div>
                </div>
                <div class="health_reservation1_content2">
                    <div id="reservation_content_title">
                        2. 개인정보 수집 및 이용 동의
                    </div>
                    <div class="use_tos">
                        <p> 개인정보 수집 및 이용에 동의 하십니까?</p>
                        <label for="">
                            <input type="radio" name="use_tos_ans1" value="yes">동의함
                            <input type="radio" name="use_tos_ans1" value="no">동의 안함
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
                            <input type="radio" name="use_tos_ans2" value="yes">동의함
                            <input type="radio" name="use_tos_ans2" value="no">동의 안함
                        </label>
                    </div>
                </div>
                <div class="reservation_btn_area">
                    <button id="reservation_btn"  type="submit">다음</button>
                </div>
            </form>
        </div>
    </div>
    <script>
			function sample6_execDaumPostcode() {
				new daum.Postcode(
						{
							oncomplete : function(data) {
								var addr = '';
								var extraAddr = '';

								if (data.userSelectedType === 'R') {
									addr = data.roadAddress;
								} else {
									addr = data.jibunAddress;
								}

								if (data.userSelectedType === 'R') {
									if (data.bname !== ''
											&& /[동|로|가]$/g.test(data.bname)) {
										extraAddr += data.bname;
									}
									if (data.buildingName !== ''
											&& data.apartment === 'Y') {
										extraAddr += (extraAddr !== '' ? ', '
												+ data.buildingName
												: data.buildingName);
									}
									if (extraAddr !== '') {
										extraAddr = ' (' + extraAddr + ')';
									}
									document
											.getElementById("sample6_extraAddress").value = extraAddr;

								} else {
									document
											.getElementById("sample6_extraAddress").value = '';
								}

								document.getElementById('sample6_postcode').value = data.zonecode;
								document.getElementById("sample6_address").value = addr;
								document
										.getElementById("sample6_detailAddress")
										.focus();
							}
						}).open();
			}
		</script>
    <!-- footer -->
	<jsp:include page="../common/main_footer.jsp"/>
</body>
</html>