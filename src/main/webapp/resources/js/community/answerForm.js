$(document).ready(function () {
    // 창 크기 변경 시 Summernote 크기 동기화
    $(window).on('resize', syncSummernoteWidth);

    // Summernote 초기화
    initializeSummernote();
    console.log("게시글 번호 1:", boardNo); // 값 확인



    // Summernote 초기화 함수
    function initializeSummernote() {
        // 페이지 로드 후 에디터 위치로 스크롤 이동
      
    
        $('#summernote-1').summernote({
            minHeight: 300,
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
            height: 300, // 고정 높이 설정
            callbacks: {
                onInit: function () {
                    $('#summernote-1').next('.note-editor').find('.note-editable').focus(); // 에디터 포커스
                },
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
        editableArea.css('height', `${scrollHeight}px`);
    }

    // Summernote에 이미지 업로드 기능
    function ImageUpload(imgs) {
        const fd = new FormData();
        for (let i = 0; i < imgs.length; i++) {
            fd.append("imgList", imgs[i]);
        }

        $.ajax({
            url: contextPath + "/community/imgUpload", // 이미지 업로드 URL
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
});
