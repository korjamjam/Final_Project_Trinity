let data = {
    contextPath: "",
    fileList: [],
};



function deletePost(boardNo) {
    if (confirm("정말로 삭제하시겠습니까?")) {
        location.href = `delete.bo?bno=${boardNo}`;
    }
}

function showAndHide(selector) {
    const el = document.querySelector(selector);
    el.style.display = el.style.display === "block" ? "none" : "block";
}

function moveSelectPage(page) {
    window.location.href = page;
}
