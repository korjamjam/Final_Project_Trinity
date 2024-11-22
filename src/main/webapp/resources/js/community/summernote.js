

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
    const fd = new FormData();
    for (let i = 0; i < imgs.length; i++) {
        fd.append("fileList", imgs[i]);
    }

    $.ajax({
        url: `${pageContext.request.contextPath}/community/upload`,
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

// 파일 검증 로직
function checkFileValidation(input) {
    const files = input.files;
    const maxFileSize = 5 * 1024 * 1024; // 5MB
    const maxFileCount = 3;

    // 파일 개수 체크
    if (files.length > maxFileCount) {
        alert("파일은 최대 3개까지만 선택할 수 있습니다.");
        input.value = ""; // 선택된 파일 초기화
        return;
    }

    // 파일 크기 체크
    for (let file of files) {
        if (file.size > maxFileSize) {
            alert(`파일 "${file.name}"의 크기가 5MB를 초과합니다.`);
            input.value = ""; // 선택된 파일 초기화
            return;
        }
    }

    // 파일 목록 업데이트
    updateFileList(input);
}


// 첨부파일 목록 업데이트
function updateFileList(input) {
    const fileListDiv = document.getElementById("file-list-container"); // file-list를 감싸는 상위 컨테이너
    const fileList = document.getElementById("file-list");
    fileList.innerHTML = ""; // 기존 내용 초기화

    const files = input.files;

    // 파일이 없을 때 컨테이너를 숨김
    if (!files || files.length === 0) {
        fileListDiv.style.display = "none"; // 컨테이너 숨기기
        return;
    }

    fileListDiv.style.display = "block"; // 파일이 있을 때 컨테이너 보이기
    Array.from(files).forEach((file, index) => {
        const fileSizeInKB = (file.size / 1024).toFixed(1); // 파일 크기를 KB로 변환
        const fileRow = `
            <div class="file-item">
                <div>
                    <span>${file.name} (${fileSizeInKB} KB)</span>
                </div>
                <div>
                    <button type="button" class="btn btn-sm btn-outline-primary allow-download-btn" 
                            data-allow="true" data-index="${index}" 
                            onclick="toggleDownload(this)">
                        <i class="bi bi-arrow-down-circle"></i>
                    </button>
                </div>
            </div>
        `;
        fileList.innerHTML += fileRow;
    });
}


// 다운로드 허용 토글
function toggleDownload(button) {
    const isAllowed = button.getAttribute("data-allow") === "true";
    if (isAllowed) {
        button.setAttribute("data-allow", "false");
        button.classList.remove("btn-outline-primary");
        button.classList.add("btn-outline-secondary");
        button.innerHTML = '<i class="bi bi-lock"></i>'; // 자물쇠 아이콘
    } else {
        button.setAttribute("data-allow", "true");
        button.classList.remove("btn-outline-secondary");
        button.classList.add("btn-outline-primary");
        button.innerHTML = '<i class="bi bi-arrow-down-circle"></i>'; // 다운로드 아이콘
    }
}
