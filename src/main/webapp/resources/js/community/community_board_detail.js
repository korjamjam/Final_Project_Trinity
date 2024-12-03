document.addEventListener('DOMContentLoaded', function () {
    console.log("드롭다운 초기화 시작");

    const selectedContainer = document.querySelector(".selected-container");
    const optionList = document.querySelector("#community-options");

    if (selectedContainer && optionList) {
        console.log("드롭다운 요소 발견");

        selectedContainer.addEventListener("click", () => {
            const isBlock = optionList.style.display === "block";
            optionList.style.display = isBlock ? "none" : "block";
            console.log("드롭다운 클릭됨, 상태:", isBlock ? "닫힘" : "열림");
        });

        document.addEventListener("click", (event) => {
            if (!selectedContainer.contains(event.target)) {
                optionList.style.display = "none";
            }
        });
    }

    // 드롭다운 옵션 클릭 시 동작
    document.querySelectorAll(".option-item").forEach(option => {
        option.addEventListener("click", function () {
            const categoryId = this.getAttribute("data-url");
            const categoryName = this.textContent.trim(); // 카테고리 이름 가져오기

            // 선택된 카테고리 이름을 업데이트
            document.querySelector('.selected-option').textContent = categoryName;

            // 선택된 카테고리 ID로 페이지 이동
            if (categoryId) {
                console.log("선택된 카테고리 URL:", `/boardDetail?categoryId=${categoryId}`);
                window.location.href = `/trinity/community/board?categoryId=${categoryId}`;
            }
        });
    });
});

// 게시글 데이터를 로드하는 함수
function loadPosts(categoryUrl) {
    fetch(categoryUrl)
        .then((response) => response.json())
        .then((posts) => {
            const postContainer = document.querySelector(".post-list");
            postContainer.innerHTML = ""; // 기존 목록 초기화

            posts.forEach((post) => {
                const postElement = document.createElement("div");
                postElement.classList.add("post-item");
                postElement.innerHTML = `
                    <h3>${post.title}</h3>
                    <p>${post.summary}</p>
                    <span>${post.date}</span>
                `;
                postContainer.appendChild(postElement);
            });
        })
        .catch((error) => console.error("게시글 데이터를 가져오는 중 오류 발생:", error));
}

// 게시글 삭제 공통 함수
function deletePost(boardNo) {
    if (confirm("정말 삭제하시겠습니까?")) {
        location.href = `delete.bo?bno=${boardNo}`;
    }
}

// 드롭다운 옵션 이동 공통 함수
function moveSelectPage(page) {
    window.location.href = page;
}
