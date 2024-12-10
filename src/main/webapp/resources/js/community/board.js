$(document).ready(function() {
    function loadCategoryPosts(categoryId) {
        $.ajax({
            url: "/community/board",
            data: { categoryId: categoryId },
            success: function(data) {
                console.log(data);  // 서버 응답 내용을 확인
                $('#postsTable').html(data);  // 서버에서 받은 데이터를 게시글 목록에 업데이트
            },
            error: function(xhr, status, error) {
                console.error("AJAX 요청 실패: ", status, error);  // 오류 메시지 출력
            }
        });
    }

    // 카테고리 선택 시
    $('#categorySelect').change(function() {
        var categoryId = $(this).val();  // 문자열로 받아옴
        loadCategoryPosts(categoryId);
    });
});
  // 날짜 형식을 Date 객체로 변환
  function parseDate(dateStr) {
    const [year, month, day] = dateStr.split(".");
    return new Date(year, month - 1, day);
}

// 숫자만 추출하여 정수로 변환
function extractNumber(text) {
    return parseInt(text.replace(/[^0-9]/g, ''), 10);
}
function sortPosts(sortType) {
    console.log("sortPosts function called with sortType:", sortType)
    const sortSelect = document.getElementById("sortSelect");
    const categoryId = sortSelect.dataset.categoryId; // data-category-id 값 가져오기
    console.log("categoryId in JS:", categoryId);
    console.log("sortType in JS:", sortType);

    const currentPage = 1; // 정렬 변경 시 첫 페이지로 이동
    const url = `${contextPath}/community/sideBarToBoard?categoryId=${categoryId}&sortType=${sortType}&cpage=${currentPage}`;
    window.location.href = url; // URL 변경
}


