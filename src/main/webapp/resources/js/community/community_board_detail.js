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



    function deletePost() {
        if (confirm("정말로 이 게시글을 삭제하시겠습니까?")) {
            alert("게시글이 삭제되었습니다.");
            window.location.href = 'community.jsp'; // 삭제 후 리다이렉트
        }
    }

    function showAndHide(selector) {
        const el = document.querySelector(selector);
        el.style.display = el.style.display === "block" ? "none" : "block";
    }

    function moveSelectPage(page) {
        window.location.href = page;
    }

    document.addEventListener("DOMContentLoaded", function () {

        // 드롭다운 외부 클릭 시 닫기
        document.addEventListener("click", (event) => {
            if (!event.target.closest(".custom-dropdown")) {
                document.querySelector(".option-list").style.display = "none";
            }
        });
    });

    function deletePost(boardNo) {
        if (confirm("정말 삭제하시겠습니까?")) {
            location.href = `delete.bo?bno=${boardNo}`;
        }
    }
