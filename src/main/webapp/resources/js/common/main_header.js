// function checkLogin(){
//     location.href = "${pageContext.request.contextPath}/reservation/form"
// }

// 페이지가 로드되었을 때 실행되는 코드
document.addEventListener("DOMContentLoaded", function () {

    // 사이드바 토글 함수: 사이드바 보임/숨김 상태 전환
    function toggleSidebar() {
        const sidebar = document.getElementById('sidebar');
        if (!sidebar) {
            console.error("Sidebar element not found");
            return;
        }
        sidebar.classList.toggle('hamburger-show-sidebar');
    }

    // 닫기 버튼 이벤트 바인딩
    const closeBtn = document.querySelector('.hamburger-close-btn');
    if (closeBtn) {
        closeBtn.addEventListener('click', toggleSidebar);
    } else {
        console.error("Close button not found");
    }

    // 메뉴 아이콘 이벤트 바인딩
    const menuIcon = document.querySelector('.menu-icon');
    if (menuIcon) {
        menuIcon.addEventListener('click', toggleSidebar);
    } else {
        console.error("Menu icon not found");
    }

});

// 로그인 상태 체크 후 예약 폼 페이지로 리다이렉트
function checkLogin() {
    location.href = "${pageContext.request.contextPath}/reservation/form";
}

