function filterPosts() {
    const filter = document.getElementById('filterSelect').value;
    const items = document.querySelectorAll('.post-item');

    items.forEach(item => {
        const category = item.getAttribute('data-category');
        if (filter === '전체' || category === filter) {
            item.style.display = '';
        } else {
            item.style.display = 'none';
        }
    });
}