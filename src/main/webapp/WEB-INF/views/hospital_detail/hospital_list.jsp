<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String contextPath = request.getContextPath(); %>
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
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/hospital_detail/hospital_list.css">

</head>
<body>
	<!-- Header -->
	<jsp:include page="/WEB-INF/views/common/main_header.jsp" />
	
    <br><br>

    <div class="list_wrapper">
        <!-- searchBar -->
        <div class="list_searchBar">
            <input type="text">
            <button>병원 검색</button>
        </div>

        <br><br>

        <!-- order by -->
        <div class="list_order">
            <select name="subject" class="list_subject">
                <option value="list_child">소아과</option>
                <option value="list_mother">산부인과</option>
            </select>
            <select name="orderBy" class="list_orderBy">
                <option value="relevant">정확도순</option>
                <option value="popular">인기순</option>
            </select>
        </div>

        <hr>
        <br>

        <!-- list -->
        <div>
            <div class="list">
                <div class="list_title"><p>청담이든소아청소년과의원</p></div>
                <div class="list_openTime">금요일 09:00 ~ 19:00 | <p>소아청소년과</p></div>
                <div class="list_address"><p>서울 강남구 테헤란로 226 (태왕빌딩) 1층</p></div>
                <div class="list_tag">
                    <button>어린이 국가예방접종</button>
                    <button>영유아 검진</button>
                    <button>주차장</button>
                </div>
            </div>
            <div class="list">
                <div class="list_title"><p>청담이든소아청소년과의원</p></div>
                <div class="list_openTime">금요일 09:00 ~ 19:00 | <p>소아청소년과</p></div>
                <div class="list_address"><p>서울 강남구 테헤란로 226 (태왕빌딩) 1층</p></div>
                <div class="list_tag">
                    <button>어린이 국가예방접종</button>
                    <button>영유아 검진</button>
                    <button>주차장</button>
                </div>
            </div>
            <div class="list">
                <div class="list_title"><p>청담이든소아청소년과의원</p></div>
                <div class="list_openTime">금요일 09:00 ~ 19:00 | <p>소아청소년과</p></div>
                <div class="list_address"><p>서울 강남구 테헤란로 226 (태왕빌딩) 1층</p></div>
                <div class="list_tag">
                    <button>어린이 국가예방접종</button>
                    <button>영유아 검진</button>
                    <button>주차장</button>
                </div>
            </div>
            <div class="list">
                <div class="list_title"><p>청담이든소아청소년과의원</p></div>
                <div class="list_openTime">금요일 09:00 ~ 19:00 | <p>소아청소년과</p></div>
                <div class="list_address"><p>서울 강남구 테헤란로 226 (태왕빌딩) 1층</p></div>
                <div class="list_tag">
                    <button>어린이 국가예방접종</button>
                    <button>영유아 검진</button>
                    <button>주차장</button>
                </div>
            </div>
        </div> 
    </div>

	<br><br>
	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/common/main_footer.jsp" />

	
</body>
</html>