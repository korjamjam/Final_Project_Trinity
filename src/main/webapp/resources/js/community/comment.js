$(function () {
   
    const sendData = {
        bno: boardNo // EL로 전달된 boardNo 사용
    };
    getReplyList(sendData, function (commentList) {


        if (!Array.isArray(commentList)) {
            console.error("replyList가 배열이 아닙니다. 서버 응답을 확인하세요.");
            return;
        }

        // 댓글 갯수 표시
        setReplyCount(commentList.length);

        // 댓글 목록 렌더링
        const replyBody = document.querySelector("#commentList");

        if (!replyBody) {
            console.error("#commentList 요소를 찾을 수 없습니다.");
            return;
        }
        drawReplyList(replyBody, commentList);
    });
});

function drawReplyList(tBody, commentList) {
    console.log("갱신된 댓글 목록:", commentList);

    // 기존 댓글 목록 초기화
    $(tBody).empty();

    // 댓글 목록 렌더링
    commentList.forEach((comment) => {
        const commentWriter = comment.commentWriter || "알 수 없음";
        const commentContent = comment.commentContent || "내용 없음";
        const createDate = comment.createDate || "날짜 없음";
        const likeCount = comment.likeCount || 0;
        const dislikeCount = comment.dislikeCount || 0; // dislikeCount 추가
        const commentId = comment.commentNo;

        // 댓글 row 생성
        const replyRow = document.createElement("tr");
        replyRow.setAttribute("data-comment-no", commentId); // 댓글 ID를 저장

        // 댓글 내용을 설정
        replyRow.innerHTML = `
            <td>${commentWriter}</td>
            <td>${commentContent}</td>
            <td>${createDate}</td>
            <td>
                <!-- 좋아요 버튼 -->
                <button class="like-btn ${comment.isLiked ? 'liked' : ''}" onclick="handleLikeButtonClick(this)">
                    👍<span>${likeCount}</span>
                </button>
                <!-- 싫어요 버튼 -->
                <button class="dislike-btn ${comment.isDisliked ? 'liked' : ''}" onclick="handleDislikeButtonClick(this)">
                    👎<span>${dislikeCount}</span>
                </button>
            </td>
        `;

        // 댓글 row 추가
        $(tBody).append(replyRow);
    });
}



function setReplyCount(count) {
    $("#rcount").text(count);
}

function getReplyList(data, callback) {

    $.ajax({
        url: "rlist",
        data: data,
        success: function (res) {
            console.log("서버 응답 데이터:", res); // 서버에서 반환된 데이터 출력
            if (Array.isArray(res)) {
                callback(res);
            } else {
                console.error("댓글 목록이 배열이 아닙니다. 서버 응답을 확인하세요:", res);
                alert("댓글 목록을 불러오는 데 실패했습니다. 서버 응답을 확인하세요.");
            }
        },
        error: function () {
            console.error("댓글 목록을 가져오는 데 실패했습니다.");
            alert("댓글 목록을 가져오는 중 문제가 발생했습니다.");
        }
    });
}
$(document).off('click', '#addReplyButton').on('click', '#addReplyButton', function () {
    console.log("댓글 등록 버튼 클릭");
    addReply();
});

function addReply() {
    const content = $("#content").val(); // 댓글 작성 텍스트박스 값 가져오기
    console.log("입력된 댓글 내용:", content); // 값 확인
    if (!content.trim()) {
        alert("댓글 내용을 입력해주세요.");
        return;
    }

    const button = $(".btn-secondary");
    button.css({ backgroundColor: "#265708", color: "#fff" }); // 클릭 시 강제로 스타일 유지

    // 데이터 확인용 콘솔 로그
    const data = {
        refBno: boardNo,
        userNo: loginUserNo,
        commentWriter: loginUserId,
        commentContent: content
    };
    console.log("AJAX 요청 데이터:", data); // 데이터 확인

    // AJAX 호출
    addReplyAjax(
        data,
        function (res) { // 콜백 함수
            if (res === "success") {
                $("#content").val(""); // 댓글 입력창 초기화

                getReplyList({ bno: boardNo }, function (commentList) {
                    setReplyCount(commentList.length);
                    drawReplyList(document.querySelector("#commentList"), commentList);
                });
            } else {
                console.error("댓글 등록 실패");
            }
        }
    );
}


function addReplyAjax(data, callback) {
    console.log("서버로 전송할 데이터:", data); // 전송 데이터 확인
    $.ajax({// 페이지 로드 시 사용자 정보를 설정
        url: "rinsert.bo",
        type: "POST",
        data: data,
        success: function (res) {
            callback(res);
        },
        error: function () {
            console.error("댓글 등록 실패");
        }
    });
}


// 좋아요 상태 토글 처리
function handleLikeButtonClick(button) {
    const commentNo = button.closest("tr").getAttribute("data-comment-no");
    const isLiked = button.classList.contains("liked");

    toggleLikeDislike(button, commentNo, true, isLiked);
}

function handleDislikeButtonClick(button) {
    const commentNo = button.closest("tr").getAttribute("data-comment-no");
    const isDisliked = button.classList.contains("liked");

    toggleLikeDislike(button, commentNo, false, isDisliked);
}

function toggleLikeDislike(button, commentNo, isLike, currentState) {
    const userNo = loginUserNo;

    if (!userNo) {
        alert("로그인이 필요합니다.");
        return;
    }

    if (currentState) {
        alert(isLike ? "이미 좋아요를 누르셨습니다." : "이미 싫어요를 누르셨습니다.");
        return;
    }

    $.ajax({
        url: "toggleLike.bo",
        type: "POST",
        data: {

            commentNo: commentNo,
            userNo: userNo,
            isLike: isLike ? 1 : 0 // boolean을 숫자로 변환
        },
        success: function (response) {           

            if (response.success) {
                const likeButton = button.closest("tr").querySelector(".like-btn");
                const dislikeButton = button.closest("tr").querySelector(".dislike-btn");

                // 좋아요/싫어요 버튼 상태 업데이트
                if (isLike) {
                    likeButton.classList.add("liked");
                    dislikeButton.classList.remove("liked");
                } else {
                    dislikeButton.classList.add("liked");
                    likeButton.classList.remove("liked");
                }

                // 좋아요/싫어요 수 업데이트
                likeButton.querySelector("span").textContent = response.likeCount || 0;
                dislikeButton.querySelector("span").textContent = response.dislikeCount || 0;

                alert(response.message); // 서버 메시지 표시
            } else {
                alert(response.message || "처리 중 오류가 발생했습니다.");
            }
        },
        error: function () {
            alert("서버와의 통신 중 문제가 발생했습니다.");
        }
    });
}





function toggleComments() {
    const commentSection = document.getElementById("comment-section");
    const toggleButton = document.getElementById("toggle-comments-button");
    const arrow = document.getElementById("arrow");

    if (commentSection.style.display === "none" || commentSection.style.display === "") {
        commentSection.style.display = "block";
        toggleButton.innerHTML = '댓글 닫기 <span id="arrow">&#9650;</span>'; // 위쪽 화살표
    } else {
        commentSection.style.display = "none";
        toggleButton.innerHTML = '댓글 열기 <span id="arrow">&#9660;</span>'; // 아래쪽 화살표
    }
}