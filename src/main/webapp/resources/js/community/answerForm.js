$(document).ready(function () {
    // 창 크기 변경 시 Summernote 크기 동기화
    $(window).on('resize', syncSummernoteWidth);

    // Summernote 초기화
    initializeSummernote();
    console.log("게시글 번호 1:", boardNo); // 값 확인

    // 답변 작성 버튼 클릭 시
    $('#submit-answer-btn').click(function () {
        let answerContent = $('#summernote-1').val(); // 작성된 답변 내용

        if (!answerContent.trim()) {
            alert('답변을 작성해주세요.');
            return;
        }

        // AJAX 호출
        $.ajax({
            url: contextPath + '/community/submitAnswer', // 컨트롤러의 매핑 URL
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                boardNo: boardNo,  // 원본 게시글 번호
                answerContent: answerContent, // 작성한 답변 내용
                userNo: loginUserNo,  // 로그인 사용자 ID (변수명 맞게 수정)
                isMedicalField: 'Y',  // 의료 전문가 여부
              
            }),

            success: function (response) {
                console.log("게시글 번호 4:", boardNo); // 값 확인
                const newAnswerHtml = `
                    <div class="board-content answer-item">
                        <div class="expert-photo">
                        </div>
                        <div class="answer-content">
                            <div class="expert-card">
                                <div class="expert-photo">
                                    <img src="${contextPath}/resources/img/doctor.jpg" alt="의사아이콘">
                                </div>
                                <div class="expert-info-summary">
                                    <div class="expert-name"><strong>작성자 : </strong> ${response.doctorName}</div>
                                     <p class="small-text">${response.medicalFieldId}</p>
                                    <div class="answer-date"><strong>작성일 : </strong> ${response.answerDate}</div>
                                  
                                </div>
                            </div>
                            ${response.answerContent}
                        </div>
                    </div>
                `;
                $('#answer-list').prepend(newAnswerHtml); // 새 답변을 맨 위에 추가
                $('#summernote-1').summernote('reset'); // 에디터 초기화
            },
            error: function (xhr) {
                console.error("오류 발생:", xhr);
                alert('답변 제출에 실패했습니다. 다시 시도해주세요.');
            }
        });
    }); // 이 부분에서 중괄호 닫는 위치가 정확합니다.


    // Summernote 초기화 함수
    function initializeSummernote() {
        // 페이지 로드 후 에디터 위치로 스크롤 이동
        const editorPosition = $('#answer-section').offset().top; // 에디터 위치 계산
        window.scrollTo({
            top: editorPosition, // 에디터 위치로 이동
            behavior: 'auto' // 즉각 이동
        });

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
