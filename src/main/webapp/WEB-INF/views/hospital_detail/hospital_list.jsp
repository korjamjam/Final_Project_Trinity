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
            	<option value="list_all" selected>전체</option>
                <option value="list_child">소아과</option>
                <option value="list_mother">산부인과</option>
            </select>
            <select name="orderBy" class="list_orderBy">
            	<option value="relevant" selected>글자순</option>
                <option value="relevant">정확도순</option>
                <option value="popular">별점순</option>
            </select>
        </div>
		
		<script>
		//스크롤이벤트에 부여하기
			function getHospitalList() {
			    const selectBox1 = document.getElementsByName("subject");
			    const selectedValue1 = selectBox.value;
			    const selectBox2 = document.getElementsByName("orderBy");
			    const selectedValue2 = selectBox.value;
			
			
			    $.ajax({
			        url: "${pageContext.request.contextPath}/hospital/list", // Controller 매핑된 URL
			        type: "GET",
			        data: { selectedValue1: selectedValue1, selectedValue2: selectedValue2 }, // 선택된 값 전달
			        success: function(response) {
			            console.log("서버 응답: ", response);
			        },
			        error: function(error) {
			            console.error("에러 발생:", error);
			        }
			    });
			};
		</script>
		
        <hr>
        <br>

        <!-- list -->
        <div>
            <c:forEach var="h" items="${list}">
                <div class="list">hospital_detail
                    <div class="list_title"><a href="location.href='hospital/detail?hno=${h.hpId}'"><p>청담이든소아청소년과의원</p></a></div>
                    <div class="list_openTime">평일 ${h.startTime} ~ ${h.endTime} | <p>소아청소년과</p></div>
                    <div class="list_address"><p>${h.address}</p></div>
                    <div class="list_tag">
                        <button>어린이 국가예방접종</button>
                        <button>영유아 검진</button>
                        <button>주차장</button>
                    </div>
                </div>
            </c:forEach>
        </div>  
    </div>
    
    <!-- <script>
    	function getReplyList(data, callback){
        	$.ajax({
	            url: "rlist.bo",
	            data: data,
	            success: function(res){
	                callback(res)
	            },
	            error: function(){
	
	            }
	        })
    </script> -->

	<br><br>
	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/common/main_footer.jsp" />

	
</body>
</html>