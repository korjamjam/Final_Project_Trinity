<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/account/myidebar.css">
<title>Profile Sidebar</title>
<style>
    .profile-sidemenu .menu-table a.active {
        color: #6cc24a; /* 연두색 */
        font-weight: bold;
    }
</style>
</head>
<body>
    <div class="profile-sidemenu">
        <table class="menu-table">
            
            <tr>
                <th>
                    <!-- 복구 이메일 추가 -->
                    <a href="${pageContext.request.contextPath}/member/repair_email" id="recoveryEmail">복구 이메일 추가</a>
                </th>
                <td><span class="arrow">&gt;</span></td>
            </tr>
            
            <tr>
                <th>
                    <!-- 내 정보 수정 -->
                    <a href="${pageContext.request.contextPath}/member/profile_edit" id="profileEdit">내 정보 수정</a>
                </th>
                <td><span class="arrow">&gt;</span></td>
            </tr>
            
            <tr>
                <th>
                    <!-- 의사 신청 -->
                    <a href="${pageContext.request.contextPath}/member/profile_edit" id="profileEdit">의사 신청</a>
                </th>
                <td><span class="arrow">&gt;</span></td>
            </tr>
        </table>
        <div class="support-box">
            <p class="support-text">도움이 필요하신가요?</p>
            <a href="${pageContext.request.contextPath}/support/contact" class="support-link">1:1 문의하기</a>
        </div>
    </div>

    <script>
        // JSP에서 contextPath를 JavaScript 변수로 전달
        const contextPath = '${pageContext.request.contextPath}';

        // 현재 URL에서 type 파라미터 값을 추출하여 활성화된 메뉴 표시
        const currentPath = window.location.pathname;
        document.querySelectorAll('.menu-table a').forEach(link => {
            if (link.href.endsWith(currentPath)) {
                link.classList.add('active');
            }
        });

        // 구현되지 않은 페이지 처리 함수
        function handleUnavailablePage(event, pageName) {
            event.preventDefault(); // 기본 동작 막기
            alert(`${pageName} 페이지는 현재 구현되지 않았습니다.`);
            // 일정 시간 뒤 profile_edit 페이지로 이동
            setTimeout(() => {
                window.location.href = `${contextPath}/member/profile_edit`;
            }, 2000); // 2초 후 이동
        }
    </script>
</body>
</html>
