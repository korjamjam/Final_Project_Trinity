$(document).ready(function () {
    initializeSummernote();

    // 창 크기 변경 시 Summernote 크기 조정
    $(window).on('resize', syncSummernoteWidth);
});

// Summernote 초기화
function initializeSummernote() {
    $('#summernote').summernote({
        minHeight: 400,
        maxHeight: null,
        placeholder: '글을 입력하세요.',
        tabsize: 2,
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video']],
            ['view', ['fullscreen', 'codeview', 'help']]
        ],
        callbacks: {
            onImageUpload: fileUpload, // 이미지 업로드 콜백
            onChange: adjustHeight // 글 내용 변경 시 높이 자동 조정
        }
    });

    syncSummernoteWidth();
}

// Summernote 너비 동기화
function syncSummernoteWidth() {
    const wrapperWidth = $('.post-wrapper').width();
    $('.note-editor').css('width', wrapperWidth);
}

// 글 내용에 따라 Summernote 높이 조정
function adjustHeight(contents) {
    const editableArea = $('.note-editable');
    const scrollHeight = editableArea.prop('scrollHeight');
    editableArea.css('height', `${scrollHeight}px`);
}

// 이미지 업로드 처리 (Summernote 연동)
function fileUpload(imgs) {
    // `data-base-url` 속성에서 Base URL 가져오기
    const baseUrl = document.getElementById('context-path').getAttribute('data-base-url'); // 여기가 data-base-url을 읽는 부분

    const fd = new FormData();
    for (let i = 0; i < imgs.length; i++) {
        fd.append("fileList", imgs[i]);
    }

    $.ajax({
        url: `${baseUrl}/community/upload`, // baseUrl을 활용
        type: "POST",
        data: fd,
        processData: false,
        contentType: false,
        dataType: "json",
        success: function (response) {
            response.forEach(filePath => {
                $('#summernote').summernote('insertImage', filePath);
            });
        },
        error: function () {
            alert("이미지 업로드 실패! 다시 시도해주세요.");
        }
    });
}
