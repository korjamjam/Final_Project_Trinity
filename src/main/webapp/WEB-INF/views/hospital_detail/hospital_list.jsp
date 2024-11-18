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

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <!-- JS -->
    <script src="${ pageContext.servletContext.contextPath }/resources/js/hospital_detail/hospital_list.js"></script>

</head>
<body>
	<!-- Header -->
	<jsp:include page="/WEB-INF/views/common/main_header.jsp" />
	
    <br><br>

    <div class="hospitalList_list_wrapper">
        <!-- searchBar -->
        <div class="hospitalList_list_searchBar">
            <input type="text">
            <button>병원 검색</button>
        </div>

        <br><br>

        <!-- order by -->
        <div class="hospitalList_list_order_wrapper">
            <div class="hospitalList_list_order">
                <select id="hospitalList_subject" name="hospitalList_subject" class="hospitalList_list_subject">
                    <option value="listAll" selected>전체</option>
                    <option value="listChild">소아과</option>
                    <option value="listMother">산부인과</option>
                </select>
                <select id="hospitalList_order" name="hospitalList_order" class="hospitalList_list_orderBy">
                    <option value="ASC">글자순</option>
                    <option value="relevant">정확도순</option>
                    <option value="popular">인기순</option>
                </select>
            </div>
        </div>


        <div class="hospitalList_list_wrapper2">
            <hr>
            <br>
		
            <!-- list -->
            <c:forEach var="h" items="${list}">
                <div class="hospitalList_list">
                    <div class="hospitalList_list_title"><a href="${pageContext.request.contextPath}/hospital/detail?hosNo=${h.hosNo}"><p>${h.hosName }</p></a></div>
                    <div class="hospitalList_list_openTime">평일 ${h.hosStartTime1} ~ ${h.hosEndTime1} | <p>${h.department }</p></div>
                    <div class="hospitalList_list_address"><p>${h.hosAddress}</p></div>
                    <div class="hospitalList_list_tag">
                        <button>어린이 국가예방접종</button>
                        <button>영유아 검진</button>
                        <button>주차장</button>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div id="loadingLine"></div>
    </div>

	<br><br>
	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/common/main_footer.jsp" />

	
</body>
</html>