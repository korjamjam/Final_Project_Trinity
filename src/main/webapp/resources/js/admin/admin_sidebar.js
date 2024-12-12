// 사이드바 열고 닫기
function toggleSidebar() {
    var sidebar = document.getElementById('sidebar');
    sidebar.classList.toggle('hamburger-show-sidebar');
}

// 로그아웃 처리
function navigateToLogout() {
    // 로그아웃 요청
    window.location.href = contextPath + "/member/logout";
}