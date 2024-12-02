let data = {
    contextPath: "",
    fileList: [],
};
document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('.btn-download').forEach(button => {
        button.addEventListener('click', function () {
            const fileCard = this.closest('.file-card');
            const allowDownload = fileCard.getAttribute('data-allow-download');
            const downloadUrl = fileCard.getAttribute('data-download-url');

            if (allowDownload === 'Y' && downloadUrl) {
                // 파일 다운로드
                window.location.href = downloadUrl;
            } else {
                // 다운로드 불가 메시지
                alert('이 파일은 다운로드할 수 없습니다.');
            }
        });
    });
});


document.querySelectorAll('.btn-download').forEach(button => {
    button.addEventListener('click', function () {
        const fileCard = this.closest('.file-card');
        const allowDownload = fileCard.getAttribute('data-allow-download');
        const downloadUrl = fileCard.getAttribute('data-download-url');

        if (allowDownload === 'Y' && downloadUrl) {
            window.location.href = downloadUrl; // 파일 다운로드
        } else {
            alert('이 파일은 다운로드할 수 없습니다.'); // 알림
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
    el.style.display = el.style.display === "block" ? "none" : "block";
}

function moveSelectPage(page) {
    window.location.href = page;
}
