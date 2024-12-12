document.addEventListener('DOMContentLoaded', function () {
    const selectedContainer = document.querySelector(".selected-container");
    const optionList = document.querySelector("#community-options");

    if (selectedContainer && optionList) {
        console.log("드롭다운 요소 발견");

        // 드롭다운 클릭 시 열고 닫기
        selectedContainer.addEventListener("click", () => {
            const isBlock = optionList.style.display === "block";
            optionList.style.display = isBlock ? "none" : "block";
            console.log("드롭다운 클릭됨, 상태:", isBlock ? "닫힘" : "열림");
        });

        // 드롭다운 외부 클릭 시 닫기
        document.addEventListener("click", (event) => {
            if (!selectedContainer.contains(event.target)) {
                optionList.style.display = "none";
            }
        });
    }

    // 드롭다운 옵션 클릭 시 페이지 이동
    document.querySelectorAll(".option-item").forEach(option => {
        option.addEventListener("click", function () {
            const categoryId = this.getAttribute("data-url");  // 선택된 카테고리 ID
            const categoryName = this.textContent.trim(); // 선택된 카테고리 이름

            // 선택된 카테고리 이름을 업데이트
            document.querySelector('.selected-option').textContent = categoryName;

            // 선택된 카테고리 ID로 페이지 이동
            if (categoryId) {
                const targetUrl = `${contextPath}/inquiry/main?categoryId=${categoryId}`;  // inquiry 페이지로 이동
                console.log("선택된 카테고리 URL:", targetUrl);
                window.location.href = targetUrl;
            }
        });
    });
});
