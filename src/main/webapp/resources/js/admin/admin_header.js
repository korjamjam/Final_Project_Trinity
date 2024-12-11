function toggleSidebar() {
    var sidebar = document.querySelector('.hamburger-sidebar');
    if (sidebar) {
        sidebar.classList.toggle('hamburger-show-sidebar');
    } else {
        console.error("Sidebar element with class 'hamburger-sidebar' not found.");
    }
}
