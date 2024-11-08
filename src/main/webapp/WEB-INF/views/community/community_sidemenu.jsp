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
	href="${ pageContext.servletContext.contextPath }/resources/css/community/community_sidemenu.css">
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_public.css">
<title>Community SideMenu</title>
</head>
<body>
	<aside class="sidebar">
		<ul class="menu">
			<li><a href="community_main.me" id="popular">실시간 인기글<span class="arrow">›</span></a></li>
			<li><a href="community_free.me" id="free">자유게시판<span class="arrow">›</span></a></li>
			<li><a href="community_medical.me" id="meditalk">메디톡<span class="arrow">›</span></a></li>
			<li><a href="community_event.me" id="event">이벤트<span class="arrow">›</span></a></li>
		</ul>
		<div class="support-box">
			<p class="support-text">도움이 필요하신가요?</p>
			<a href="inquiry_qna.me" class="support-link">1:1 문의하기</a>
		</div>
	</aside>
</body>
</html>