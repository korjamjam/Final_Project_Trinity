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

    document.querySelectorAll(".option-item").forEach(option => {
        option.addEventListener("click", function () {
            const categoryUrl = this.getAttribute("data-url");
            if (categoryUrl) {
                console.log("선택된 URL:", categoryUrl);
                window.location.href = categoryUrl;
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
