document.addEventListener("DOMContentLoaded", function () {
    // 드롭다운 외부 클릭 시 닫기
    document.addEventListener("click", (event) => {
        if (!event.target.closest(".custom-dropdown")) {
            const dropdown = document.querySelector(".option-list");
            if (dropdown) dropdown.style.display = "none";
        }
    });
});

function deletePost(boardNo) {
    if (confirm("정말로 삭제하시겠습니까?")) {
        location.href = `delete.bo?bno=${boardNo}`;
    }
}

function showAndHide(selector) {
    const el = document.querySelector(selector);
    if (el) el.style.display = el.style.display === "block" ? "none" : "block";
}

function moveSelectPage(page) {
    window.location.href = page;
}

function incrementLike(answerId) {
    const likeCountSpan = document.getElementById(`like-count-${answerId}`);
    if (likeCountSpan) {
        const currentCount = parseInt(likeCountSpan.textContent, 10);
        likeCountSpan.textContent = currentCount + 1;
    }
}
