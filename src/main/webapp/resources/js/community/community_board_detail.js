document.addEventListener('DOMContentLoaded', function () {

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

     // 드롭다운 옵션 클릭 시 페이지 이동
     document.querySelectorAll(".option-item").forEach(option => {
        option.addEventListener("click", function () {
            const categoryId = this.getAttribute("data-url");
            const categoryName = this.textContent.trim(); // 카테고리 이름 가져오기

            // 선택된 카테고리 이름을 업데이트
            document.querySelector('.selected-option').textContent = categoryName;

            // 선택된 카테고리 ID로 페이지 이동
            if (categoryId) {
                const targetUrl = `${contextPath}/community/main?categoryId=${categoryId}`;
                console.log("선택된 카테고리 URL:", targetUrl);
                window.location.href = targetUrl;
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


function deleteBoard(bno, categoryId) {
    console.log("삭제 글번호 ", bno);
    console.log("categoryId:", categoryId);  // categoryId 값을 확인

    if (confirm("정말 게시글을 삭제하시겠습니까?")) {
        console.log("삭제 글번호 ", bno);
        console.log("categoryId:", categoryId);
        console.log("boardNo: ${b.boardNo}, categoryId: ${b.categoryId}");

        $.ajax({
            url: contextPath + "/community/deleteBoard",  // contextPath를 포함한 URL로 수정
            type: "POST",
            data: { bno: bno, categoryId: categoryId }, // categoryId도 보내는 것을 확인
            success: function(response) {
                // 게시글 삭제 후, 해당 게시판으로 이동
                if (response === "ok") {
                    alert("게시글 삭제완료.");
                    // categoryId를 사용하여 해당 게시판 페이지로 이동
                    window.location.href = contextPath + "/community/main?categoryId=" + categoryId;
                } else {
                    alert("게시글 삭제에 실패했습니다.");
                }
            },
            error: function(xhr, status, error) {
                alert("게시글 삭제에 실패했습니다.");
            }
        });
    }
}

//병원 페이지 리턴 하는거
function deleteBoardAC(bno, categoryId) {
    console.log("삭제 글번호 ", bno);
    console.log("categoryId:", categoryId);  // categoryId 값을 확인

    if (confirm("정말 게시글을 삭제하시겠습니까?")) {
        console.log("삭제 글번호 ", bno);
        console.log("categoryId:", categoryId);
        console.log("boardNo: ${b.boardNo}, categoryId: ${b.categoryId}");

        $.ajax({
            url: contextPath + "/community/deleteBoard",  // contextPath를 포함한 URL로 수정
            type: "POST",
            data: { bno: bno, categoryId: categoryId }, // categoryId도 보내는 것을 확인
            success: function(response) {
                // 게시글 삭제 후, 해당 게시판으로 이동
                if (response === "ok") {
                    alert("게시글 삭제완료.");
                    // categoryId를 사용하여 해당 게시판 페이지로 이동
                    window.location.href = contextPath + "/hospital/account/myPost";
                } else {
                    alert("게시글 삭제에 실패했습니다.");
                }
            },
            error: function(xhr, status, error) {
                alert("게시글 삭제에 실패했습니다.");
            }
        });
    }
}



// 드롭다운 옵션 이동 공통 함수
function moveSelectPage(page) {
    window.location.href = page;
}
// 답변하기 버튼 클릭 시 이동하는 함수

    function handleAnswerClick(url) {
        console.log("handleAnswerClick URL: ", url);  // URL이 잘 전달되는지 확인
        if(url) {
            window.location.href = url;  // URL이 정의되었으면 해당 URL로 이동
        } else {
            console.error("URL이 정의되지 않았습니다.");
        }
    }
    function toggleLike(answerNo, userNo, isLike) {
        $.ajax({
            url: `${contextPath}/likeDislike`,
            type: 'POST',
            data: {
                answerNo: answerNo,
                userNo: userNo,
                isLike: isLike
            },
            success: function (response) {
                if (response.success) {
                    alert(response.message);
                    // 좋아요/싫어요 카운트 업데이트
                    $(`button[data-answer-no="${answerNo}"] .like-count`).text(response.likeCount);
                    $(`button[data-answer-no="${answerNo}"] .dislike-count`).text(response.dislikeCount);
                } else {
                    alert(response.message);
                }
            },
            error: function () {
                alert("서버와 통신 중 오류가 발생했습니다.");
            }
        });
    }
    
    
    