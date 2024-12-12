<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctoring Footer</title>

    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/main_footer_style.css">
    
    
</head>
<body>


    <footer class="footer">
        <!-- a태그로 사이트 이동 -->
        <nav class="footer-links">
            <a href="#">이용약관</a>
            <a href="#">사이트맵</a>
            <a href="#">비급여진료비</a>
            <a href="#">환자권리장전</a>
            <a href="#">개인정보처리 방침</a>
            
        </nav>
        <br>

        <!-- 푸터 기본 정보 (추후 수정) -->
        <div class="footer-info">
            <p>cs@supportgettogether.com 이메일 문의</p>
            <p>평일 10:00 - 18:00 (점심시간 12:30 - 13:30 / 주말, 공휴일 제외)</p>
            <p>커뮤니티는 정보제공목적이며 당사의 입장이 아닙니다. 따라서 커뮤니티는 상품 거래정보 및 거래에 대하여 책임을 지지 않습니다.</p>
        </div>

        <div class="footer-logo">
            <img src="${ pageContext.servletContext.contextPath }/resources/img/Doctoring.png" alt="주사기 아이콘" class="footer-icon">
            <a href="#" class="footer-logo-text">닥터링</a>
            <div class="horizontal-line"></div>
        </div>


        <div class="footer-company">
            <p>KH정보교육원 | 사업자등록번호 : 437-86-00763 | 사업자등록번호 : 851-87-00622 | 서울 강남 제1014호</p>
            <p>대표자 : 오태영 | 책임자 : 오태영 | 개인정보관리책임자 : 전제민</p>
        </div>
    </footer>

</body>
</html>