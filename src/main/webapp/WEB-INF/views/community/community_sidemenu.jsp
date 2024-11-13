<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
    href="${ pageContext.servletContext.contextPath }/resources/css/community/community_sidemenu.css">
<link rel="stylesheet"
    href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_public.css">
<title>Community SideMenu</title>
</head>
<body>
    <div class="community-sidemenu">
        <table class="menu-table">
            <tr>
                <th><a href="community_main.me" id="popular">실시간 인기글</a></th>
                <td><span class="arrow">&gt;</span></td>
            </tr>
            <tr>
                <th><a href="community_free.me" id="free">자유게시판</a></th>
                <td><span class="arrow">&gt;</span></td>
            </tr>
            <tr>
                <th><a href="community_medical.me" id="meditalk">메디톡</a></th>
                <td><span class="arrow">&gt;</span></td>
            </tr>
            <tr>
                <th><a href="community_event.me" id="event">이벤트</a></th>
                <td><span class="arrow">&gt;</span></td>
            </tr>
        </table>
        <div class="support-box">
            <p class="support-text">도움이 필요하신가요?</p>
            <a href="inquiry_qna.me" class="support-link">1:1 문의하기</a>
        </div>
    </div>
</body>
</html>
