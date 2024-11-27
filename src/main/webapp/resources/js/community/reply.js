let data = {
    contextPath: "",
    fileList: [],
};

$(function () {
    const sendData = {
        bno: $("#bno").val() // bno 값을 숨겨진 input에서 가져옴
    };

    getReplyList(sendData, function (replyList) {
        console.log("댓글 목록 요청 데이터:", data); // 요청 데이터 출력
        console.log("갱신된 댓글 목록:", replyList);

        if (!Array.isArray(replyList)) {
            console.error("replyList가 배열이 아닙니다. 서버 응답을 확인하세요.");
            return;
        }

        // 댓글 갯수 표시
        setReplyCount(replyList.length);

        // 댓글 목록 렌더링
        const replyBody = document.querySelector("#commentList");

        if (!replyBody) {
            console.error("#commentList 요소를 찾을 수 없습니다.");
            return;
        }
        drawReplyList(replyBody, replyList);
    });
});

function drawReplyList(tBody, replyList) {
    console.log("tBody 값:", tBody); // tBody의 현재 값 출력
    console.log("replyList:", replyList); // 서버에서 받은 댓글 목록 확인

    // replyList가 배열인지 확인
    if (!Array.isArray(replyList)) {
        console.error("replyList가 배열이 아닙니다:", replyList);
        return;
    }

    if (!tBody || !(tBody instanceof HTMLElement)) {
        console.error("drawReplyList: 유효하지 않은 tbody 요소입니다.");
        return;
    }

    // 기존 댓글 목록 초기화
    $(tBody).empty();

    // 댓글 목록 렌더링
    replyList.forEach((reply, index) => {
        console.log(`댓글 데이터 [${index}]:`, reply); // 각 댓글 데이터 확인



        // 댓글 데이터 필드 확인 및 기본값 설정
        const replyWriter = reply.replyWriter || "알 수 없음";
        const replyContent = reply.replyContent || "내용 없음";
        const createDate = reply.createDate || "날짜 없음";
        const likeCount = reply.likeCount || 0;
        const replyId = reply.replyNo || `temp_${Math.random().toString(36).substr(2, 9)}`; // replyNo가 없을 경우 기본값

        // 댓글 row 생성
        const replyRow = document.createElement("tr");

        // `data-comment-no` 속성 설정
        replyRow.setAttribute("data-comment-no", replyId);

        // 댓글 내용을 설정
        replyRow.innerHTML = `
            <td>${replyWriter}</td>
            <td>${replyContent}</td>
            <td>${createDate}</td>
            <td>
                <button class="like-button" onclick="toggleLike(this)">
                    👍 <span>${likeCount}</span>
                </button>
            </td>
        `;

        // 댓글 row 추가
        $(tBody).append(replyRow);

        // 댓글 클릭 이벤트 추가
        replyRow.onclick = function () {
            if (replyId) {
                console.log(`${replyId} 클릭됨`);
            } else {
                console.warn("replyNo가 정의되지 않았습니다:", reply);
            }
        };
    });
}





function setReplyCount(count) {
    $("#rcount").text(count);
}

function getReplyList(data, callback) {
    console.log("댓글 목록 요청 데이터:", data); // bno 확인
    $.ajax({
        url: "rlist.bo",
        data: data,
        success: function (res) {
            callback(res);
        },
        error: function () {
            console.error("댓글 목록을 가져오는 데 실패했습니다.");
        }
    });
}

function addReply() {

    const boardNo = $("#bno").val(); // bno 값을 숨겨진 input에서 가져옴
    const userId = $("#loginUserId").val(); // userId 값을 숨겨진 input에서 가져옴
    const userNo = $("#loginUserNo").val(); // 사용자 번호
    const content = $("#content").val();
    if (!content.trim()) {
        alert("댓글 내용을 입력해주세요.");
        return;
    }
    const button = $(".btn-secondary");
    button.css({ backgroundColor: "#265708", color: "#fff" }); // 클릭 시 강제로 스타일 유지
    addReplyAjax(
        {
            refBno: boardNo,
            userNo: userNo,
            replyWriter: userId,
            replyContent: content
        },

        function (res) {
            if (res === "success") {
                $("#content").val(""); // 댓글 입력창 초기화

                getReplyList({ bno: boardNo }, function (replyList) {
                    setReplyCount(replyList.length);
                    drawReplyList(document.querySelector("#commentList"), replyList);
                });
            }
        }
    );
}

function addReplyAjax(data, callback) {
    console.log("서버로 전송할 데이터:", data); // 요청 데이터 확인
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
function toggleLike(button) {
    console.log("toggleLike 실행됨"); // 함수 호출 여부 확인
    const commentNo = button.closest("tr").getAttribute("data-comment-no");
    console.log(commentNo);
    // CURRENT_USER_NO 초기화 및 확인
    const CURRENT_USER_NO = $("#loginUserNo").val();
    if (!CURRENT_USER_NO) {
        console.error("로그인 사용자 정보가 없습니다. 로그인 후 이용해주세요.");
    } else {
        console.log("CURRENT_USER_NO:", CURRENT_USER_NO);
    }
    if (commentNo) {

        $.ajax({
            url: "toggleLike.bo",
            type: "POST",
            data: { commentNo, userNo: CURRENT_USER_NO },
            success: function (response) {

                console.log("서버 응답:", response); // 서버 응답 확인
                if (response.success) {
                    const likeCount = button.querySelector("span");
                    likeCount.textContent = response.likeCount; // 좋아요 수 업데이트

                    // 좋아요 상태에 따라 버튼 스타일 변경
                    if (response.likeStatus === 1) {
                        button.classList.add("liked");
                    } else {
                        button.classList.remove("liked");
                    }
                } else {
                    alert("좋아요 처리에 실패했습니다.");
                }
            },
            error: function () {
                alert("서버와의 통신 중 문제가 발생했습니다.");
            }
        });
    }
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