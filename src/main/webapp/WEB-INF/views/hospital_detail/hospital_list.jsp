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
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/defalut.css">
    <!-- <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/main.css"> -->

    <style>
        /* searchBar */
        .searchBar{
            display: flex;
            justify-content: center;
            gap: 20px;
        }
        .searchBar input{
            display: flex;
            justify-content: center;
            border: 1px solid grey;
            border-radius: 5px;
            width: 200px;
            height: 30px;
            font-size: 12px;
        }
        .searchBar button{
            border: 1px solid #dbdbdb;
            border-radius: 5px;
            background-color: #f4f4f4;
            font-size: 12px;
            padding: 0px 5px;
        }

        /* order */
        .order{
            display: flex;
            justify-content: center;
            gap: 37px;
            margin-bottom: 10px;
        }
        .order button{
            border: 1px solid #dbdbdb;
            border-radius: 5px;
            padding: 5px;
            background-color: white;
        }
        .subject{
            border: 1px solid #dbdbdb;
            border-radius: 5px;
        }
        .orderBy{
            border: 1px solid #dbdbdb;
            border-radius: 5px;
        }

    </style>
</head>
<body>
	<!-- Header -->
	<jsp:include page="/WEB-INF/views/common/main_header.jsp" />
	
    <br><br>

    <!-- searchBar -->
	<div class="searchBar">
         <input type="text">
         <button>병원 검색</button>
    </div>

    <br><br>

    <!-- order by -->
    <div class="order">
        <button>위치선택</button>
        <select name="subject" class="subject">
            <option value="child">소아과</option>
            <option value="mother">산부인과</option>
        </select>
        <select name="orderBy" class="orderBy">
            <option value="relevant">정확도순</option>
            <option value="popular">인기순</option>
        </select>
    </div>

    <hr>

    <!-- list -->
    <div>
        
    </div>
    
	<br><br>
	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/common/main_header.jsp" />

	
</body>
</html>