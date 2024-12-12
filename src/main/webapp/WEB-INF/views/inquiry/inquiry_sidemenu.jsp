<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/inquiry/inquiry_sidemenu.css">
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_public.css">
<title>Community SideMenu</title>
</head>
<body>
	<aside class="inquiry-sidebar">
		<ul class="inquiry-menu">
			<li><a href="${pageContext.servletContext.contextPath}/inquiry/main?categoryId=CAT04">공지사항<span class="arrow">›</span></a></li>
			<li> <a href="${pageContext.servletContext.contextPath}/inquiry/main?categoryId=CAT05">알림판<span class="arrow">›</span></a></li>
			<li><a href="${pageContext.servletContext.contextPath}/inquiry/main?categoryId=CAT06">FAQ<span class="arrow">›</span></a></li>
			<li><a href="${pageContext.servletContext.contextPath}/inquiry/main?categoryId=CAT07">Q&A<span class="arrow">›</span></a></li>
		</ul>
	</aside>
</body>
</html>
