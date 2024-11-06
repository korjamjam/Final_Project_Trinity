<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% String path = request.getContextPath(); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>닥터링</title>

<!-- searchBar icon -->
<link rel="favicon" href="<%=path%>/resources/img/favicon.ico" />
<link rel="icon" href="<%=path%>/resources/img/favicon.ico"
	type="image/x-icon" />

<!-- font style -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<!-- icon -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<!-- css -->
<link rel="stylesheet" href="<%=path%>/resources/css/common/defalut.css">
<link rel="stylesheet" href="<%=path%>/resources/css/main.css">
</head>
<body>
	<title>닥터링</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/main.jsp" />

</body>
</html>