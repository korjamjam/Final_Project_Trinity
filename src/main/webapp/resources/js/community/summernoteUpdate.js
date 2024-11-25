let data = {
    contextPath: "",
    fileList: [],
};

$(document).ready(function () {
    data.contextPath = document.getElementById('context-path').dataset.baseUrl;

    // 기존 첨부파일 데이터가 있으면 초기화
    if (typeof attachedFilesJson !== "undefined" && Array.isArray(attachedFilesJson)) {
        console.log("attachedFilesJson 값:", attachedFilesJson);

        attachedFilesJson.forEach((file) => {
            data.fileList.push({
                name: file.originName,
                size: file.fileSize,
                allowDownload: file.allowDownload || "Y",
            });
        });
        console.log("파일 리스트 데이터:", data.fileList); // 데이터 확인
        renderFileList(); // 파일 리스트 렌더링
    } else {
        console.log("첨부파일 데이터가 존재하지 않거나 올바르지 않습니다.");}
    initializeSummernote();

    // 창 크기 변경 시 Summernote 크기 동기화
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
            ['view', ['fullscreen', 'codeview', 'help']],
        ],
        callbacks: {
            onImageUpload: function (imgs) {
                uploadImages(imgs);
            },
        },
    });
    syncSummernoteWidth();
}

// Summernote 너비 동기화
function syncSummernoteWidth() {
    const wrapperWidth = $('.post-wrapper').width();
    $('.note-editor').css('width', wrapperWidth);
}

// 첨부파일 리스트 렌더링
function renderFileList() {
    const fileListDiv = document.getElementById("file-list");
    fileListDiv.innerHTML = ""; // 기존 리스트 초기화

    if (data.fileList.length === 0) {
        document.getElementById("file-list-container").style.display = "none";
        return;
    }
    data.fileList.forEach((file, index) => {
        const fileSizeInKB = (file.size / 1024).toFixed(1);
        const allowDownload = file.allowDownload === "Y";

        const fileRow = `
            <div class="d-flex align-items-center mb-2">
                <span class="me-3">${file.name} (${fileSizeInKB} KB)</span>
                <button type="button" class="btn btn-sm ${allowDownload ? 'btn-success' : 'btn-secondary'} me-2" onclick="toggleDownload(${index})">
                    <i class="bi ${allowDownload ? 'bi-unlock' : 'bi-lock'}"></i>
                </button>
                <button type="button" class="btn btn-sm btn-danger" onclick="removeFile(${index})">
                    <i class="bi bi-trash"></i>
                </button>
            </div>
        `;
        fileListDiv.innerHTML += fileRow;
    });

    document.getElementById("file-list-container").style.display = data.fileList.length ? "block" : "none";
}

// 다운로드 허용/금지 토글
function toggleDownload(index) {
    const file = data.fileList[index];
    file.allowDownload = file.allowDownload === "Y" ? "N" : "Y";
    renderFileList(); // UI 업데이트
}

// 파일 삭제
function removeFile(index) {
    if (confirm("파일을 삭제하시겠습니까?")) {
        data.fileList.splice(index, 1);
        renderFileList(); // UI 업데이트
    }
}

// 이미지 업로드 처리
function uploadImages(imgs) {
    const fd = new FormData();
    imgs.forEach(img => fd.append("fileList", img));

    $.ajax({
        url: `${data.contextPath}/community/upload`,
        type: "POST",
        data: fd,
        processData: false,
        contentType: false,
        success: function (response) {
            response.forEach(filePath => {
                $('#summernote').summernote('insertImage', filePath);
            });
        },
        error: function () {
            alert("이미지 업로드에 실패했습니다.");
        },
    });
}
