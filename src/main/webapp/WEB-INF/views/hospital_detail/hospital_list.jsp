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
        /* Common */
        body{
            font-family: "Noto Sans KR", system-ui;
        }

        /* SearchBar */
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

        /* Order */
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

        /* List */
        .list{
            border-bottom: 7px solid #ececec;
            font-family: "Noto Sans KR", system-ui;
        }
        .title{
            padding: 10px 0px;
        }
        .title p{
            font-size: large;
            font-weight: bold;
            color: black;
        }
        .openTime{
            padding: 5px 0px;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .openTime p{
            color: #9e9e9e;
            font-weight: bold;
        }
        .address{
            padding: 5px 0px;
        }
        .address p {
            color: #9e9e9e;
            font-weight: 500;
        }
        .tag{
            display: flex;
            justify-content: left;
            padding-top: 5px;
            padding-bottom: 20px;
            gap: 10px;
        }
        .tag button{
            border: 1px solid #dbdbdb;
            border-radius: 5px;
            background-color: #f4f4f4;
            color: #9e9e9e;
            padding: 2px 5px;
            font-size: 10px;
            font-weight: 600;
        }

    </style>
</head>
<body>
	<!-- Header -->
	<jsp:include page="/WEB-INF/views/common/FinalHeader.jsp" />
	
    <br><br>

    <div class="wrapper">
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
        <br>

        <!-- list -->
        <div class="list">
            <div class="title"><p>청담이든소아청소년과의원</p></div>
            <div class="openTime">금요일 09:00 ~ 19:00 | <p>소아청소년과</p></div>
            <div class="address"><p>서울 강남구 테헤란로 226 (태왕빌딩) 1층</p></div>
            <div class="tag">
                <button>어린이 국가예방접종</button>
                <button>영유아 검진</button>
                <button>주차장</button>
            </div>
        </div>
        <div class="list">
            <div class="title"><p>연세</p></div>
            <div class="openTime">금요일 09:00 ~ 19:00 | <p>소아청소년과</p></div>
            <div class="address"><p>서울 강남구 테헤란로 226 (태왕빌딩) 1층</p></div>
            <div class="tag">
                <button>어린이 국가예방접종</button>
                <button>영유아 검진</button>
                <button>주차장</button>
            </div>
        </div>
        <div class="list">
            <div class="title"><p>청담이든소아청소년과의원</p></div>
            <div class="openTime">금요일 09:00 ~ 19:00 | <p>소아청소년과</p></div>
            <div class="address"><p>서울 강남구 테헤란로 226 (태왕빌딩) 1층</p></div>
            <div class="tag">
                <button>어린이 국가예방접종</button>
                <button>영유아 검진</button>
                <button>주차장</button>
            </div>
        </div>
        <div class="list">
            <div class="title"><p>청담이든소아청소년과의원</p></div>
            <div class="openTime">금요일 09:00 ~ 19:00 | <p>소아청소년과</p></div>
            <div class="address"><p>서울 강남구 테헤란로 226 (태왕빌딩) 1층</p></div>
            <div class="tag">
                <button>어린이 국가예방접종</button>
                <button>영유아 검진</button>
                <button>주차장</button>
            </div>
        </div>
        
</div>

	<br><br>
	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/common/FinalFooter.jsp" />

	
</body>
</html>