function sortPosts(sortType) {
    console.log("sortPosts function called with sortType:", sortType)
    const sortSelect = document.getElementById("sortSelect");
    const categoryId = sortSelect.dataset.categoryId; // data-category-id 값 가져오기
    console.log("categoryId in JS:", categoryId);
    console.log("sortType in JS:", sortType);

    const currentPage = 1; // 정렬 변경 시 첫 페이지로 이동
    const url = `${contextPath}/inquiry/main?categoryId=${categoryId}&sortType=${sortType}&cpage=${currentPage}`;
    window.location.href = url; // URL 변경
}