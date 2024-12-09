$(document).ready(function () {

    // 창 크기 변경 시 Summernote 크기 동기화
    $(window).on('resize', syncSummernoteWidth);
    // Summernote 초기화
    initializeSummernote();

    // 답변 작성 버튼 클릭 시
    $('#submit-answer-btn').click(function () {
        let answerContent = $('#summernote-1').val();  // 작성된 답변 내용

        if (!answerContent.trim()) {
            alert('답변을 작성해주세요.');
            return;
        }

        // AJAX를 이용해 서버에 답변 저장 요청
        $.ajax({
            url: '/submitAnswer',  // 실제 처리할 서버 URL로 변경
            method: 'POST',
            data: {
                boardId: boardNo,  // 게시판 ID와 관련된 추가 데이터 필요
                answerContent: answerContent
            },
            success: function (response) {
                // 서버에서 응답받은 답변 리스트를 갱신
                $('#answer-list').prepend(`
                    <div class="board-content">
                        ${response.newAnswerContent}  <!-- 서버에서 받은 답변 내용 -->
                    </div>
                `);
                // 에디터 내용 초기화
                $('#summernote-1').summernote('reset');
            },
            error: function () {
                alert('답변 제출에 실패했습니다. 다시 시도해주세요.');
            }
        });
    });
});

// Summernote 초기화 함수
function initializeSummernote() {
    $('#summernote-1').summernote({
        minHeight: 400,
        maxHeight: null,
        placeholder: '글을 입력하세요.',
        tabsize: 2,
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['height', 'ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video']],
            ['view', ['fullscreen', 'codeview', 'help']]
        ],
        height: 400, // 고정 높이 설정 (필요에 따라 변경 가능)
        callbacks: {
            onImageUpload: function (imgs) {
                ImageUpload(imgs); // 이미지 업로드 처리
            },
            onChange: adjustHeight // 콘텐츠 변경 시 높이 조정
        }
    });
    syncSummernoteWidth(); // 초기 너비 동기화
}

// 창 크기 변경 시 에디터 크기 동기화
function syncSummernoteWidth() {
    const wrapperWidth = $('.post-wrapper').width();
    $('.note-editor').css('width', wrapperWidth);
}

// Summernote 내용 변경 시 높이 자동 조정
function adjustHeight(contents) {
    const editableArea = $('.note-editable');
    const scrollHeight = editableArea.prop('scrollHeight');
    editableArea.css('height', `${scrollHeight}px`); // 템플릿 리터럴로 수정
}

// Summernote에 이미지 업로드 기능
function ImageUpload(imgs) {
    const fd = new FormData();
    for (let i = 0; i < imgs.length; i++) {
        fd.append("imgList", imgs[i]);
    }

    $.ajax({
        url: contextPath + "/community/imgUpload", // 템플릿 리터럴로 수정
        type: "POST",
        data: fd,
        processData: false,
        contentType: false,
        dataType: "json",

        success: function (response) {
            console.log("파일 업로드 성공:", response);
            response.forEach(filePath => {
                $('#summernote-1').summernote('insertImage', filePath); // 이미지 삽입
            });
        },
        error: function (xhr, status, error) {
            console.error("AJAX Error:", status, error);
            alert("이미지 업로드 실패! 다시 시도해주세요.");
        }
    });
}


