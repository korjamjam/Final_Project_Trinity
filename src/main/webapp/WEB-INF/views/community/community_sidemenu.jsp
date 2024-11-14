<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/community/community_sidemenu.css">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_public.css">
<title>Community SideMenu</title>
<style>
    .community-sidemenu .menu-table a.active {
        color: #6cc24a; /* 연두색 */
        font-weight: bold;
    }
</style>
</head>
<body>
    <div class="community-sidemenu">
        <table class="menu-table">
            <tr>
                <th><a href="community_main.me?type=popular" id="popular">실시간 인기글</a></th>
                <td><span class="arrow">&gt;</span></td>
            </tr>
            <tr>
                <th><a href="${ pageContext.servletContext.contextPath }/community/board?type=free" id="free">자유게시판</a></th>
                <td><span class="arrow">&gt;</span></td>
            </tr>
            <tr>
                <th><a href="${ pageContext.servletContext.contextPath }/community/board?type=meditalk" id="meditalk">메디톡</a></th>
                <td><span class="arrow">&gt;</span></td>
            </tr>
            <tr>
                <th><a href="${ pageContext.servletContext.contextPath }/community/board?type=event" id="event">이벤트</a></th>
                <td><span class="arrow">&gt;</span></td>
            </tr>
        </table>
        <div class="support-box">
            <p class="support-text">도움이 필요하신가요?</p>
            <a href="inquiry_qna.me" class="support-link">1:1 문의하기</a>
        </div>
    </div>

    <script>
        // 현재 URL에서 type 파라미터 값을 추출
        const params = new URLSearchParams(window.location.search);
        const type = params.get('type');

        // 모든 메뉴 링크를 선택하고, type에 따라 active 클래스 적용
        document.querySelectorAll('.menu-table a').forEach(link => {
            // 각 링크의 href에서 type 값을 추출
            const linkType = new URLSearchParams(link.href.split('?')[1]).get('type');
            
            // 현재 type과 링크의 type이 일치하면 active 클래스 추가
            if (type === linkType) {
                link.classList.add('active');
            }
        });
    </script>
</body>
</html>
